<?php

function escape($string) {

return mysqli_real_escape_string($connection, trim(strip_tags($string)));

}

?>