<?php
session_start();
require('db.php');

if (!isset($_SESSION["admin"])) {
    header('Location: login.php');
    exit;
}

if (isset($_GET['nip'])) {
    $nip = $_GET['nip'];

    // Query untuk menghapus guru
    $query = "DELETE FROM guru WHERE nip = ?";
    $stmt = mysqli_prepare($conn, $query);
    mysqli_stmt_bind_param($stmt, "s", $nip);

    if (mysqli_stmt_execute($stmt)) {
        echo "<script>alert('Guru dengan NIP: $nip berhasil dihapus.'); window.location.href='daftarguru-admin.php';</script>";
    } else {
        echo "<script>alert('Terjadi kesalahan saat menghapus data.'); window.location.href='daftarguru-admin.php';</script>";
    }
} else {
    header('Location: daftarguru-admin.php');
}
?>