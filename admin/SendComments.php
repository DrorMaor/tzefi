<?php

         ini_set('display_errors', 1);
        ini_set('display_startup_errors', 1);
        error_reporting(E_ALL);


    $msg = $_GET["contact"] . "\r---------\r" . $_GET["comments"] . "\r";
    $msg .= "---------------------------\r\r";
    file_put_contents("../ContactUs", $msg, FILE_APPEND);
    mail("dror.m.maor@gmail.com", "BFB msg", $msg);

	$handle = fopen("comments", 'a');
	fwrite($handle, $msg . "\r\n");

?>
