<?php include "includes/db.php"; ?>
<?php include "includes/header.php"; ?>
<?php include "includes/navigation.php"; ?>
    <!-- Navigation -->
		
    <!-- Page Content -->
    <div class="container">

       <style> 
		@font-face {
    			font-family: Bellota-BoldItalic;
    			src: url(fonts/Bellota-BoldItalic.otf);
			}

		#author {
    			font-family: Bellota-BoldItalic;
    			font-size: 40px;
    			color: #337ab7;
    			text-align: center;
    			text-shadow: 4px 4px yellow;
    			background-image: url('images/nature.jpg'); 
		    }
	</style>
        
        <p id="author" class="lead jumbotron">
                    ALL POSTS BY <?php echo strtoupper($_GET['post_author']); ?>
                </p>
        <div class="row">
        
 

            <!-- Blog Entries Column -->
            <div class="col-md-8">
            
            <?php 
            
                    $the_post_author = $_GET['post_author'];
    
    $per_page = 5;
                
    if(isset($_GET['page'])) {
        
        $page = $_GET['page'];
        
    } else {
        
        $page = "";
        
    }
                
    if($page == "" || $page == 1) {
        
        $page_1 = 0;
        
    } else {
        
        $page_1 = ($page * $per_page) - $per_page;
        
    }
    
     if(isset($_SESSION['user_role']) && $_SESSION['user_role'] == 'admin') {
                
    $post_query_count = "SELECT * FROM posts WHERE post_author = '{$the_post_author}'";              
    } else {

      $post_query_count = "SELECT * FROM posts WHERE post_status = 'published' AND post_author = '{$the_post_author}'";
    }
                
    $find_count = mysqli_query($connection, $post_query_count);
    $count = mysqli_num_rows($find_count);
                
    if($count < 1) {
        
        echo "<h1 class='text-center'>No posts available</h1>";
        
    } else {
                
    $count = ceil($count / $per_page);
    
    }

        ?>
        
                
        <?php 

        if(isset($_GET['p_id'])) {
            
            $the_post_id     = $_GET['p_id'];
            
        }
                                            
        $query = "SELECT * FROM posts WHERE post_author= '{$the_post_author}' LIMIT $page_1, $per_page"; // LIMIT $page_1, $per_page" - MOC
          $select_all_posts_query = mysqli_query($connection, $query);

            while($row = mysqli_fetch_assoc($select_all_posts_query)) {
            	$post_id = $row['post_id'];
                $post_title = $row['post_title'];
                $post_author = $row['post_author'];
                $post_date = $row['post_date'];
                $post_image = $row['post_image'];
                $post_content = substr($row['post_content'],0,100) . "...";
                
                ?>
           
      
                <h2 class="text-center">
                    <a href="post.php?p_id=<?php echo $post_id; ?>"><?php echo $post_title; ?></a>
                </h2>
                <!--
                <p class="lead">
                    All posts by <?php echo $post_author; ?>
                </p>
                -->
                <p><span class="glyphicon glyphicon-time"></span><?php echo $post_date; ?></p>
                <hr>
                <img class="img-responsive" src="images/<?php echo $post_image; ?>" alt="">
                <hr>
                <p><?php echo $post_content; ?></p>
                <a href="post.php?p_id=<?php echo $post_id; ?>"><button type="button" class="btn btn-primary">Read More <span class="glyphicon glyphicon-chevron-right"></span></button></a>
                     <a class="btn btn-warning nav navbar-right joke" href="">Delete the post &nbsp; &nbsp; <i class="far fa-smile" style="font-size: 16px;"></i></a>
                
                <hr>     
                
     <?php } ?> 

               
                 <!-- Blog Comments -->
                 
                 <?php
                
                if(isset($_POST['create_comment'])) { 
                
                    $the_post_id = $_GET['p_id'];
                    $comment_author = $_POST['comment_author'];
                    $comment_email = $_POST['comment_email'];                    $comment_content = $_POST['comment_content'];
                    //$post_comment_count = 0;
                
                    if(!empty($comment_author) && !empty($comment_email) && !empty($comment_content)) {
                    
                              $query = "INSERT INTO comments (comment_post_id, comment_author, comment_email, comment_content, comment_status, comment_date) ";
                
                    $query .= "VALUES ($the_post_id, '{$comment_author}', '{$comment_email}', '{$comment_content}', 'unapproved', now()) ";
                
                    $create_comment_query = mysqli_query($connection, $query);
                    
                    if(!$create_comment_query) {
                
                        die('QUERY FAILED' . mysqli_error($connection));
                        
                    }
                
                    $query = "UPDATE posts SET post_comment_count = post_comment_count + 1 ";
                    $query .= "WHERE post_id = $the_post_id ";
                    $update_comment_count = mysqli_query($connection, $query);
                } else {
                        
                        echo "<script>alert('Fields cannot be empty')</script>";
                        
                    }
                        
                        
                    }
                    
           
                ?> 
                
           
            
               <ul class="pager">
     
            <?php
            
                   
            
            for($i = 1; $i <= $count; $i++){
            
            if($count <= 1) break;
            
                if($page == $i ){
                    echo "<li><a class='active_link' href='author_posts.php?post_author={$the_post_author}&page={$i}'>$i</a></li>";
                
                }else if($page == ""){
                    $page = 1;
                    echo "<li><a class='' href='author_posts.php?post_author={$the_post_author}&page={$i}'>$i</a></li>";
                    
                }else{
                    echo "<li><a href='author_posts.php?post_author={$the_post_author}&page={$i}'>$i</a></li>";
                }
                               
           
            }
            
            
            ?>
        </ul>
</div>

            <!-- Blog Sidebar Widgets Column -->
           <?php include "includes/sidebar.php"; ?>
        </div>
        <!-- /.row -->

        <hr>

<?php include "includes/footer.php"; ?> 