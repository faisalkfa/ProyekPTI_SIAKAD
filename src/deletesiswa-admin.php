<?php
session_start();
require('db.php');

if (!isset($_SESSION["admin"])) {
    header('Location: login.php');
    exit;
}

if (isset($_GET['nisn'])) {
    $nisn = $_GET['nisn'];

    // Query untuk menghapus siswa
    $query = "DELETE FROM siswa WHERE nisn = ?";
    $stmt = mysqli_prepare($conn, $query);
    mysqli_stmt_bind_param($stmt, "s", $nisn);

    if (mysqli_stmt_execute($stmt)) {
        echo "<script>alert('Siswa dengan NISN: $nisn berhasil dihapus.'); window.location.href='daftarsiswa-admin.php';</script>";
    } else {
        echo "<script>alert('Terjadi kesalahan saat menghapus data.'); window.location.href='daftarsiswa-admin.php';</script>";
    }
} else {
    header('Location: daftarsiswa-admin.php');
}
?>