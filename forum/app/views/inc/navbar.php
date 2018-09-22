 <nav class="navbar navbar-default">
  <div class="container-fluid">
    <div class="navbar-header">
           <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="<?php echo URLROOT; ?>"><?php echo SITENAME; ?></a>
    </div>
    <form class="navbar-form navbar-nav" method="POST" action="<?php echo URLROOT; ?>/discussions"> 
      <div class="input-group">
        <input id="search" type="text" class="form-control" placeholder="Поиск" name="filter">
        <div class="input-group-btn">
          <button class="btn btn-default" type="submit">
            <i class="glyphicon glyphicon-search"></i>
          </button>
        </div>
      </div>
    </form>
      <ul class="nav navbar-nav navbar-right">
      <?php if(isset($_SESSION['user_id'])): ?>
       <span class="dropdown">
          <button id="border" class="btn btn-default dropdown-toggle" type="button" data-toggle="dropdown">
          <li><a id="user" class="dropdown-toggle" type="button" data-toggle="dropdown" href="#"><?php echo $_SESSION['user_name']; ?></a>
          <span class="caret"></span></li>
          </button>
          <ul class="dropdown-menu" id="logout">
         <li><a href="<?php echo URLROOT; ?>/users/logout">Выйти</a></li>
          </ul>
      </span> 
          
      <?php else : ?>
      <li><a href="<?php echo URLROOT; ?>/users/login">Войти</a></li>
      <li><a href="<?php echo URLROOT; ?>/users/register">Зарегистрироваться</a></li>
      <?php endif; ?>
    </ul>
  </div>
</nav>