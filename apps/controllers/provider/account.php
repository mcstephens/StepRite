<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/***************************************************************************
|--------------------------------------------------------------------------
| Account
|--------------------------------------------------------------------------
|
| Written by Matthew C. Stephens for MedHab, LLC.
| 18 December 2013
| All information included is copyrighted MedHab, LLC 2013
|
***************************************************************************/
class Account extends StepRite_Controller {
	function __construct() {
		parent::__construct();
		$this->user->provider_logged_in();
		$this->load->model('provider');
	}
	/***************************************************************************
	|--------------------------------------------------------------------------
	| Index
	|--------------------------------------------------------------------------
	|
	| Displays the start information related to this class
	|
	***************************************************************************/	
	public function index() {
		if($data['provider'] = $this->provider->get($this->session->userdata('user_id'))) {
			/************************/
			/*    Load File View    */
			/************************/
			$data['header_info'] = "Account Page - Welcome " . $this->session->userdata('first_name') . " " . $this->session->userdata('last_name');
			$data['view'] = 'provider/account';
			$this->load->view('init', $data);			
		}
		else {
			$this->session->set_userdata('notice', "StepRite has encountered an error trying to access your information. Please login and try again.");
			$this->user->logout();
		}
	}
}
/**** END OF FILE ****/