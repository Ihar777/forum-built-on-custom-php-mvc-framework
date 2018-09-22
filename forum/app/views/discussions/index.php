<!-- YOU CAN CREATE FOLDER PRODUCTS FOR EXAMPLE IN VIEWS -->
<?php require APPROOT . '/views/inc/header.php'; ?>

    <div class="col-md-8">
       <?php flash('post_message'); ?>
        <h1 class="text-center">Обсуждения</h1>
<?php foreach($data['discussions'] as $discussion): ?>     
  <div class="panel panel-default">
    <div class="panel-heading"><?php echo "<img src= " . URLROOT . "/img/" . $discussion->avatar . " style='height:40px float:left; alt='avatar'>&nbsp;&nbsp;&nbsp;&nbsp;<span>" . $discussion->name . " " . $discussion->discussionCreated ."</span>"; ?>
</div>
    <div class="panel-body"><h4 class="text-center"><?php echo $discussion->title; ?></h4>
     <p><?php echo substr($discussion->content, 0, 100); ?> ...</p>
        <a href="<?php echo URLROOT; ?>/discussions/show/<?php echo $discussion->discussionId; ?>" class="btn btn-dark">Читать дальше</a>
    </div>
      <div class="panel-footer"><?php echo $discussion->channelTitle; ?></div>
  </div>
  
  <?php endforeach; ?>

  <ul class="pager">
  
  <?php
        for($k=1; $k<=$data['number_of_pages']; $k++){
            
            if(isset($_GET['filter']) && $_GET['filter'] == 'me'){
                if((!isset($_GET['page']) && $k==1) || (isset($_GET['page']) && $k==$_GET['page'])){
                echo "<li><a class='active_link' href='" . URLROOT . "/discussions?filter=me&&page=$k'>$k</a></li>";     
                } else {
               echo "<li><a href='" . URLROOT . "/discussions?filter=me&&page=$k'>$k</a></li>"; 
                }
            } else {
                          if((!isset($_GET['page']) && $k==1) || (isset($_GET['page']) && $k==$_GET['page'])){
                     echo "<li><a class='active_link' href='" . URLROOT . "/discussions?page=$k'>$k</a></li>";
                 } else {
                    echo "<li><a href='" . URLROOT . "/discussions?page=$k'>$k</a></li>";
        }
            }
        }
  ?>
        </ul>
</div>

<?php require APPROOT . '/views/inc/footer.php'; ?>


<!--
   $data = [
                'discussions' => $discussions,
                'count_discussions' => $count_discussions,
                'limit_per_page' => $limit_per_page,
                'number_of_pages' => $number_of_pages
            ];
-->
