<div class="content">
	<div class="left-box">
		<?php echo form_open('forgot'); ?>
		<p>
			Email Address:
			<input type="text" size="35" id="email" name="email" value="<?php echo set_value('email'); ?>" />
		</p>
		<p>
			Enter the text from the image below:
			<input type="text" size="35" id="captcha" name="captcha" /> 
			<?php echo $captcha['image']; ?>
		</p>
		<br/><br/>
		<p>
			<?php echo form_submit('submit','Submit');  ?>
			<a href="<?php echo base_url() ?>">Cancel</a>
		</p>
		<?php echo form_close(); ?>
	</div>

	<div class="right-box">
		<h1>Press Releases</h1>
		<?php foreach($articles as $article) { ?>
		<p>
		<strong><?php echo $article['name']; ?></strong> - <?php echo $article['date']; ?><br />
		<?php echo $article['article']; ?>
		</p><br />
		<?php } ?>
	</div>
</div>