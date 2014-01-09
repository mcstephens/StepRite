<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/***************************************************************************
|--------------------------------------------------------------------------
| Protocols
|--------------------------------------------------------------------------
|
| Written by Matthew C. Stephens for MedHab, LLC.
| 18 December 2013
| All information included is copyrighted MedHab, LLC 2013
|
***************************************************************************/
class protocols extends StepRite_Controller {
	function __construct() {
		parent::__construct();
		$this->load->model('patient');
		$this->user->provider_logged_in();
	}

	public function index() {
		$data['protocol'] = $this->patient->get_protocol($this->session->userdata('patient_id'));
		
		// echo "<pre>";
		// print_r($data['protocol']);
		// echo "</pre>";
		
		/************************/
		/*    Load File View    */
		/************************/
		$this->load->view('provider/protocols', $data);
	}
}