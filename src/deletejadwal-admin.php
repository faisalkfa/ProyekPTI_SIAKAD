<?php
session_start();
require('db.php');

if (!isset($_SESSION["admin"])) {
    header('Location: login.php');
    exit;
}

if (isset($_GET['id_jadwal'])) {
    $id_jadwal = $_GET['id_jadwal'];

    // Query untuk menghapus Jadwal
    $query = "DELETE FROM jadwal_pelajaran WHERE id_jadwal = ?";
    $stmt = mysqli_prepare($conn, $query);
    mysqli_stmt_bind_param($stmt, "s", $id_jadwal);

    if (mysqli_stmt_execute($stmt)) {
        echo "<script>alert('Jadwal dengan ID: $id_jadwal berhasil dihapus.'); window.location.href='daftarjadwal-admin.php';</script>";
    } else {
        echo "<script>alert('Terjadi kesalahan saat menghapus data.'); window.location.href='daftarjadwal-admin.php';</script>";
    }
} else {
    header('Location: daftarjadwal-admin.php');
}
?>