<div id="tabs">
	<ul>
		<li><a id="dashboard-anchor" href="<?php echo base_url() . "provider/dashboard";?>" />Dashboard</a></li>
		<li><a id="patients-anchor" href="<?php echo base_url() . "provider/patients";?>" />Patients</a></li>		
		<li><a id="protocols-anchor" href="<?php echo base_url() . "provider/protocols";?>" />Protocols</a></li>
		<li><a id="notes-anchor" href="<?php echo base_url() . "provider/notes";?>" />Notes</a></li>		
		<li><a id="notifications-anchor" href="<?php echo base_url() . "provider/notifications";?>" />Notifications</a></li>
	</ul>

	<div id="dashboard"></div>	
	<div id="patients"></div>
	<div id="protocols"></div>
	<div id="notes"></div>	
	<div id="notifications"></div>
</div>


<script>


$(document).ready(function() {
	//----------------------------------------------------------------------
	// jQuery Tabs
	//----------------------------------------------------------------------
	$(function() {
		$( "#tabs" ).tabs({
			beforeLoad: function( event, ui ) {
				ui.jqXHR.error(function() {
					ui.panel.html(
						"Unable to load tab informations" 
					);
				});
			},
		});
	});
});
</script>

