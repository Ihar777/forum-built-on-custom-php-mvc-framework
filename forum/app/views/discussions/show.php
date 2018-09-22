<?php require APPROOT . '/views/inc/header.php'; ?>
<div class="col-md-8">
<a href="<?php echo URLROOT; ?>/discussions" class="btn btn-light"><i class="fa fa-backward"></i> Назад</a>
<br>
<div class="panel panel-default">
   <div class="panel-heading">
    <img src="<?php echo URLROOT; ?>/img/<?php echo $data['user']->avatar; ?>"> <?php echo $data['user']->name; ?> <?php echo $data['discussion']->created_at; ?>
    
<?php if($data['discussion']->user_id == $_SESSION['user_id']) : ?>
<form class="pull-right" action="<?php echo URLROOT; ?>/discussions/delete/<?php echo $data['discussion']->discussionId; ?>" method="post">
    <input type="submit" value="Удалить статью" class="btn btn-danger">
</form>
<a href="<?php echo URLROOT; ?>/discussions/edit/<?php echo $data['discussion']->discussionId; ?>" class="pull-right m-r-sm btn btn-primary">Редактировать</a>
<?php endif; ?>

</div>
<div class="panel-body"><h1 class="text-center"><?php echo $data['discussion']->title; ?></h1>
<br>
<p><?php echo $data['discussion']->content; ?></p>

<br>
    </div>
    <div class="panel-footer"><?php echo $data['discussion']->channelTitle; ?></div>
  </div>



<?php if(!empty($data['replies'])){
    ?>
    <h3 class="text-center">Комментарии</h3>
    <?php
    foreach($data['replies'] as $reply) { 
    foreach($data['repliers'] as $replier){
        if($replier->id == $reply->user_id){
        break;
        }
    }
        ?>
<div class="panel panel-default">
   <div class="panel-heading">
    <img src="<?php echo URLROOT; ?>/img/<?php echo $replier->avatar; ?>"> <?php echo $replier->name; ?> <?php echo $reply->created_at; ?>
</div>
<div class="panel-body">
<?php       echo $reply->content . "<br><br><hr/>"; ?>
     </div>
    </div>
   <?php
    }
    ?>
  
    <h3 class="text-center">Добавить комментарий</h3>
    <?php
} else {
   
    echo "<h3 class='text-center'>Оставьте комментарий первым</h3>";
}
?>

<br>
<form action="<?php echo URLROOT; ?>/discussions/show/<?php echo $data['discussion']->id; ?>" method="post">
      <div class="form-group">
        <label for="content">Текст: <sup>*</sup></label>
          <textarea name="content" cols="80" rows="10"></textarea>
        <span><?php echo isset($data['content_err']) ? $data['content_err'] : ''; ?></span>
      </div>
      <input type="submit" value="Отправить" class="btn btn-success">         
</form>



</div>
<?php require APPROOT . '/views/inc/footer.php'; ?>