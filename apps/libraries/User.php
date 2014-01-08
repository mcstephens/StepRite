<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 
/***************************************************************************
|--------------------------------------------------------------------------
| User Library
|--------------------------------------------------------------------------
|
| Written by Matthew C. Stephens for MedHab, LLC.
| 06 January 2014
| All information included is copyrighted MedHab, LLC 2013-2014
|
***************************************************************************/
class User {
	protected $_StepRite;
	
	/***************************************************************************
	|--------------------------------------------------------------------------
	| Constructor
	|--------------------------------------------------------------------------
	| @access 	private
	| @param	none
	| @return	none
	***************************************************************************/		
	function __construct() {
		$this->_StepRite =& get_instance();
	}
	
	/***************************************************************************
	|--------------------------------------------------------------------------
	| provider_logged_in()
	|--------------------------------------------------------------------------
	| @access	public
	| @param	none
	| @return	bool
	***************************************************************************/	
	public function provider_logged_in() {
		if(!$this->_StepRite->session->userdata('logged_in') || ($this->_StepRite->session->userdata('user_type') != 1) ) {
			/* Record the current url that is attempting to be accessed, and redirect to the login screen */
			$this->_StepRite->session->set_userdata('last_page', uri_string());
			/* Redirect the user to the login page */
			redirect('login', 'refresh');
		}
	}
	
	/***************************************************************************
	|--------------------------------------------------------------------------
	| patient_logged_in()
	|--------------------------------------------------------------------------
	| @access	public
	| @param	none
	| @return	bool
	***************************************************************************/	
	public function patient_logged_in() {
		if(!$this->_StepRite->session->userdata('logged_in') || ($this->session->userdata('user_type') != 2) ) {
			/* Record the current url that is attempting to be accessed, and redirect to the login screen */
			$this->_StepRite->session->set_userdata('last_page', uri_string());
			/* Redirect the user to the login page */
			redirect('login', 'refresh');
		}
	}	
	
	/***************************************************************************
	|--------------------------------------------------------------------------
	| login
	|--------------------------------------------------------------------------
	| @access	public
	| @param	string, string
	| @return	 bool
	***************************************************************************/	
	public function login($email, $password) {
		$query = $this->_StepRite->db->where('email', $email)->get('users');
		
		if(!$query->num_rows()) { return false; }
		
		$user = $query->row_array();
		
		if($user['active'] && $password == $this->_StepRite->encrypt->decode($user['password'])) {
			$this->_StepRite->session->set_userdata('logged_in' ,TRUE);
			$this->_StepRite->session->set_userdata('user_id', $user['id']);
			$this->_StepRite->session->set_userdata('user_type' ,$user['type']);
			$this->_StepRite->session->set_userdata('first_name', $user['first_name']);
			$this->_StepRite->session->set_userdata('last_name', $user['last_name']);
		
			if($last_page = $this->_StepRite->session->userdata('last_page')) {
				redirect($last_page, 'refresh');
			}
			else if($user['type'] == 1) {
				redirect('provider/account', 'refresh');
			}
			else if($user['type'] == 2) {
				redirect('patient/account', 'refresh');
			}
		}
		else {
			return false;
		}
	}
	
	/***************************************************************************
	|--------------------------------------------------------------------------
	| is_valid
	|--------------------------------------------------------------------------
	| @access	public
	| @param	string, string
	| @return	integer (0 if false, user_id otherwise)
	***************************************************************************/		
    public function is_valid($email, $password) {
		
		$query = $this->_StepRite->db->where('email', $email)->get('users');
		
		if(!$query->num_rows()) { return 0; }
		
		$user = $query->row_array();
		
		if($user['active'] && $password == $this->_StepRite->encrypt->decode($user['password'])) {
			return $user['id'];
		}
		
		return 0;
    }

	/***************************************************************************
	|--------------------------------------------------------------------------
	| forgot
	|--------------------------------------------------------------------------
	| @access	public
	| @param	string
	| @return	boolean
	***************************************************************************/		
    public function forgot($email) {
		return true;
    }

	/***************************************************************************
	|--------------------------------------------------------------------------
	| logout
	|--------------------------------------------------------------------------
	| @access	public
	| @param	none
	| @return	none
	***************************************************************************/		
    public function logout($email) {	
		$this->_StepRite->session->unset_userdata('logged_in');
		$this->_StepRite->session->unset_userdata('user_id');
		$this->_StepRite->session->unset_userdata('user_type');
		$this->_StepRite->session->unset_userdata('first_name');
		$this->_StepRite->session->unset_userdata('last_name');
		$this->_StepRite->session->sess_destroy();
		redirect('login');		
    }

	/***************************************************************************
	|--------------------------------------------------------------------------
	| reset_password
	|--------------------------------------------------------------------------
	| @access	public
	| @param	none
	| @return	none
	***************************************************************************/		
	public function reset_password($email) {
		date_default_timezone_set('GMT');
		$this->_StepRite->load->helper('string');
		$password = random_string('alnum', 12);
		if($this->_StepRite->db->where('email', $email)->update('users',array('password' => $this->_StepRite->encrypt->encode($password), 'debug_password' => $password))) {
			return true;
		}
		return false;
		
	}
}
/* End of file User.php */
/* File location: apps/libraries/User.php */