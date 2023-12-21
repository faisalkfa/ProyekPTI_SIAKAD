<?php
session_start();
require('db.php');

if (!isset($_SESSION["admin"])) {
    header('Location: login.php');
    exit;
}

if (isset($_GET['id_mapel'])) {
    $id_mapel = $_GET['id_mapel'];

    // Query untuk menghapus Mapel
    $query = "DELETE FROM mata_pelajaran WHERE id_mapel = ?";
    $stmt = mysqli_prepare($conn, $query);
    mysqli_stmt_bind_param($stmt, "s", $id_mapel);

    if (mysqli_stmt_execute($stmt)) {
        echo "<script>alert('Mata Pelajaran dengan ID: $id_mapel berhasil dihapus.'); window.location.href='daftarmapel-admin.php';</script>";
    } else {
        echo "<script>alert('Terjadi kesalahan saat menghapus data.'); window.location.href='daftarmapel-admin.php';</script>";
    }
} else {
    header('Location: daftarmapel-admin.php');
}
?>