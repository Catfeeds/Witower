<? $this->view('header') ?>

<div id="left" class="span9">
	<? $this->view('alert') ?>
	<div class="model model-b">
		<div class="main">
			<form method="post">
				<div class="control-group">
					<div class="controls">
						<input type="text" name="name" placeholder="创意标题" value="<?=set_value('name', $wit['name'])?>" style="width: 676px;" />
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<textarea name="content" class="wysiwyg"><?=set_value('content', $wit['content'])?></textarea>
					</div>
				</div>
				<div class="control-group">
					<div class="controls">
						<button type="submit" name="submit" class="btn btn-primary">提交</button>
					</div>
				</div>
			</form>
		</div>
	</div>
</div>

<?$this->view('wit/sidebar')?>

<? $this->view('footer') ?>
