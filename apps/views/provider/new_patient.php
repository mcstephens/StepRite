<div class="content">
	<div class="left-box">
		<?php echo form_open('provider/new_patient'); ?>
		
	<table id="tables">
		<tr>
			<td class="left">Your Medical Record Number for Patient:</td>
			<td class="right"><input type="text" name="mrn" id="mrn" size="35" value="<?php echo set_value('mrn'); ?>" /></td>
		</tr>
		
		<tr>
			<td class="left">Patient's First Name:</td>
			<td class="right"><input type="text" name="first_name" id="first_name" size="35" value="<?php echo set_value('first_name'); ?>" /></td>
		</tr>
		
		<tr>
			<td class="left">Patient's Last Name:</td>
			<td class="right"><input type="text" name="last_name" id="last_name" size="35" value="<?php echo set_value('last_name'); ?>" /></td>
		</tr>
		
		<tr>
			<td class="left">Patient's Phone Number:</td>
			<td class="right"><input type="text" name="phone_num" id="phone_num" size="35" value="<?php echo set_value('phone_num'); ?>" /></td>
		</tr>
		
		<tr>
			<td class="left">Patient's Email:</td>
			<td class="right"><input type="text" name="email" id="email" size="35" value="<?php echo set_value('email'); ?>" /></td>
		</tr>

		<tr>
			<td class="left">Name of Patient's Rehabilitation Provider:</td>
			<td class="right"><input type="text" name="pt" id="pt" size="35" value="<?php echo set_value('pt'); ?>" /></td>
		</tr>
		
		<tr>
			<td class="left">Name of Patient's Doctor:</td>
			<td class="right"><input type="text" name="dr" id="dr" size="35" value="<?php echo set_value('dr'); ?>" /></td>
		</tr>

		<tr>
			<td class="left">Patient's Height in Inches:</td>
			<td class="right"><input type="text" name="height" id="height" size="3" value="<?php echo set_value('height'); ?>" /></td>
		</tr>
		
		<tr>
			<td class="left">Patient's Weight in Pounds:</td>
			<td class="right"><input type="text" name="weight" id="weight" size="3" value="<?php echo set_value('weight'); ?>" /></td>
		</tr>	
		
		<tr>
			<td class="left">Injured Leg:</td>
			<td class="right">
				<input type="radio" name="injured_leg" id="left" value="0" /> Left 
				<input type="radio" name="injured_leg" id="right" value="1" checked />Right
			</td >
		</tr>
		
		<tr>
			<td class="left">Sets of each exercise:</td>
			<td class="right">
				<select class="c-select" name="sets">
					<option name="sets" value="1">1 Time Per Day</option>
					<option name="sets" value="2">2 Times Per Day</option>
					<option name="sets" value="3" selected>3 Times Per Day</option>
					<option name="sets" value="4">4 Times Per Day</option>
					<option name="sets" value="5">5 Times Per Day</option>
					<option name="sets" value="6">6 Times Per Day</option>
					<option name="sets" value="7">7 Times Per Day</option>
					<option name="sets" value="8">8 Times Per Day</option>
					<option name="sets" value="9">9 Times Per Day</option>
				</select>
			</td>
		</tr>

		<tr><td colspan="3"><hr /></td></tr>

		<tr><td colspan="3">Mandatory Pressure/Standing Protocol</td></tr>

		<tr>
			<td  class="left">Should the patient use a crutch:</td>
			<td class="right">
				<input type="radio" name="c_pressure" value="1"/>Yes 
				<input type="radio" name="c_pressure" value="0" checked />No
			</td>
		</tr>
		<tr>
			<td class="left">Pressure Percent: <input type="text" name="pressure" id="pressure" size="3" value="<?php echo set_value('pressure'); ?>" style="background: none; border:0; font-weight:bold; font-size: 1.3em; color: #FF0000; display: inline;" /></td>
			
			<td class="right">
				
				<div id="pressure-slider" style="width:250px;"></div>
			</td>
		</tr>
		
		<tr><td colspan="3" style="padding: 20px 0px;"><hr /></td></tr>

		<tr>
			<td colspan="3">Mandatory Gait Protocol</td>
		</tr>
		<tr>
			<td class="left">Should the patient use a crutch:</td>
			<td class="right">
				<input type="radio" name="c_gait" value="1"/>Yes 
				<input type="radio" name="c_gait" value="0" checked />No
			</td>
		</tr>
		<tr>
		<td class="left">Walking:</td>
		<td>
			<select class="c-select" name="walk">
				<option value="1">20 Steps</option>
				<option value="2">5 Minutes</option>
				<option value="3">10 Minutes</option>
				<option value="4">15 Minutes</option>
				<option value="5">30 Minutes</option>
				<option value="6">45 Minutes</option>
				<option value="7">60 Minutes</option>
			</select>
		</td>
		</tr>
		<tr>
			<td class="left">Treatment Start Date:</td>
			<td class="right"><input type="text" name="start_date" id="start_date" size="35" value="<?php echo set_value('start_date'); ?>" /></td>
		</tr>
		
		<tr>
			<td class="left">Treatment End Date:</td>
			<td class="right"><input type="text" name="end_date" id="end_date" size="35" value="<?php echo set_value('end_date'); ?>" /></td>
		</tr>
	</table>
		
		
		<?php echo form_submit('submit','Register Patient');  ?>
		<?php echo form_close(); ?>
	</div>

	<div class="right-box">
		<ul>
			<li><?php echo anchor('provider/new_patient', 'Register New Patient'); ?></li>
			<?php /* <li><?php echo anchor('provider/provider/edit_information', 'Change Personal Information'); ?></li> */ ?>
			<li><?php echo anchor('provider/change_password', 'Change Your Password'); ?></li>
		</ul>
	</div>
</div>
  
<script>
	$(function() {
		$( "#start_date" ).datepicker({ dateFormat: 'yy-mm-dd', minDate: 0, maxDate: "+2Y"});
		$( "#end_date" ).datepicker({ dateFormat: 'yy-mm-dd', minDate: 0, maxDate: "+2Y"});
	});
	
	$(function() {
		$( "#pressure-slider" ).slider({
			range: "min",
			value: 50,
			min: 0,
			max: 100,
			step: 5,
			slide: function( event, ui ) {
				$( "#pressure" ).val( ui.value + "%" );
			}
		});
		
		$( "#pressure" ).val($( "#pressure-slider" ).slider( "value" ) + "%" );
	});
</script>