<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed'); 
/***************************************************************************
|--------------------------------------------------------------------------
| Provider Library
|--------------------------------------------------------------------------
|
| Written by Matthew C. Stephens for MedHab, LLC.
| 06 January 2014
| All information included is copyrighted MedHab, LLC 2013-2014
|
***************************************************************************/
class Provider {
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
			'password'		=> $this->_StepRite->encrypt->encode($user_data['password']),
			'email'			=> $user_data['email'],
			'active'		=> 0
		);
		
		if($this->_StepRite->db->insert('users', $user)) {
			$id = $this->_StepRite->db->insert_id();
			
			$provider = array(
				'user_id'			=> $id,
				'npin'				=> $user_data['npin'],
				'business_name'		=> $user_data['business_name'],
				'business_address'	=> $user_data['business_address'],
				'phone_num'			=> $user_data['phone_num'],
				'cell_num'			=> $user_data['cell_num'],
				'registration_date'	=> date('Y-m-d')
			);
			
			$this->_StepRite->db->insert('providers', $provider);
		}
	}
	
	/***************************************************************************
	|--------------------------------------------------------------------------
	| get
	|--------------------------------------------------------------------------
	| @access 	public
	| @param	integer
	| @return	array(string) or bool
	***************************************************************************/	
	public function get() {
		$query = $this->db->select('*')->from('users')->join('providers', 'users.id = providers.user_id', 'left')->where('users.id', $id)->get();
		if($query->num_rows() > 0) {
			return $query->row_array();
		}
		return false;
	}
	
	/***************************************************************************
	|--------------------------------------------------------------------------
	| get_all
	|--------------------------------------------------------------------------
	| @access 	public
	| @param	none
	| @return	none
	***************************************************************************/	
	public function get_all() {
	
	}
	
	/***************************************************************************
	|--------------------------------------------------------------------------
	| update
	|--------------------------------------------------------------------------
	| @access 	public
	| @param	none
	| @return	none
	***************************************************************************/		
	public function update() {
	
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
}
/* End of file Provider.php */
/* File location: apps/libraries/Provider.php */