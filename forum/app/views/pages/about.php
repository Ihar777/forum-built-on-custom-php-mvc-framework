<?php require APPROOT . '/views/inc/header.php'; ?>
<h1><?php echo $data['title']; ?></h1>
<p><?php echo $data['description']; ?></p>
<?php 
$avatar = $_SESSION['avatar'];
echo
 "<img src= " . URLROOT . "/img/" . $avatar . " class='img-responsive' style='height:100%;' alt='avatar'>";
 ?>
<?php require APPROOT . '/views/inc/footer.php'; ?>

