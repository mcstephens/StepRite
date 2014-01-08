<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/***************************************************************************
|--------------------------------------------------------------------------
| Form_validation - extended from original library
|--------------------------------------------------------------------------
|
| Written by Matthew C. Stephens for MedHab, LLC.
| 18 December 2013
| All information included is copyrighted MedHab, LLC 2013
|
***************************************************************************/
class Custom_Form_validation extends StepRite_Form_validation {

    public function __construct()
    {
        parent::__construct();
    }

	/***************************************************************************
	|--------------------------------------------------------------------------
	| valid_date
	|--------------------------------------------------------------------------
	| @access	public
	| @param	string
	| @return	bool
	***************************************************************************/	
    function valid_date($date)
    {
        if (!empty($date))
        {
            if (preg_match("/^([0-9]{4})-(0[1-9]|1[0-2])-(0[1-9]|[1-2][0-9]|3[0-1])$/", $date, $values))
            {
			$month = $values[2];
			$day = $values[3];
			$year = $values[1];
			
                if (checkdate($month, $day, $year))    // Date actually exists
                {
					
                    return TRUE;
                }
            }
        }
        return FALSE;
    }
	/***************************************************************************
	|--------------------------------------------------------------------------
	| _verify_Login
	|--------------------------------------------------------------------------
	| @access	public protected
	| @param	string
	| @return	bool
	***************************************************************************/		
	function _verify_login($password, $email) {
		$user = $this->user_model->get_user($email);
		
		if(!$user) {
			$this->form_validation->set_message('_verify_login', 'The email entered is invalid');
			return FALSE;
		}
		else {
			if($password != $this->encrypt->decode($user['password'])) {
				$this->form_validation->set_message('_verify_login', 'The password entered is invalid');
				return FALSE;
			}
			if(!$user['active']) {
				$this->form_validation->set_message('_verify_login', 'The account is not active. Please wait for customer service to contact you to active your account. Thank you');
				return FALSE;
			}
		}
		
		$this->load->library('user');
		$this->user->login($email, $password);
		
		return TRUE;
	}	
	/***************************************************************************
	|--------------------------------------------------------------------------
	| _email_exists
	|--------------------------------------------------------------------------
	| @access	public protected
	| @param	string
	| @return	bool
	***************************************************************************/	
	function _email_exists($email) {
		if($this->user_model->get_user($email)) {
			return TRUE;
		}
		
		$this->form_validation->set_message('_verify_login', 'The email entered is invalid');
		return FALSE;
	}
	/***************************************************************************
	|--------------------------------------------------------------------------
	| _captcha_validation
	|--------------------------------------------------------------------------
	| @access	public protected
	| @param	string
	| @return	bool
	***************************************************************************/		
	function _captcha_validation($captcha) {
		if(strtoupper($this->session->flashdata('captcha_word')) == strtoupper($captcha)) {	
			return TRUE;
		}
		
		$this->form_validation->set_message('_captcha_validation', 'The %s field must match the captcha image');
		return FALSE;
	}
	/***************************************************************************
	|--------------------------------------------------------------------------
	| _check_password
	|--------------------------------------------------------------------------
	| @access	public protected
	| @param	string
	| @return	bool
	***************************************************************************/		
	public function _check_password($password) {
		$this->db->where('id', $this->session->userdata('user_id'));
		$query = $this->db->get('users');
		$row = $query->row();
		
		if($query->num_rows() > 0 && $this->encrypt->decode($row->password) == $password) {
			return TRUE;
		}
		
		$this->form_validation->set_message('current_password_check', 'The %s field is incorrect.');
		return FALSE;
	}
}