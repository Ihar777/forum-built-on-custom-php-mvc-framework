<?php 

class Pages extends Controller{
	public function __construct(){

	}

	public function index(){
        
        if(isLoggedIn()){
		redirect('discussions');
		} else {
			redirect('users/login');
		}
		
		// $data = [
		// 	'title' => "Форум",
        //     'description' => 'Простейший форум, написанный на объектно-ориентированном php mvc фреймворке'
		// ];
        //     $this->view('pages/index', $data);
			
	}

	public function about(){
		$data = [
			'title' => 'About Us',
            'description' => 'App to share posts with other users'
		];

		$this->view('pages/about', $data);
	}
}


 ?>