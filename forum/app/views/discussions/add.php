<?php require APPROOT . '/views/inc/header.php'; ?>
<a href="<?php echo URLROOT; ?>/discussions" class="btn btn-light"><i class="fa fa-backward"></i>Назад</a>
   <div class="col-md-8">
    <h2 align='center'>Добавить тему для обсуждения</h2>   
    <div class="panel panel-default">
  <div class="panel-heading text-center">
          Задайте новую тему для обсуждения с помощью формы
  </div>
  <div class="panel-body">
      <form action="<?php echo URLROOT; ?>/discussions/add" method="post">
      <div class="form-group">
        <label for="title">Наименование: <sup>*</sup></label><br>
        <input type="text" name="title" class="form-control" value="<?php echo $data['title']; ?>">
       <span><?php echo isset($data['title_err']) ? $data['title_err'] : ''; ?></span>
      </div>
      <div class="form-group">
        <label for="title">Выберите рубрику: <sup>*</sup></label><br>
        <select class="form-control" name="channel_id" id="channel_id" required>
        <?php
        foreach($data['channels'] as $channel):
        ?>
        <option value="<?php echo $channel->id; ?>"><?php echo $channel->title; ?></option>
        <?php endforeach; ?>
        </select>
      </div>
      <div class="form-group">
        <label for="body">Текст: <sup>*</sup></label><br>
          <textarea name="body" cols="80" rows="10" class="form-control"><?php echo $data['body']; ?></textarea>
        <span><?php echo isset($data['body_err']) ? $data['body_err'] : ''; ?></span>
      </div>
      <input type="submit" value="Отправить" class="btn btn-block btn-success">         
    </form>           
  </div>
</div>
</div>

<?php require APPROOT . '/views/inc/footer.php'; ?>