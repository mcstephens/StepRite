<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 
/***************************************************************************
|--------------------------------------------------------------------------
| Patient Library
|--------------------------------------------------------------------------
|
| Written by Matthew C. Stephens for MedHab, LLC.
| 06 January 2014
| All information included is copyrighted MedHab, LLC 2013-2014
|
***************************************************************************/
class Patient {
	protected $_StepRite;
	
	/***************************************************************************
	|--------------------------------------------------------------------------
	| Constructor
	|--------------------------------------------------------------------------
	| @access 	public
	| @param	none
	| @return	none
	***************************************************************************/		
	function __construct() {
		$this->_StepRite =& get_instance();
	}
	
	/***************************************************************************
	|--------------------------------------------------------------------------
	| create
	|--------------------------------------------------------------------------
	| @access 	public
	| @param	array[string]
	| @return	none
	***************************************************************************/		
	public function create($user_data) {
		
		$user = array(	
			'type'			=> 2,
			'first_name'	=> $user_data['first_name'],
			'last_name' 	=> $user_data['last_name'],
			//'password'		=> $this->_StepRite->encrypt->encode($user_data['password']),
			'email'			=> $user_data['email'],
			'active'		=> 0
		);
		
		if($this->_StepRite->db->insert('users', $user)) {
			$id = $this->_StepRite->db->insert_id();
			
			$patient = array(
				'user_id'		=> $id,
				'provider_id'	=> $user_data['provider_id'],
				'mrn'			=> $user_data['mrn'],
				'start_date'	=> $user_data['start_date'],
				'end_date'		=> $user_data['end_date'],
				'reg_date'		=> date("Y-m-d"),
				'weight'		=> $user_data['weight'],
				'height'		=> $user_data['height'],
				'pt'			=> $user_data['pt'],
				'dr'			=> $user_data['dr'],
				'injured_leg'	=> $user_data['injured_leg'],
				'sets'			=> $user_data['sets'],
				'phone_num'		=> $user_data['phone_num'],
				'form_id'		=> 0,
				'extended'		=> 0,
				'treatment'		=> 0,
				'aob'			=> 0,
				'ctt'			=> 0,
				'pfp'			=> 0
			);
			
			$this->_StepRite->db->insert('patients', $patient);
		}
	}
	
	/***************************************************************************
	|--------------------------------------------------------------------------
	| get
	|--------------------------------------------------------------------------
	| @access 	public
	| @param	none
	| @return	array[string] | boolean
	***************************************************************************/	
	function get($id) {
		$query = $this->_StepRite->db->select('*')->from('users')->join('patients', 'users.id = patients.user_id', 'left')->where('users.id', $id)->get();
		if($query->num_rows() > 0) {
			return $query->row_array();
		}
		return false;		
	}
	
	/***************************************************************************
	|--------------------------------------------------------------------------
	| update
	|--------------------------------------------------------------------------
	| @access 	public
	| @param	none
	| @return	none
	***************************************************************************/		
	function update() {
	
	}
	
	/***************************************************************************
	|--------------------------------------------------------------------------
	| delete
	|--------------------------------------------------------------------------
	| @access 	public
	| @param	none
	| @return	none
	***************************************************************************/		
	public function delete() {
	
	}
	
	/***************************************************************************
	|--------------------------------------------------------------------------
	| change_password
	|--------------------------------------------------------------------------
	| @access 	public
	| @param	string
	| @return	bool
	***************************************************************************/		
	public function change_password($password) {
		$data = array(
		   'password' => $this->_StepRite->encrypt->encode($password)
		);

		$this->db->where('id', $this->_StepRite->session->userdata('user_id'));
		$this->db->update('users', $data);
	}
	
	/***************************************************************************
	|--------------------------------------------------------------------------
	| get_protocol
	|--------------------------------------------------------------------------
	| @access 	public
	| @param	int
	| @return	array | bool
	***************************************************************************/		
	public function get_protocol($id) {
		$query = $this->_StepRite->db->select('protocols.*, exercises.name')->from('protocols')->join('exercises', 'protocols.exercise_id = exercises.id', 'left')->where('patient_id', $id)->get();

		if($query->num_rows() > 0) {
			return $query->result_array();
		}
		return false;
	}
	
	/***************************************************************************
	|--------------------------------------------------------------------------
	| get_protocol
	|--------------------------------------------------------------------------
	| @access 	public
	| @param	int
	| @return	array | bool
	***************************************************************************/		
	public function get_notes($id) {
		$query = $this->_StepRite->db->select('*')->from('notes')->where('patient_id', $id)->get();

		if($query->num_rows() > 0) {
			return $query->result_array();
		}
		return false;
	}		
}
/* End of file Patient.php */
/* File location: apps/libraries/Patient.php */