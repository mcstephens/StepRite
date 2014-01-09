<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');
/***************************************************************************
|--------------------------------------------------------------------------
| Dashboard
|--------------------------------------------------------------------------
|
| Written by Matthew C. Stephens for MedHab, LLC.
| 18 December 2013
| All information included is copyrighted MedHab, LLC 2013
|
***************************************************************************/
class dashboard extends StepRite_Controller {
	function __construct() {
		parent::__construct();
		$this->user->provider_logged_in();
		$this->load->model('dashboard_model');
	}

	public function index() {
		$data = NULL;
		/************************/
		/*    Load File View    */
		/************************/
		$this->load->view('provider/dashboard', $data);
	}
	
	public function draw_feet($l_total = 0, $r_total = 0, $l_f1 = 0, $l_f2 = 0, $l_f3 = 0, $l_f4 = 0, $r_f1 = 0, $r_f2 = 0, $r_f3 = 0, $r_f4 = 0) {
		
		$im = @imagecreatefrompng(base_url() . "images/feet-template.png");		
		$font = "/AMP/htdocs/StepRite/includes/fonts/RobotoCondensed-Bold.ttf";
		
		$size = 16;
		$black = imagecolorallocate($im, 000, 000, 000);

		

		// $l_f1 = 1.1;
		// $l_f2 = 2.1;
		// $l_f3 = 3.1;
		// $l_f4 =	4.1;
		// $l_total = 5.1;
		
		// $r_f1 = 1.1;
		// $r_f2 = 2.1;
		// $r_f3 = 3.1;
		// $r_f4	 = 4.1;	
		// $r_total = 5.1;
		
		
		
		// TOP LEFT
		imagettftext($im, $size, 0, 38,  47, $black, $font, $l_total . "%");
		// TOP RIGHT
		imagettftext($im, $size, 0, 362, 47, $black, $font, $r_total . "%");
		
		// LEFT FOOT BALL
		imagettftext($im, $size, 0, 61,  167, $black, $font, $l_f1 . "%");
		imagettftext($im, $size, 0, 137, 148, $black, $font, $l_f2 . "%");
		// LEFT FOOT HEEL
		imagettftext($im, $size, 0, 61,  350, $black, $font, $l_f3 . "%");
		imagettftext($im, $size, 0, 137, 321, $black, $font, $l_f4 . "%");		
		// RIGHT FOOT BALL
		imagettftext($im, $size, 0, 264, 148, $black, $font, $r_f1 . "%");		
		imagettftext($im, $size, 0, 340, 167, $black, $font, $r_f2 . "%");
		// RIGHT FOOT HEEL
		imagettftext($im, $size, 0, 264, 321, $black, $font, $r_f3 . "%");			
		imagettftext($im, $size, 0, 340, 350, $black, $font, $r_f4 . "%");

		header("Content-type: image/png");
		imagepng($im);
		imagedestroy($im);
	}
	
	public function draw_grid() {
		$src = @imagecreatefrompng(base_url() . "images/man-template.png");	
		$dest = @imagecreatefrompng(base_url() . "images/grid-template.png");
		
		$black = imagecolorallocate($dest, 000, 000, 000);
		$blue = imagecolorallocate($dest, 61, 177, 255);
		$red = imagecolorallocate($dest, 204, 0, 0);
		$font = "/AMP/htdocs/StepRite/includes/fonts/RobotoCondensed-Bold.ttf";
		$size = 16;

		
		imagefilledrectangle($dest, 4, 4, 50, 50, $red);
		imagefilledrectangle($dest, 4, 55, 50, 100, $blue);

		imagecopymerge($dest, $src, 228, 20, 0, 0, 48, 170, 100);


		imagettftext($dest, $size, 0, 50,  35, $black, $font, " Left Leg");
		imagettftext($dest, $size, 0, 50,  85, $black, $font, " Right Leg");
		
		header("Content-type: image/png");
		imagepng($dest);
		imagedestroy($src);
		imagedestroy($dest);		
	}
}