<div class="full-box">
	<h4>Instructions for use:</h4><br/>
	Add an exercise to the protocol by clicking an exercise picture. A green plus sign will appear.<br/>
	Fill in the appropriate exercise parameters.<br/>
	Add additional exercises by clicking additional pictures. The exercise parameters will be auto-filled, and may be edited by typing new values into the text boxes.<br/>
	Remove exercises by clicking the Remove button next to the exercise.<br/>
	Save the added exercises by clicking the Save Exercises button.<br/>
	Data will only be collected from exercises set as Active. Deactivate exercises a patient should no longer perform.<br/>
</div>

<table class="tables">
	<tr class="protocol">
		<th class="protocol">Protocol Name</th>
		<th class="protocol">Mandatory Exercise</th>
		<th class="protocol">Required Reps</th>
		<th class="protocol">Start Date</th>
		<th class="protocol">End Date</th>
	</tr>
	<?php foreach($protocol as $row) { ?>
		<?php if($row['active'] == 1) { ?>
		<tr class="protocol">
			<td class="protocol"><?php echo $row['name']; ?></td>
			<td class="protocol"><?php echo ($row['mandatory']) ? "Yes" : "No"; ?>
			<td class="protocol"><?php echo $row['reps']; ?></td>
			<td class="protocol"><?php echo $row['start_date']; ?></td>
			<td class="protocol"><?php echo $row['end_date']; ?></td>
		</tr>
		<?php } ?>
	<?php } ?>
</table>

<script><!--
$(document).ready(function() {
	// Protocol table styling
	$("tr:odd").css( "background-color", "#E9E9E9" );
	$("tr").css( "border-top", "1px solid #000000" );
	$("tr.protocol:last").css( "border-bottom", "1px solid #000000" );
});
--></script>

