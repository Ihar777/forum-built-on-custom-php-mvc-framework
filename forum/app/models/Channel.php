<?php
    class Channel{
        private $db;
        
        public function __construct(){
            $this->db = new Database;
        }
        
        public function getChannels(){
            $this->db->query('SELECT * FROM channels ORDER BY id ASC');
            
            $results = $this->db->resultSet();
            
            return $results;
        }
        
        public function getChannelById($id){
            $this->db->query('SELECT * FROM channels WHERE id = :id');
            $this->db->bind(':id', $id);
            $results = $this->db->single();
            
            return $results;
        }
        
        public function getChannelDiscussions($slug){
            $this->db->query('SELECT *,
                            discussions.id as discussionId,
                            discussions.content as discussionContent,
                            discussions.title as discussionTitle,
                            channels.id as channelId,
                            channels.title as channelTitle,
                            discussions.created_at as discussionCreated,
                            channels.created_at as channelCreated 
                            FROM discussions
                            LEFT JOIN channels
                            ON discussions.channel_id = channels.id
                            LEFT JOIN users
                            ON discussions.user_id = users.id
                            WHERE channels.slug = :slug
                            ORDER BY discussions.created_at DESC');
            $this->db->bind(':slug', $slug);
             $results = $this->db->resultSet();
            
            return $results;
        }
    }

?>