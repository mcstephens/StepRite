<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/***************************************************************************
|--------------------------------------------------------------------------
| Forgot
|--------------------------------------------------------------------------
|
| Written by Matthew C. Stephens for MedHab, LLC.
| 18 December 2013
| All information included is copyrighted MedHab, LLC 2013
|
***************************************************************************/
class Forgot extends StepRite_Controller {
	function __construct() {
		parent::__construct();
		$this->load->helper('captcha');
		$this->load->library('user');
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
		$this->form_validation->set_rules('email', 'Email', 'required|valid_email|callback__email_exists');
		$this->form_validation->set_rules('captcha', "Captcha", 'required|callback__captcha_validation');
		
		if(!$this->form_validation->run()) {
			/* Setup values to pass into the create_captcha function */
			$vals = array(
				'img_path'	 => 'images/captcha/',
				'img_url'	 => base_url() . 'images/captcha/',
				'font_path'	 => './system/fonts/texb.ttf',
				'img_width'	 => 250,
				'img_height' => 50,
				'expiration' => 600
			);

			/* Generate the captcha */
			$data['captcha'] = create_captcha($vals);

			/* Store the captcha value (or 'word') in a session to retrieve later */
			$this->session->set_flashdata('captcha_word', $data['captcha']['word']);
			
			$data['articles'] = $this->_get_articles();
			/************************/
			/*    Load File View    */
			/************************/
			$data['header_info'] = 'Please enter your email address below and we\'ll email you a link to reset your password:';
			$data['view'] = 'forgot';
			$this->load->view('init', $data);
		}
		else {
			if($this->user->reset_password($this->input->post('email'))) {
				$this->session->set_userdata('notice', 'Your password has been reset. Please follow the directions in your email to complete the password reset process.');
				/************************/
				/*    Load File View    */
				/************************/
				redirect('login', 'refresh');			
			}
			else {
				$this->session->set_userdata('warning', 'There was a problem resetting your password. Please check your email address and try again.');			
			/************************/
			/*    Load File View    */
			/************************/
			$data['view'] = 'forgot';
			$this->load->view('init', $data);		
			}
		}
	}
	
	/***************************************************************************
	|--------------------------------------------------------------------------
	| _get_articles
	|--------------------------------------------------------------------------
	| @access	private protected
	| @param	none
	| @return	bool | string
	***************************************************************************/			
	private function _get_articles() {
		$this->load->model('articles_model');
		$query = $this->articles_model->get_articles();
		
		if ($query->num_rows() > 0) {
			foreach ($query->result() as $row) {
				$articles[] = array(
					'name'		=> $row->name,
					'article'	=> $row->article,
					'date'		=> $row->entry_date
				);
			}
		}
		else {
			return false;
		}

		return $articles;
	}	
}
/**** END OF FILE ****/