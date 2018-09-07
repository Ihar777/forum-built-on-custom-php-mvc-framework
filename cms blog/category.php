<?php include "includes/db.php"; ?>
<?php include "includes/header.php"; ?>
<?php include "admin/functions.php"; ?>
<?php include "includes/navigation.php"; ?>
   
   <?php //$_SESSION['username'] = ''; ?> <!-- COMMENTED MYSELF, JUST TO TRY -->
    <!-- Navigation -->

    <!-- Page Content -->
    <div class="container">

        <div class="row">

            <!-- Blog Entries Column -->
            <div class="col-md-8">
                
        <?php 

        if(isset($_GET['category'])) {
            
            $post_category_id = $_GET['category'];
            
             if(isset($_SESSION['username']) && is_admin($_SESSION['username'])) {
                
            $query = "SELECT * FROM posts WHERE post_category_id=$post_category_id";                
            } else {
                
              $query = "SELECT * FROM posts WHERE post_category_id=$post_category_id AND post_status = 'published' ";
            }
            
  
          $select_all_posts_query = mysqli_query($connection, $query);
            
            if(mysqli_num_rows($select_all_posts_query) < 1) {
                
                echo "<h1 class='text-center'>No posts available</h1>";
                
            } else {
            
              ?>
         
                <h1 class="page-header" align="center"> 
                
                <?php
               
                // MOC
                     	
               $query_cat_image = mysqli_query($connection, "SELECT cat_image FROM categories WHERE cat_id='{$post_category_id}'");
               
               	 while($row = mysqli_fetch_assoc($query_cat_image)) 
                $cat_image = $row['cat_image'];
                
                
               echo (isset($cat_image)? $cat_image : "") . " " . strtoupper($_SESSION['cat_title']); 
               
               ?>
                    
                </h1>
               
            <?php      

            while($row = mysqli_fetch_assoc($select_all_posts_query)) {
                $post_id = $row['post_id'];
                $post_title = $row['post_title'];
                $post_author = $row['post_author'];
                $post_date = $row['post_date'];
                $post_image = $row['post_image'];
                $post_content = substr($row['post_content'],0,100);
                
                ?>
                
                

                <!-- First Blog Post -->
                <h2 class="text-center">
                    <a href="post.php?p_id=<?php echo $post_id; ?>"><?php echo $post_title; ?></a>
                </h2>
                <p class="lead">
                     by <a href="author_posts.php?post_author=<?php echo $post_author; ?>"><?php echo $post_author; ?></a>
                </p>
                <p><span class="glyphicon glyphicon-time"></span>&nbsp;<?php echo $post_date; ?></p>
                <hr>
                <a href="post.php?p_id=<?php echo $post_id; ?>"><img class="img-responsive img-rounded img-thumbnail" src="images/<?php echo $post_image; ?>"  alt=""></a>
                <hr>
                <p><?php echo $post_content; ?></p>
                <a class="btn btn-primary" href="post.php?p_id=<?php echo $post_id; ?>">Read More <span class="glyphicon glyphicon-chevron-right"></span></a>
                <a class="btn btn-warning nav navbar-right joke" href="">Delete the post &nbsp; &nbsp; <i class="far fa-smile" style="font-size: 16px;"></i></a>

                <hr>     
                
     <?php
     
      }  
       }   
       } else {
                
         header("Location: index.php");
            
            
        }
                ?>

                
            </div>

            <!-- Blog Sidebar Widgets Column -->
           <?php include "includes/sidebar.php"; ?>
        </div>
        <!-- /.row -->

        <hr>

<?php include "includes/footer.php"; ?>  