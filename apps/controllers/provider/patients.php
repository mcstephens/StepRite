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
class patients extends StepRite_Controller {
	function __construct() {
		parent::__construct();
		$this->user->provider_logged_in();
		$this->load->model('provider');
		$this->load->model('patient');
	}

	public function index() {
		$data['patients'] = $this->provider->get_patients($this->session->userdata('user_id'));
		$data['patient'] = $this->patient->get($this->session->userdata('patient_id'));
		/************************/
		/*    Load File View    */
		/************************/
		$this->load->view('provider/patients', $data);
	}
	
	public function edit() {
	
		$this->form_validation->set_rules('extended_date', "extended_date", 'required|valid_date');
		
		if(!$this->form_validation->run()) {
			echo "error";
		} 
		else {
			echo "You've successfully updated your patient with id = " . $this->input->post('id');
			echo "<br/><br/>";
		}
	}
}