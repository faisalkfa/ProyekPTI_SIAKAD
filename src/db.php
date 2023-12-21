<?php
$hostname = 'localhost';
$username = 'user_db';
$password = 'user_pw';
$database = 'database_db';

$conn = mysqli_connect($hostname, $username, $password, $database);
if (!$conn) {
  die("Connection failed: " . mysqli_connect_error());
  //session_destroy();
}