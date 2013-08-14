<? $this->view('header') ?>
<div id="content" class="page-viewvote model-view">
	<ul class="breadcrumb">
		<li>
			<strong><a href="#">投票</a></strong>
			<span class="divider">/</span>
		</li>
		<li>
			<?=$project['name']?>
		</li>
	</ul>
	<div id="left">

		<div class="model model-b">
			<div class="main">
				<div class="info">
<?if($this->user->isLogged('witadmin') && $project['status']=='witting'){?>
					<a href="/project/end/<?=$project['id']?>" class="btn pull-right">结束投票</a>
<?}?>
					<?=$this->image('avatar',$project['company'],100)?>
					<ul>
						<li><b>发布企业：</b><?= $project['company_name'] ?>
							<span><?followButton($project['company'])?></span>
						</li>
						<li><b>发布金额：</b><?= $project['bonus'] ?>元 </li>
						<li>
							<b>被编辑次数：</b><?=$versions?>次&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<b>被讨论次数：</b><?=count($comments)?>次&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
							<b>投票截止日期：</b><?= $project['vote_end'] ?>
						</li>
						<li><b>活动状态：</b><?=lang($project['status'])?></li>
						<li class="tags">
							<b>标签：</b>
	<?foreach($project['tags'] as $tag){?>
							<a href="＃"><?= $tag ?></a>
	<?}?>
						</li>
					</ul>
				</div>
				<div class="info">
					<?=$this->image('project',$project['id'],100)?>
					<div>
						<p><?= $project['summary'] ?></p>
					</div>
				</div>
			</div>
		</div>
		<div class="model model-b voting">
			<form id="voteForm" method="post">
				<div class="title"><h3>候选人名单及投票</h3></div>
				<div class="tail">
					<div class="button-set">
<?if($project['status']!=='voting'){?>
						项目不在投票阶段
<?}elseif($voted){?>
						您已经投票了！
<?}else{?>
						<button type="submit" name="vote" class="btn btn-primary">投票</button>
						<button type="reset" class="btn">重选</button>
<?}?>						
					</div>
<?if($project['status']==='voting' && !$voted){?>
					<div class="flags">
						<img src="/style/flag.png"><img src="/style/flag.png"><img src="/style/flag.png">
					</div>                         
<?}?>						
				</div>
				<div class="main">
					<table>
<?foreach($candidates as $candidate){?>
						<tr>
							<td><?=$this->image('avatar',$candidate['id'],'100')?></td>
							<td><?=$candidate['name']?></td>
<?if(!$voted){?>
							<td class="images">
								<img src="/style/flag-off.png"><img src="/style/flag-off.png"><img src="/style/flag-off.png"><input name="candidate[<?=$candidate['id'] ?>]" type="hidden">                                    
							</td>
<?}?>						
							<td>
								<div class="bar" style="width:<?if($sum_votes==0){?>0<?}else{?><?=round($candidate['votes']/$sum_votes*100,1)?><?}?>px; background-color:#<?=dechex(rand(0,15)),dechex(rand(0,7)),dechex(rand(0,15))?>"></div>
								<span><?=$candidate['votes']?> (<?if($sum_votes==0){?>尚无投票<?}else{?><?=round($candidate['votes']/$sum_votes*100,1)?>%<?}?>)</span></td>
							<td><a href="#"><!--TODO-->Ta的贡献</a></td>
						</tr>
<?}?>
					</table>
				</div>
				<div class="tail">
					<div class="button-set">
<?if($project['status']!=='voting'){?>
						项目不在投票阶段
<?}elseif($voted){?>
						您已经投票了！
<?}else{?>
						<button type="submit" name="vote" class="btn btn-primary">投 票</button>
						<button type="reset" class="btn">重 选</button>
<?}?>						
					</div>
				</div>
			</form>
		</div>
		<div class="model model-b">
			<div class="main">
				<div class="detail">
					<div class="title">公司介绍</div>
					<div class="main">
						<a href="/space/<?=$project['company']?>"><?=$this->image('avatar',$project['company'],100)?></a>
						<p><?=$company['description'] ?></p>
					</div>
				</div>
				<div class="detail">
					<div class="title">产品说明</div>
					<div class="main">
						<?=$this->image('product',$project['product'],100)?>
						<p><?=$product['description'] ?></p>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div id="right" class="sidebar">

		<div class="box">

			<div class="title">
				<h3>参与人员（<?=count($voters)?>）</h3><a href="#" class="more">more</a>
			</div>
			<div class="main participator">
				<ul>
<?foreach($voters as $voter){?>
					<li>
						<?=$this->image('avatar',$voter['id'],100,50)?>
						<a href="/space/<?=$voter['id']?>">
							<span class="ellipsis"><?=$voter['name']?></span>
						</a>
						<?followButton($voter['id'])?>                    
					</li>
<?}?>	
				</ul>
			</div>
		</div>

		<div class="box">
			<div class="title">
				<h3>热门的标签</h3><a href="#" class="more">more</a>
			</div>
			<div class="main tags-cloud">
				<a href="#" ><?//TODO?></a>
			</div>
		</div>

		<div class="box">
			<div class="title">
				<h3>推荐活动</h3><a href="#" class="more">more</a>
			</div>
			<div class="main">
				<ul>
					<li> <a href="/project/<?//TODO?>"><?//?></a></li>
				</ul>
			</div>
		</div>

		<div class="box">
			<div class="title">
				<h3>投票进行时</h3><a href="#" class="more">more</a>
			</div>
			<div class="main">
				<ul>
					<li> <a href="/vote/<?//?>"><?//?></a></li>
				</ul>
			</div>
		</div>

	</div>
</div>

<?
$this->view('footer')?>