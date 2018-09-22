<?php require APPROOT . '/views/inc/header.php'; ?>
<a href="<?php echo URLROOT; ?>/discussions" class="btn btn-light"><i class="fa fa-backward"></i> Назад</a>
    <h2>Редактирование</h2>
    <p>Форма для редактирования</p>
    <form action="<?php echo URLROOT; ?>/discussions/edit/<?php echo $data['id']; ?>" method="post">
      <div class="form-group">
        <label for="title">Наименование: <sup>*</sup></label>
        <input type="text" name="title" value="<?php echo $data['title']; ?>">
        <span><?php echo isset($data['title_err']) ? $data['title_err'] : ''; ?></span>
      </div>
      <div class="form-group">
        <label for="content">Текст: <sup>*</sup></label>
          <textarea name="content" cols="80" rows="10"><?php echo $data['content']; ?></textarea>
        <span><?php echo isset($data['content_err']) ? $data['content_err'] : ''; ?></span>
      </div>
      <input type="submit" value="Отправить" class="btn btn-success">         
    </form>

<?php require APPROOT . '/views/inc/footer.php'; ?>