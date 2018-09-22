<?php require APPROOT . '/views/inc/header.php'; ?>

       <div class="col-md-8">
        <?php flash('register_success'); ?>
        <div class="panel panel-default">
    <div class="panel-heading text-center">
        <h2>Войти</h2>
        <p>Введите адрес электронной почты и пароль</p>
    </div>
    <div class="panel-body">
       <form class="form-horizontal" action="<?php echo URLROOT; ?>/users/login" method="post">
      <div class="form-group">
        <label class="control-label col-sm-3" for="email">Электронная почта: <sup>*</sup></label>
        <div class="col-sm-6">
          <input type="email" name="email" class="form-control <?php echo (!empty($data['email_err'])) ? 'is-invalid' : ''; ?>" id="email" value="<?php echo $data['email']; ?>">
            <span id="eer" class="text-danger"><?php echo $data['email_err']; ?></span>
        </div>
      </div>
      <div class="form-group">
        <label class="control-label col-sm-3" for="pwd">Пароль: <sup>*</sup></label>
        <div class="col-sm-6">
          <input type="password" name="password" class="form-control <?php echo (!empty($data['password_err'])) ? 'is-invalid' : ''; ?>" id="pwd" value="<?php echo $data['password']; ?>">
            <span id="per" class="text-danger"><?php echo $data['password_err']; ?></span>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-3 col-sm-6">
          <div class="checkbox">
            <label><input type="checkbox">Запомнить</label>
          </div>
        </div>
      </div>
      <div class="form-group">
        <div class="col-sm-offset-3 col-sm-6">
          <button type="submit" class="btn btn-primary">Войти</button>&nbsp;
          &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span><a href="#">Забыли пароль?</a></span>
        </div>
      </div>
    </form> 
    </div>
  </div>
</div>
      </div>
      
<?php require APPROOT . '/views/inc/footer.php'; ?>