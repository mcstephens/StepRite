 <?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/***************************************************************************
|--------------------------------------------------------------------------
| Notes
|--------------------------------------------------------------------------
|
| Written by Matthew C. Stephens for MedHab, LLC.
| 18 December 2013
| All information included is copyrighted MedHab, LLC 2013
|
***************************************************************************/
class notes extends StepRite_Controller {
	function __construct() {
		parent::__construct();
		$this->user->provider_logged_in();
		$this->load->model('patient');
	}

	public function index() {
		
		$data['notes'] = $this->notes();
		
		/************************/
		/*    Load File View    */
		/************************/
		$this->load->view('provider/notes', $data);
	}
	
	public function save() {
		echo $this->notes();
	}
	
	public function notes() {
	
		if($notes = $this->patient->get_notes($this->session->userdata('patient_id'))) {
			$data = "<div id=\"accordion\">";
			
			foreach($notes as $row) { 
				$data .= "<h3>" . $row['subject'] ." - " . $row['date'] . "</h3>";
				$data .= "<div>";
				$data .= "<p>" . $row['note'] . "</p>";
				$data .= "</div>";
			} 
			$data .= "</div>";
		} 
		else { 
			$data = "<h3> No Notes </h3>";
		}

		return $data;
	}
}