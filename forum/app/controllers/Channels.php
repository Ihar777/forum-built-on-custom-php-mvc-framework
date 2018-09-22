<?php
    class Channels extends Controller {
        // to restrict access to all /posts/ files (not only index.php)to not logged in users
        // you should put certain methods in __construct()
        public function __construct(){
            $this->channelModel = $this->model('Channel');
        }
        public function index(){
            
            if(isset($_GET['url'])){
			$url = rtrim($_GET['url'], '/');
			$url = filter_var($url, FILTER_SANITIZE_URL);
			$url = explode('/', $url);
			  if(isset($url[1])){
                $chandiscussions = $this->channelModel->getChannelDiscussions($url[1]);
                   $data = [
                'discussions' => $chandiscussions
            ];
                $this->view('channels/index', $data);
            }  else {
                
            // Get posts
            $channels = $this->channelModel->getChannels();
            
            $data = [
                'channels' => $channels
            ];
            
            $this->view('inc/navbar', $data);
            }
		}
          
        }
        
    }

?>