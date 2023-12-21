<?php
session_start(); // Memulai sesi

// Menghapus semua data sesi
$_SESSION = array();

// Mengakhiri sesi
session_destroy();

// Redirect ke halaman login
header("Location: login.php");
exit;
?>