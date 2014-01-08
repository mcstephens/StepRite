<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/***************************************************************************
|--------------------------------------------------------------------------
| Patients
|--------------------------------------------------------------------------
|
| Written by Matthew C. Stephens for MedHab, LLC.
| 18 December 2013
| All information included is copyrighted MedHab, LLC 2013
|
***************************************************************************/
class error404 extends StepRite_Controller {
	function __construct() {
		parent::__construct();
	}

	public function index() {
			/************************/
			/*    Load File View    */
			/************************/
			$data['header_info'] = "<h3>404 Error</h3>";
			$data['view'] = 'errors/error404';
			$this->load->view('init', $data);
	}
}