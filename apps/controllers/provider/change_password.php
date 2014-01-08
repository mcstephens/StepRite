<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/***************************************************************************
|--------------------------------------------------------------------------
| Change_password
|--------------------------------------------------------------------------
|
| Written by Matthew C. Stephens for MedHab, LLC.
| 18 December 2013
| All information included is copyrighted MedHab, LLC 2013
|
***************************************************************************/
class Change_password extends StepRite_Controller {
	
	function __construct() {
		parent::__construct();

		$this->load->model('provider');
	}
	
	public function index() {
		$this->form_validation->set_rules('current_password', 'Current Password', 'required|min_length[6]|max_length[14]|callback__check_password');	
		$this->form_validation->set_rules('password', 'Password', 'required|min_length[6]|max_length[14]|matches[confirm_password]');
		$this->form_validation->set_rules('confirm_password', 'Password Confirmation', 'required|min_length[6]|max_length[14]');

		if(!$this->form_validation->run()) {
			/************************/
			/*    Load File View    */
			/************************/
			$data['header_info'] = "Please complete all fields";
			$data['view'] = 'provider/change_password_form';
			$this->load->view('init', $data);
		}
		else {
			$this->provider->change_password($this->input->post('password'));
			/************************/
			/*    Load File View    */
			/************************/
			$this->session->set_userdata('notice', 'Your password has been updated');
			redirect('provider/account', 'refresh');
		}
	}
}
/**** END OF FILE ****/