<?php
    class Discussions extends Controller {
        // to restrict access to all /posts/ files (not only index.php)to not logged in users
        // you should put certain methods in __construct()
        public function __construct(){
            if(!isLoggedIn()){
                redirect('users/login');
            }
            
            $this->discussionModel = $this->model('Discussion');
            $this->channelModel = $this->model('Channel');
            $this->userModel = $this->model('User');
        }
        public function index(){
//            $channel = $this->channelModel->getChannelById($id);
            if(isset($_GET['filter']) && ($_GET['filter'] == 'me')){
                
                $discussions = $this->discussionModel->getMyDiscussions();
                $totaldiscussions = $this->discussionModel->getMyDiscussionsTotal();
            
            } 
            
            
            
                elseif(isset($_POST['filter'])){
                $discussions = $this->discussionModel->searchDiscussions($_POST['filter']);
                $totaldiscussions = $this->discussionModel->getSearchDiscussionsTotal($_POST['filter']);
                }
            
            
            
                else {
                
            $discussions = $this->discussionModel->getDiscussions();
            $totaldiscussions = $this->discussionModel->getDiscussionsTotal();
            
            }
            
            $count_discussions = count($discussions);
            $limit_per_page = 4;
            $number_of_pages = ceil($totaldiscussions/$limit_per_page);
            
            $data = [
                'discussions' => $discussions,
//                'channel' => $channel,
                'number_of_pages' => $number_of_pages
            ];
            
            $this->view('discussions/index', $data);
            
        }
        
        
        public function add(){
            
            if($_SERVER['REQUEST_METHOD'] == 'POST'){
                // Sanitize POST array
                $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
                
            $data = [
                'title' => trim($_POST['title']),
                'body' => trim($_POST['body']),
                'channel_id' => $_POST['channel_id'],
                'user_id' => $_SESSION['user_id'],
                'title_err' => '',
                'body_err' => ''
            ];
                
                // Validate data
                if(empty($data['title'])){
                    $data['title_err'] = 'Пожалуйста введите название';
                }
                if(empty($data['body'])){
                    $data['body_err'] = 'Пожалуйста введите текст';
                }
                
                // Make sure no errors
                if(empty($data['title_err']) && empty($data['body_err'])){
                    if($this->discussionModel->addDiscussion($data)){
                        flash('post_message', 'Тема добавлена');
                        redirect('discussions');
                    } else {
                        die('Something went wrong');
                    }
                    
                } else {
                    // Load view with errors
                    $this->view('discussions/add', $data);
                }
                
            } else {
                $channels = $this->channelModel->getChannels();
            $data = [
                'title' => '',
                'channels' => $channels,
                'body' => ''
            ];
            $this->view('discussions/add', $data);
            }
        }
        
          public function edit($id){
            
            if($_SERVER['REQUEST_METHOD'] == 'POST'){
                // Sanitize POST array
//                die('success');
                $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
                
            $data = [
                'id' => $id,
                'title' => trim($_POST['title']),
                'content' => trim(nl2br($_POST['content'])),
                'user_id' => $_SESSION['user_id'],
                'title_err' => '',
                'content_err' => ''
            ];
                
                // Validate data
                if(empty($data['title'])){
                    $data['title_err'] = 'Please enter title';
                }
                if(empty($data['content'])){
                    $data['content_err'] = 'Please enter body text';
                }
                
                // Make sure no errors
                if(empty($data['title_err']) && empty($data['content_err'])){
                    if($this->discussionModel->updateDiscussion($data)){
                        redirect('discussions');
                    } else {
                        die('Something went wrong');
                    }
                    
                } else {
                    // Load view with errors
                    $this->view('discussions/edit', $data);
                }
                
            } else {
                // Get existing post from model
                $discussion = $this->discussionModel->getDiscussionById($id);
                
                // Check for owner
                if($discussion->user_id != $_SESSION['user_id']){
                    redirect('discussions');
                }
            $data = [
                'id' => $discussion->id,
                'title' => $discussion->title,
                'content' => $discussion->content
            ];
            $this->view('discussions/edit', $data);
            }
        }
        
        public function show($id){
            $discussion = $this->discussionModel->getDiscussionById($id);
            $user = $this->userModel->getUserById($discussion->user_id);
            $replies = $this->discussionModel->getReplies($id);
            $repliers = array();
            foreach($replies as $reply){
            $replier = $this->userModel->getUserById($reply->user_id);
            array_push($repliers, $replier);
            }
             if($_SERVER['REQUEST_METHOD'] == 'POST'){
                  $replies = $this->discussionModel->getReplies($id);
                // Sanitize POST array
//                die('success');
                $_POST = filter_input_array(INPUT_POST, FILTER_SANITIZE_STRING);
                
            $data = [
                'id' => $id,
                'content' => trim(nl2br($_POST['content'])),
                'user_id' => $_SESSION['user_id'],
                'content_err' => '',
                'discussion' => $discussion,
                'user' => $user,
                'replies' => $replies,
                'repliers' => $repliers
            ];

                if(empty($data['content'])){
                    $data['content_err'] = 'Please enter body text';
                }
                // Make sure no errors
                if(empty($data['content_err'])){
                    if($this->discussionModel->addReply($data)){
                         $this->view('discussions/show', $data);
                    } else {
                        die('Something went wrong');
                    }
                    
                } else {
                    // Load view with errors
                    $this->view('discussions/show', $data);
                }
                
            } else {
            
//            $discussion = $this->discussionModel->getDiscussionById($id);
//            $user = $this->userModel->getUserById($discussion->user_id);
        
            $data = [
                'discussion' => $discussion,
                'user' => $user,
                'replies' => $replies,
                'repliers' => $repliers
            ];
            
            $this->view('discussions/show', $data);
        }
        }
        
        public function delete($id){
            if($_SERVER['REQUEST_METHOD'] == 'POST'){
                // Get existing post from model
                $discussion = $this->discussionModel->getDiscussionById($id);
                
                // Check for owner
                if($discussion->user_id != $_SESSION['user_id']){
                    redirect('discussions');
                }
                
                if($this->discussionModel->deleteDiscussion($id)){
                    redirect('discussions');
                } else {
                    die('Something went wrong');
                }
            } else {
                redirect('discussions');
            }
        }
    }