<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/***************************************************************************
|--------------------------------------------------------------------------
| Login (Users)
|--------------------------------------------------------------------------
|
| Written by Matthew C. Stephens for MedHab, LLC.
| 18 December 2013
| All information included is copyrighted MedHab, LLC 2013
|
***************************************************************************/
class account extends StepRite_Controller {
	
	function __construct() {
		parent::__construct();
		$this->user->patient_logged_in();
		$this->load->model('patient');
	}
	
	/***************************************************************************
	|--------------------------------------------------------------------------
	| Index
	|--------------------------------------------------------------------------
	|
	| Displays the start information related to this class
	|
	***************************************************************************/	
	function index() {
		if($data['patient'] = $this->patient->get($this->session->userdata('user_id'))) {
		$data['header_info'] = "
			<table id=\"tables\">
				<tr>
					<td class=\"header\"> Patient: <strong>" . $patient['last_name'] . ", " . $patient['first_name'] . "</strong> </td>
					<td class=\"header\"> MRN: <strong>" 	. $patient['mrn'] . "</strong> </td>
					<td class=\"header\"> Height: <strong>" . $patient['height'] . " inches </strong> </td>
					<td class=\"header\"> Weight: <strong>" . $patient['weight'] . " pounds </strong> </td>
					<td class=\"header\"> Doctor: <strong>" . $patient['dr'] . "</strong> </td>
				</tr>
			</table>";
		/************************/
		/*    Load File View    */
		/************************/			
		$data['view'] = 'patient/account';
		$this->load->view('init', $data);		
		}
		else {
			$this->session->set_userdata('notice', 'Unable to retrieve your information. Please try logging in again or contact customer support.');
			$this->user->logout();
			redirect('login', 'refresh');
		}
		

	}
}
/**** END OF FILE ****/