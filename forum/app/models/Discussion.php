<?php
    class Discussion{
        private $db;
        
        public function __construct(){
            $this->db = new Database;
        }
        
        public function getDiscussions(){
            $limit_per_page = 4;
            if(isset($_GET['page']) && $_GET['page']>1){
            $page = $_GET['page'];
            $offset = ($page - 1) * $limit_per_page;
            $this->db->query('SELECT *,
                            discussions.id as discussionId,
                            users.id as userId,
                            channels.id as channelId,
                            channels.title as channelTitle,
                            discussions.created_at as discussionCreated,
                            users.created_at as userCreated 
                            FROM discussions
                            INNER JOIN users
                            ON discussions.user_id = users.id
                            INNER JOIN channels
                            ON discussions.channel_id = channels.id 
                            ORDER BY discussions.created_at DESC
                            LIMIT :offset, :limit_per_page
                            ');
            $this->db->bind(':offset', $offset);
            $this->db->bind(':limit_per_page', $limit_per_page);
            $results = $this->db->resultSet();
            } else {
                $this->db->query('SELECT *,
                            discussions.id as discussionId,
                            users.id as userId,
                            channels.id as channelId,
                            channels.title as channelTitle,
                            discussions.created_at as discussionCreated,
                            users.created_at as userCreated 
                            FROM discussions
                            INNER JOIN users
                            ON discussions.user_id = users.id
                            INNER JOIN channels
                            ON discussions.channel_id = channels.id 
                            ORDER BY discussions.created_at DESC
                            LIMIT :limit_per_page
                            ');
            $this->db->bind(':limit_per_page', $limit_per_page);
            $results = $this->db->resultSet();
                
            }
            
            return $results;
        }
        
        public function getMyDiscussions(){
            $id = $_SESSION['user_id'];
            $limit_per_page = 4;
            if(isset($_GET['page']) && $_GET['page']>1){
            $page = $_GET['page'];
            $offset = ($page - 1) * $limit_per_page;
            $this->db->query('SELECT *,
                            discussions.id as discussionId,
                            users.id as userId,
                            channels.id as channelId,
                            channels.title as channelTitle,
                            discussions.created_at as discussionCreated,
                            users.created_at as userCreated 
                            FROM discussions
                            INNER JOIN users
                            ON discussions.user_id = users.id
                            INNER JOIN channels
                            ON discussions.channel_id = channels.id 
                            WHERE user_id = :id
                            ORDER BY discussions.created_at DESC
                            LIMIT :offset, :limit_per_page
                            ');
            $this->db->bind(':id', $id);
            $this->db->bind(':offset', $offset);
            $this->db->bind(':limit_per_page', $limit_per_page);
            $results = $this->db->resultSet();
            } else {
                $this->db->query('SELECT *,
                            discussions.id as discussionId,
                            users.id as userId,
                            channels.id as channelId,
                            channels.title as channelTitle,
                            discussions.created_at as discussionCreated,
                            users.created_at as userCreated 
                            FROM discussions
                            INNER JOIN users
                            ON discussions.user_id = users.id
                            INNER JOIN channels
                            ON discussions.channel_id = channels.id 
                            WHERE user_id = :id
                            ORDER BY discussions.created_at DESC
                            LIMIT :limit_per_page
                            ');
            $this->db->bind(':id', $id);
            $this->db->bind(':limit_per_page', $limit_per_page);
            $results = $this->db->resultSet();
            }
            return $results;
        }
        
        public function getMyDiscussionsTotal(){
            $id = $_SESSION['user_id'];
            $this->db->query('SELECT * FROM discussions WHERE user_id = :id');
            $this->db->bind(':id', $id);
            $results = $this->db->resultSet();
            $discussionstotal = count($results);
             return $discussionstotal;
            }
        
            public function getDiscussionsTotal(){
            $this->db->query('SELECT * FROM discussions');
            $results = $this->db->resultSet();
            $discussionstotal = count($results);
            return $discussionstotal;
            }
        
        public function getDiscussionById($id) {
            $this->db->query('SELECT *,
                            discussions.id as discussionId,
                            channels.id as channelId,
                            channels.title as channelTitle,
                            discussions.created_at as discussionCreated
                            FROM discussions
                            INNER JOIN channels
                            ON discussions.channel_id = channels.id
                            WHERE discussions.id = :id
                            ');
                            $this->db->bind(':id', $id);
                            $results = $this->db->single();
                            return $results;
                        }
        
        public function deleteDiscussion($id) {
            $this->db->query('DELETE FROM discussions WHERE id = :id');
            $this->db->bind(':id', $id);
            $results = $this->db->execute();
            if($results){
                return true;
            }
        }
        
        public function updateDiscussion($data) {
            $this->db->query('UPDATE discussions SET title = :title, content = :content WHERE id = :id');
            $this->db->bind(':id', $data['id']);
            $this->db->bind(':title', $data['title']);
            $this->db->bind(':content', $data['content']);
            $results = $this->db->execute();
            if($results){
                return true;
            }
        }
        
        public function addDiscussion($data) {
             $this->db->query("INSERT INTO discussions (user_id, channel_id, title, content) VALUES (:user_id, :channel_id, :title, :content)");
            $this->db->bind(':user_id', $_SESSION['user_id']);
            $this->db->bind(':channel_id', $data['channel_id']);
            $this->db->bind(':title', $data['title']);
            $this->db->bind(':content', $data['body']);
            $results = $this->db->execute();
            if($results){
                return true;
            }
        }
        
        public function addReply($data){
            $this->db->query("INSERT INTO replies (user_id, discussion_id, content) VALUES (:user_id, :discussion_id, :content)");
            $this->db->bind(':user_id', $data['user_id']);
            $this->db->bind(':discussion_id', $data['id']);
            $this->db->bind(':content', $data['content']);
            $results = $this->db->execute();
            if($results){
                return true;
            }
        }
        
        public function getReplies($discussion_id){
            $this->db->query('SELECT * FROM replies WHERE discussion_id = :id');
            $this->db->bind(':id', $discussion_id);
            $results = $this->db->resultSet();
            return $results;
        }
        
        public function searchDiscussions($content) {
            $limit_per_page = 4;
            if(isset($_GET['page']) && $_GET['page']>1){
            $page = $_GET['page'];
            $offset = ($page - 1) * $limit_per_page;
            $this->db->query('SELECT *,
                            discussions.id as discussionId,
                            users.id as userId,
                            channels.id as channelId,
                            channels.title as channelTitle,
                            discussions.created_at as discussionCreated,
                            users.created_at as userCreated 
                            FROM discussions
                            INNER JOIN users
                            ON discussions.user_id = users.id
                            INNER JOIN channels
                            ON discussions.channel_id = channels.id
                            WHERE content LIKE :content
                            ORDER BY discussions.created_at DESC
                            LIMIT :offset, :limit_per_page
                            ');
                            $this->db->bind(':offset', $offset);
                            $this->db->bind(':limit_per_page', $limit_per_page);
                            $this->db->bind(':content', "%$content%");
                            $results = $this->db->resultSet();
                            return $results;
            } else {
                $this->db->query('SELECT *,
                            discussions.id as discussionId,
                            users.id as userId,
                            channels.id as channelId,
                            channels.title as channelTitle,
                            discussions.created_at as discussionCreated,
                            users.created_at as userCreated 
                            FROM discussions
                            INNER JOIN users
                            ON discussions.user_id = users.id
                            INNER JOIN channels
                            ON discussions.channel_id = channels.id
                            WHERE content LIKE :content
                            ORDER BY discussions.created_at DESC
                            LIMIT :limit_per_page
                            ');
                            $this->db->bind(':limit_per_page', $limit_per_page);
                            $this->db->bind(':content', "%$content%");
                            $results = $this->db->resultSet();
                            return $results;
            }
        }
        
        public function getSearchDiscussionsTotal($content) {
            $this->db->query('SELECT * FROM discussions WHERE content LIKE :content');
                            $this->db->bind(':content', "%$content%");
                            $results = $this->db->resultSet();
                            $searchdiscussionstotal = count($results);
                            return $searchdiscussionstotal;
        }
        }

?>