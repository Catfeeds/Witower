<?php
class Project_model extends WT_Model{
	function __construct() {
		parent::__construct();
		$this->table='project';
		$this->fields=array(
			'product'=>'所属产品',
			'name'=>'项目名称',
			'summary'=>'项目介绍',
			'wit_start'=>'创意开始日期',
			'wit_end'=>'创意结束日期',
			'vote_start'=>'投票开始日期',
			'vote_end'=>'投票结束日期',
			'bonus'=>'悬赏奖金',
			'company'=>'公司',
			'witters'=>'参与人数'
		);
	}
	
	function fetch($id=NULL){
		$project=parent::fetch($id);
		$project['company_name']=$this->user->fetch($project['company'],'name');
		return $project;
	}
	
	function getList($args = array()) {
		
		$this->db->join('user','user.id = project.company','inner')
			->select('project.*, user.name AS company_name');
		
		if(isset($args['count'])){
			$this->db->select('COUNT(*) AS `count`',false);
		}
		
		if(isset($args['sum'])){
			$this->db->select("SUM(`{$args['sum']}`) AS sum");
		}
		
		if(isset($args['is_active']) && $args['is_active']){
			$this->db->where('CURDATE() >= project.wit_start AND CURDATE() <= project.wit_end',NULL,false);
		}
		
		if(isset($args['is_voting']) && $args['is_voting']){
			$this->db->where('CURDATE() >= project.vote_start AND CURDATE() <= project.vote_end',NULL,false);
		}
		
		return parent::getList($args);
	}
	
	/**
	 * 获得一个项目下所有创意版本的评论
	 * @param int $project_id
	 * @return array
	 */
	function getComments($project_id=NULL){
		
		is_null($project_id) && $project_id=$this->id;
		
		$this->db->select('version_comment.*')
			->from('version_comment')
			->join('version','version.id = version_comment.version','inner')
			->join('wit','wit.id = version.wit','inner')
			->select('wit.id AS wit')
			->join('project','project.id = wit.project','inner')
			->select('project.id AS project, project.name AS project_name')
			->join('user','user.id = version_comment.user','inner')
			->select('user.name AS username')
			->where('project.id',$project_id);
		
		return $this->db->get()->result_array();
	}
	
	/**
	 * 获得一个项目以及所属产品的标签
	 * @param type $project_id
	 * @return type
	 */
	function getTags($project_id=NULL){
		
		$project=$this->fetch($project_id);
		
		is_null($project_id) && $project_id=$this->id;
		
		$this->db->select('tag.*')
			->from('tag')
			->where('id IN (SELECT tag FROM project_tag WHERE project = '.intval($project['id']).')',NULL,false)
			->or_where('id IN (SELECT tag FROM product_tag WHERE product = '.intval($project['product']).')',NULL,false);
		
		$result=$this->db->get()->result_array();
		
		return array_sub($result,'name');
	}
	
	function countWits($project_id=NULL){
		is_null($project_id) && $project_id=$this->id;
		return $this->db->from('wit')->where('project',$project_id)->count_all_results();
	}
	
	function countVersions($project_id=NULL){
		is_null($project_id) && $project_id=$this->id;
		$project_id=intval($project_id);
		return $this->db->from('version')->where("wit IN (SELECT id FROM wit WHERE project  = $project_id)")->count_all_results();
	}
	
	/**
	 * 
	 * @param int $project_id
	 * @return array 
	 *	array(
	 *		array(
	 *			'percentage'=>0.5,
	 *			'votes'=>2,
	 *			'candidate'=>5,
	 *			'candidate_name'=>'user_1'
	 *		),
	 *		array(
	 *			'percentage'=>0.5,
	 *			'votes'=>2,
	 *			'candidate'=>6,
	 *			'candidate_name'=>'user_2'
	 *		)
	 *	)
	 */
	function getCandidates($project_id=NULL){
		is_null($project_id) && $project_id=$this->id;
		
		$this->db->from('project_candidate')
			->where('project',$project_id);
		
		$candidates=$this->db->get()->result_array();
		
		foreach($candidates as &$candidate){
			$candidate['id']=$candidate['candidate'];
			$candidate['name']=$this->user->fetch($candidate['id'],'name');
			$candidate['percentage']=round($candidate['votes']/$this->countVotes($project_id),3);
		}
		
		return $candidates;
	}
	
	/**
	 * 获得一个项目的投票总数
	 * @param int $project_id
	 * @return int
	 */
	function countVotes($project_id=NULL){
		is_null($project_id) && $project_id=$this->id;
		
		$this->db->select('SUM(votes) AS sum',false)
			->from('project_vote');
		
		if($project_id!==false){
			$this->db->where('project',$project_id);
		}
		
		return $this->db->get()->row()->sum;
	}
	
	/**
	 * 获得一个项目的投票人总数
	 * @param int $project_id
	 * @return int
	 */
	function countVoters($project_id=NULL){
		is_null($project_id) && $project_id=$this->id;
		
		$this->db->select('COUNT(voter) AS count',false)
			->from('project_vote');
		
		if($project_id!==false){
			$this->db->where('project',$project_id);
		}
		
		return $this->db->get()->row()->count;
	}
	
	/**
	 * 用户给一个候选人投票
	 * 将写入project_vote表，并累加project_candidate表
	 * @param int $candidate
	 * @param int $votes
	 * @todo
	 */
	function vote($candidate, $votes){
		
	}
	
}
?>