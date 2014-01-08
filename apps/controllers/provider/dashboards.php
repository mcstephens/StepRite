<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/***************************************************************************
|--------------------------------------------------------------------------
| Dashboards
|--------------------------------------------------------------------------
|
| Written by Matthew C. Stephens for MedHab, LLC.
| 18 December 2013
| All information included is copyrighted MedHab, LLC 2013
|
***************************************************************************/
class Dashboards extends StepRite_Controller {
	function __construct() {
		parent::__construct();
		$this->user->provider_logged_in();
		$this->load->model('provider');
		$this->load->model('patient');
	}
	
	function index() {
		$id = 0;
		
		$data['provider'] = $this->provider->get($this->session->userdata('user_id'));		
		$data['patients'] = $this->provider->get_patients($this->session->userdata('user_id'));			
		
		if($this->input->post('id')) {
			if($this->input->post('id') == "new") {
				redirect('provider/new_patient', 'refresh');
			}
			$id = $this->input->post('id');
			$data['patient'] = $this->patient->get($id);
			$this->session->set_userdata('patient_id', $id);
		}
		
		/* Configure the header box with the correct patient information */
		$data['header_info']  = form_open('provider/dashboards');
		$data['header_info'] .= "<div class=\"grid\"><div class=\"head\">";
		$data['header_info'] .= "<div> Patient: <select onChange=\"this.form.submit();\" class=\"p-select\" name=\"id\">"; 
		
		foreach($data['patients'] as $row) {
			if($row['id'] == $id) {
				$data['header_info'] .= "<option name=\"id\" value=\"" . $row['user_id'] . "\" selected>" . $row['last_name'] . ", " . $row['first_name'] . "</option>";
			}
			else {
				$data['header_info'] .= "<option name=\"id\" value=\"" . $row['user_id'] . "\">" . $row['last_name'] . ", " . $row['first_name'] . "</option>";
			}
		}
		
		$data['header_info'] .= "<option name=\"id\" value=\"new\">Add New Patient</option>";
		$data['header_info'] .= "</select>";
		$data['header_info'] .= "</div>";
		
		if($id) {
			$data['header_info'] .= "<div> MRN:     <strong>" . $data['patient']['mrn'] . " </strong> </div>";
			$data['header_info'] .= "<div> Height:  <strong>" . $data['patient']['height'] . " inches </strong> </div>";
			$data['header_info'] .= "<div> Weight:  <strong>" . $data['patient']['weight'] . " pounds </strong> </div>";
			$data['header_info'] .= "<div> Doctor:  <strong>" . $data['patient']['dr'] . " </strong> </div>";
		}
		else {
			$data['header_info'] .= "<div> MRN:     <strong>" . $data['patients'][0]['mrn'] . " </strong> </div>";
			$data['header_info'] .= "<div> Height:  <strong>" . $data['patients'][0]['height'] . " inches </strong> </div>";
			$data['header_info'] .= "<div> Weight:  <strong>" . $data['patients'][0]['weight'] . " pounds </strong> </div>";
			$data['header_info'] .= "<div> Doctor:  <strong>" . $data['patients'][0]['dr'] . " </strong> </div>";
	
		}
		$data['header_info'] .= "</div></div>";		
		$data['header_info'] .= form_close();	

		/************************/
		/*    Load File View    */
		/************************/
		
		$data['view'] = 'provider/dashboards';
		$this->load->view('init', $data);
	}
}
/**** END OF FILE ****/