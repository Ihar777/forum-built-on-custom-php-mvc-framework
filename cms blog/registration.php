<?php  include "includes/db.php"; ?>
<?php  include "admin/functions.php"; ?>
<?php  include "includes/header.php"; ?>
 
<?php
$message = "";

if($_SERVER['REQUEST_METHOD'] == "POST") {
    
    $username = trim($_POST['username']);
    $email    = trim($_POST['email']);
    $email2    = trim($_POST['email2']);	// MOC
    $password = trim($_POST['password']);
    $password2 = trim($_POST['password2']);	// MOC 
       
    $error = [
        
    'username' => '',
    'email'    => '',
    'email2'   => '',
    'password' => '',
    'password2'=> ''
        
    ];
    
    if(strlen($username) < 4) {
        
        $error['username'] = "Username needs to be longer";        
    }
    
    if($username == '') {
        
        $error['username'] = "Username cannot be empty";        
    }
    
    if(username_exists($username)) {
        
        $error['username'] = "Username already exists, pick another one";        
    }
    
    if($email == '') {
        
        $error['email'] = "Email cannot be empty";        
    }
    
    if(filter_var($email, FILTER_VALIDATE_EMAIL)) {

			$email = filter_var($email, FILTER_VALIDATE_EMAIL);
	}
		else {
			$error['email'] = "Invalid email format";
		}
	
    if($email != $email2) {
    
    	$error['email2'] = "Emails don't match";
    
    }
    
    if(email_exists($email)) {
        
        $error['email'] = 'Email already exists, <a href="index.php">Please login</a>';        
    }
    
    if($password == '') {
        
        $error['password'] = "Password cannot be empty";
        
    }
    
      if($password != $password2) {
        
        $error['password2'] = "Passwords don't match";
        
    }
    
    foreach($error as $key => $value) {
        
        if(empty($value)) {
            
            unset($error[$key]);
            
        }
        
    }  
    
    if(empty($error)) {
        
       register_user($username, $email, $password); 
        
       login_user($username, $password);
        
    }
    
} 

?>

    <!-- Navigation -->
    
    <?php  include "includes/navigation.php"; ?>
    
 
    <!-- Page Content -->
    <div class="container">
    
<section id="login">
<div class="container">
    <div class="row">
        <div class="col-xs-6 col-xs-offset-3">
            <div class="form-wrap">
            <h1 class="text-center">Register</h1>
            <form role="form" action="registration.php" method="post" id="login-form" autocomplete="off">

                <div class="form-group">
                    <label for="username" class="sr-only">username</label>
                    <input type="text" name="username" id="username" class="form-control" placeholder="Enter Desired Username"

                    autocomplete="on"

                    value="<?php echo isset($username) ? $username : ''; ?>">

                    <p><?php echo isset($error['username']) ? $error['username'] : ''; ?></p>

                </div>          
                
                 <div class="form-group">
                    <label for="email" class="sr-only">Email</label>
                    <input type="email" name="email" id="email" class="form-control" placeholder="somebody@example.com"

                    autocomplete="off"

                    value="<?php echo isset($email) ? $email : ''; ?>">
                        
                </div>
                
                <div class="form-group">
                    <label for="email2" class="sr-only">Email</label>
                    <input type="email" name="email2" id="email2" class="form-control" placeholder="Reenter email"

                    autocomplete="off"

                    value="<?php echo isset($email2) ? $email2 : ''; ?>">
                    
                    <p><?php if (isset($error['email'])) {
                    
                     echo $error['email'];
                     
                     } else if (isset($error['email2'])) {
                    
                     echo $error['email2'];
                     
                     }
                     
                     
                      ?></p>
                </div>
                
                 <div class="form-group">
                    <label for="password" class="sr-only">Password</label>
                    <input type="password" name="password" id="key" class="form-control" placeholder="Password">

                </div>
                
                <div class="form-group">
                    <label for="password2" class="sr-only">Password</label>
                    <input type="password" name="password2" id="key2" class="form-control" placeholder="Reenter password">
                    
                    <p><?php if (isset($error['password'])) {
                    
                     echo $error['password'];
                     
                     } else if (isset($error['password2'])) {
                    
                     echo $error['password2'];
                     
                     }
                     
                   ?></p>
                </div>

                <input type="submit" name="register" id="btn-login" class="btn btn-custom btn-lg btn-block" value="Register">
            </form>

            </div>
        </div> <!-- /.col-xs-12 -->
    </div> <!-- /.row -->
</div> <!-- /.container -->
</section>


        <hr>



<?php include "includes/footer.php";?>
