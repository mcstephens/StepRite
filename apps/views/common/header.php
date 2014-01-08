<!DOCTYPE html>
<html lang="en">
<head>
<title>StepRite</title>
<link rel="shortcut icon" href='<?php echo base_url() . "favicon.ico";?>'>
<meta http-equiv='content-type' content='text/html;charset=UTF-8'>
<meta http-equiv="X-UA-Compatible" content="IE=8, IE=9, IE=10" />

<!-- StyleSheets -->
<link rel='stylesheet' type='text/css' href='<?php echo base_url() . "includes/css/stylesheet.css";?>' />
<link rel='stylesheet' type='text/css' href='<?php echo base_url() . "includes/js/jquery-ui/themes/base/jquery-ui.css";?>' />
<link rel='stylesheet' type='text/css' href='http://fonts.googleapis.com/css?family=Roboto+Condensed:400,700' />

<!-- JavaScript -->
<script type="text/javascript" src='<?php echo base_url() . "includes/js/jquery.js";?>' \></script>
<script type="text/javascript" src='<?php echo base_url() . "includes/js/jquery-ui/ui/jquery-ui.min.js";?>' \></script>
<script type="text/javascript" src='<?php echo base_url() . "includes/js/steprite.js";?>' \></script>

</head>
<body>
<div id="pageWarp">

<!-- HEADER BEGIN -->
<div id="header">
	<div id="logo"><a href="<?php echo base_url(); ?>"><img src="<?php echo base_url() . "images/sr_logo.png";?>" alt="StepRite Logo" height="160" width="272"></a></div>
	<span class="mission">Our Mission: To make patients better, faster<span>
</div>
<!-- END HEADER -->
<div id="mainWrap">
<!-- MENU BEGIN -->
<div id="header-bar">
	<ul>
		
		<?php if($this->session->userdata('logged_in') && $this->session->userdata('user_type') == 1) { ?>
			<li><a href="<?php echo base_url() . "provider/account";?>">Account</a></li>
			<li><a href="<?php echo base_url() . "provider/dashboards";?>">Dashboards</a></li>
			<li><a href="<?php echo base_url() . "logout";?>">Logout</a></li>
		<?php } else if($this->session->userdata('logged_in') && $this->session->userdata('user_type') == 2) {?>
			<li><a href="<?php echo base_url() . "patient/account";?>">Dashboard</a></li>
			<li><a href="<?php echo base_url() . "patient/print";?>">Print Dashboard</a></li>
			<li><a href="<?php echo base_url() . "patient/change_password";?>">Reset Password</a></li>
			<li><a href="<?php echo base_url() . "logout";?>">Logout</a></li>
		<?php } else { ?>
			<li><a href="<?php echo base_url();?>">Home</a></li>
		<?php } ?>

			<li class="time">
			<?php
				$today = getdate(); 
				echo " - " . $today["weekday"] . ", " . $today["month"] . " " . $today["mday"] . ", " . $today["year"];
			?>
			</li>
		</ul>	
</div>
<!-- END MENU -->

<!-- CONTENT BEGIN -->
<div id="content">
	<div class="content">
<?php if(isset($header_info) || $this->session->userdata('success') || $this->session->userdata('notice') || validation_errors()) { ?>
	<div class="box">	
		<?php if(isset($header_info)) { echo $header_info; } ?>
		<?php if($this->session->userdata('success')) {echo "<br /><span>" . $this->session->userdata('success') . "</span>"; } ?>
		<?php if($this->session->userdata('notice')) {echo "<br /><span class=\"error\">" . $this->session->userdata('notice') . "</span>"; } ?>
		<?php echo "<span class=\"error\">" . validation_errors() . "</span>"; ?>
	</div>

	<?php
		$this->session->unset_userdata('success');
		$this->session->unset_userdata('notice');
	?>
<?php } ?>
