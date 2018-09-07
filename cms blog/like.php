<?php require 'includes/db.php'; ?>

<?php 


if(($_GET['like'] && $_GET['p_id'])) {

		$post_id = $_GET['p_id'];
 		$like = $_GET['like'];

 		$query = "SELECT likes FROM posts WHERE post_id='$post_id'";
		$like_query = mysqli_query($connection, $query); 

		$row = mysqli_fetch_array($like_query);

		$like_count = $row['likes'];
		$dislike_count = $row['likes'];

		$cookiename = $post_id;
		$cookievalue = $post_id;
		setcookie($cookiename, $cookievalue, time() + (86400 * 30), "/"); // 86400 = 1 day
		
 		if($like == 'yes'){

			$like_count++;

			$queryupdate = "UPDATE posts SET likes='$like_count' WHERE post_id='$post_id'";
			$like_update = mysqli_query($connection, $queryupdate); 
			
			header("Location: post.php?p_id=$post_id", $cookiename);


 		} else {

			$dislike_count++;

			$queryupdate = "UPDATE posts SET dislikes='$dislike_count' WHERE post_id='$post_id'";
			$like_update = mysqli_query($connection, $queryupdate); 

			header("Location: post.php?p_id=$post_id", $cookiename);

 		}

 	} 

 	

?>

<html>
<head>
	<title></title>
	<link rel="stylesheet" type="text/css" href="assets/css/style.css">
</head>
<body>

</body>
</html>