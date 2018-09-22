<?php 
//require APPROOT . '/config/config.php';
$con = mysqli_connect('localhost', '', '', 'forum8585');
mysqli_set_charset($con,"utf8");
$query = mysqli_query($con, 'SELECT * FROM channels');

 // для отображения русских букв. Дополнительно кодировка изменена utf8_general_ci на в phpmyadmin

//$channels = mysqli_fetch_array($query);
?>
<!DOCTYPE html>
<html lang="ru">
<head>
  <title>Форум</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" integrity="sha384-wvfXpqpZZVQGK6TAh5PVlGOfQNHSoD2xbE+QkPxCAFlNEevoEH3Sl0sibVcOQVnN" crossorigin="anonymous">
	<link rel="stylesheet" href="<?php echo URLROOT; ?>/css/style.css">
	<title> <?php echo SITENAME; ?> </title>
</head>
<body>
<div class="container">
<?php require APPROOT . '/views/inc/navbar.php'; ?>
    </div>
<div class="container">

<div class="row">
       <div class="col-md-4" id="sidebar">
       <a class="form-control btn btn-primary" id="theme" href="<?php echo URLROOT; ?>/discussions/add"> Задать тему для обсуждения</a>     
       <br><br>    
       <div class="panel panel-default">
           <div class="panel-body">
               <ul class="list-group">
                   <li class="list-group-item"><a href="<?php echo URLROOT; ?>/discussions">На главную</a></li>
                   <li class="list-group-item"><a href="<?php echo URLROOT; ?>/discussions?filter=me">Мои обсуждения</a></li>
                   <li class="list-group-item"><a href="<?php echo URLROOT; ?>/discussions?filter=closed">Мои завершенные обсуждения</a></li>
                   <li class="list-group-item"><a href="<?php echo URLROOT; ?>/discussions?filter=open">Мои незавершенные обсуждения</a></li>
               </ul>
           </div>
       </div>
       <div class="panel panel-default">
           <div class="panel-body">
               <ul class="list-group">
                  <?php while($channel=mysqli_fetch_array($query)): ?>
                   <li class="list-group-item"><a href="<?php echo URLROOT; ?>/channels/<?php echo $channel['slug']; ?>"><?php echo $channel['title']; ?></a></li>
                   <?php endwhile; ?>
               </ul>
           </div>
       </div>
       </div>
	