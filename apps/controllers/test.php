<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/***************************************************************************
|--------------------------------------------------------------------------
| Test
|--------------------------------------------------------------------------
|
| Written by Matthew C. Stephens for MedHab, LLC.
| 06 January 2014
| All information included is copyrighted MedHab, LLC 2013-2014
|
***************************************************************************/
class test extends StepRite_Controller {
	function __construct() {
		parent::__construct();
	}

	public function index() {
		$this->load->model('provider');
		$this->load->model('patient');
		
		echo "<pre>";
		
		print_r($this->patient->get_patients(59));
		
		echo "</pre>";
	}
}