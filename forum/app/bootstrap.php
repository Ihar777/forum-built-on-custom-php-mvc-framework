<?php 

/* BEFORE MAKING A NEW APP REWRITE IN /public/.htaccess the following string:
RewriteBase /phpmvc/public 				instead of /phpmvc/ enter your folder

*/
require_once 'config/config.php';
// Load Helpers
require_once 'helpers/url_helper.php';
require_once 'helpers/session_helper.php';

// Autoload Core Libraries
spl_autoload_register(function($className){
	require_once 'libraries/' . $className . '.php';
});

 ?>
 
