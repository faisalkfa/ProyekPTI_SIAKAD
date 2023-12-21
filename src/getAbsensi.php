<?php
require('db.php');
session_start(); // Pastikan baris ini ada untuk memulai sesi

if (!isset($_SESSION["siswa"])) {
    // Handle kasus dimana sesi siswa tidak ada atau telah habis
    echo "Sesi tidak ditemukan.";
    exit; // Keluar dari script untuk menghindari eksekusi lebih lanjut
}

$nisn_siswa = $_SESSION["siswa"]["nisn"];

if(isset($_GET['kode_mapel'])) {
    $kode_mapel = $_GET['kode_mapel'];
    $query = "SELECT * FROM absensi WHERE kode_mapel = '$kode_mapel' AND nisn = '$nisn_siswa' ORDER BY pertemuan_ke ASC";
    $result = mysqli_query($conn, $query);

    if(mysqli_num_rows($result) > 0) {
        while($row = mysqli_fetch_assoc($result)) {
            echo "<tr><td>" . $row['pertemuan_ke'] . "</td><td>" . $row['keterangan'] . "</td><td>" . $row['waktu_input'] . "</td></tr>";
        }
    } else {
        // Tidak ada data absensi
        echo "<tr><td colspan='3' class='text-center'>Belum Terdapat Data Absensi</td></tr>";
    }
}
?>