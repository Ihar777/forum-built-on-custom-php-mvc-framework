<!-- YOU CAN CREATE FOLDER PRODUCTS FOR EXAMPLE IN VIEWS -->
<?php require APPROOT . '/views/inc/header.php'; ?>
<?php flash('post_message'); ?>

    <div class="col-md-8">
        <h1 class="text-center">Обсуждения</h1>
<?php foreach($data['discussions'] as $discussion): ?>     
  <div class="panel panel-default">
    <div class="panel-heading"><?php echo "<img src= " . URLROOT . "/img/" . $discussion->avatar . " style='height:40px float:left; alt='avatar'>&nbsp;&nbsp;&nbsp;&nbsp;<span>" . $discussion->name . " " . $discussion->discussionCreated ."</span>"; ?>
</div>
    <div class="panel-body"><h4 class="text-center"><?php echo $discussion->discussionTitle; ?></h4>
     <p><?php echo substr($discussion->discussionContent, 0, 100); ?> ...</p>
        <a href="<?php echo URLROOT; ?>/discussions/show/<?php echo $discussion->discussionId; ?>" class="btn btn-dark">Читать дальше</a>
    </div>
    <div class="panel-footer"><?php echo $discussion->channelTitle; ?></div>
  </div>

<?php endforeach; ?>


   
 
</div>

<?php require APPROOT . '/views/inc/footer.php'; ?>


