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
		$this->load->model('dashboard_model');
		$this->user->provider_logged_in();
	}

	public function index() {
		$data = NULL;
		/************************/
		/*    Load File View    */
		/************************/
		$this->load->view('provider/protocols', $data);
	}
}