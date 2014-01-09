<div class="notes half">
	<?php echo $notes; ?>
</div>

<div class="new_note half">
<h3>Create a New Note</h3>

<?php echo form_open('register_provider', array('class' => 'edit')); ?>
Subject:
<input type="text" size="35" id="subject" name="subject" value="<?php echo set_value('subject'); ?>" />

Note:<br/>
<textarea cols="50" rows="20" id="note" name="note" value="<?php echo set_value('note'); ?>" /><br/><br/>
<a class="button">Save Note</a>
<?php echo form_close() ?>

</div>

<script>
 $(document).ready(function(){ 
	$(function() {
		$( "#accordion" ).accordion({
			collapsible: true
		});
	});
	$(document).on('click', '.button', function() {
	
	//$('.button').click(function() {
		$( '.notes' ).html(<?php echo base_url() . "images/loading.gif"; ?>);
	
		$.ajax({
			type: "POST",
			url: "<?php echo base_url() . "provider/notes/save" ?>",
			data: $('.edit').serialize(),
			success: function(data) {
				if(data == "error") {
					$( '.new_note').append("<br /><br /><span class=\"error\">Please fill in a Subject and a Note</span>");
				}
				else {
					$( '.notes' ).append(data);
				}
			},
		});
	});
});
</script>