<?php
session_start();
require('db.php');

if (!isset($_SESSION["admin"])) {
    header('Location: login.php');
    exit;
}

if (isset($_GET['id_modul'])) {
    $id_modul = $_GET['id_modul'];

    // Query untuk menghapus siswa
    $query = "DELETE FROM modul WHERE id_modul = ?";
    $stmt = mysqli_prepare($conn, $query);
    mysqli_stmt_bind_param($stmt, "s", $id_modul);

    if (mysqli_stmt_execute($stmt)) {
        echo "<script>alert('Modul dengan ID: $id_modul berhasil dihapus.'); window.location.href='datamodul-admin.php';</script>";
    } else {
        echo "<script>alert('Terjadi kesalahan saat menghapus data.'); window.location.href='datamodul-admin.php';</script>";
    }
} else {
    header('Location: datamodul-admin.php');
}
?>