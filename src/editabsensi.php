<?php
session_start();
require('db.php');

// Pastikan hanya guru yang bisa mengakses
if (!isset($_SESSION["guru"])) {
    header("Location: login.php");
    exit;
}

// Cek apakah ada ID Absensi yang dikirim
if (!isset($_GET['id'])) {
    echo "<script>alert('ID Absensi tidak ditemukan'); location='dashboard-guru.php';</script>";
    exit;
}

$guru = $_SESSION["guru"]["nip"];
$ambil_guru = mysqli_query($conn, "SELECT * FROM guru WHERE nip = '$guru'");
$data_guru = mysqli_fetch_array($ambil_guru);

$id_absensi = $_GET['id'];

// Mengambil data absensi dari database
$query = mysqli_prepare($conn, "SELECT a.*, s.nama FROM absensi a JOIN siswa s ON a.nisn = s.nisn WHERE a.id_absensi = ?");
mysqli_stmt_bind_param($query, 'i', $id_absensi);
mysqli_stmt_execute($query);
$result = mysqli_stmt_get_result($query);
$data_absensi = mysqli_fetch_assoc($result);

if (!$data_absensi) {
    echo "<script>alert('Data Absensi tidak ditemukan'); location='dashboard-guru.php';</script>";
    exit;
}

// Memproses form ketika disubmit
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $keterangan = mysqli_real_escape_string($conn, $_POST['keterangan']);

    // Update data absensi
    $update_query = mysqli_prepare($conn, "UPDATE absensi SET keterangan = ? WHERE id_absensi = ?");
    mysqli_stmt_bind_param($update_query, 'si', $keterangan, $id_absensi);
    $result = mysqli_stmt_execute($update_query);

    if ($result) {
        echo "<script>alert('Absensi berhasil diupdate!'); location='inputabsensi-guru.php';</script>";
    } else {
        echo "<script>alert('Gagal mengupdate absensi'); location='editabsensi.php?id=$id_absensi';</script>";
    }
}
?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Guru | SMP Negeri 35 Bandar Lampung</title>
    <link rel="icon" href="../assets/LogoSMPN35.png" type="image/png">
    <!-- style vanilla css -->
    <link rel="stylesheet" type="text/css" href="../styles/styles.css" />
    <!-- iconify -->
    <script src="https://code.iconify.design/iconify-icon/1.0.8/iconify-icon.min.js"></script>
    <!-- bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
</head>

<body>
    <!-- Topbar -->
    <header>
        <div class="logo-text">
            <a href="dashboard-guru.php">
                <img src="../assets/LogoSMPN35.png" alt="LogoSMPN35" width="80px" />
            </a>
        </div>
        <div class="title-text">
            <a href="dashboard-guru.php">
                <h1>SIAKAD | Guru</h1>
                <span>SMP Negeri 35 Bandar Lampung</span>
            </a>
        </div>
        <div class="profile-button">
            <a href="profile-guru.php"><iconify-icon icon="material-symbols:person" width="30"
                    class="align-middle p-3"></iconify-icon><a href="profile-guru.php">
                    <?php echo $data_guru['nama'] ?>
                </a>
        </div>
        <div class="logout-button">
        <a href="logout.php"><iconify-icon icon="material-symbols:logout" width="30" class="align-middle p-3"></iconify-icon>Logout</a>
      </div>
    </header>
    <!-- /Topbar -->

    <!-- sidebar -->
    <nav>
        <ul class="side-menu">
            <li class="menu-disabled"><span>Menu</span></li>
            <li>
                <a href="dashboard-guru.php"><img src="../assets/monitor-dashboard.svg" alt="Dashboard" />Dashboard</a>
            </li>
            <li>
                <a href="inputabsensi-guru.php" class="active"><img src="../assets/person-rays.svg"
                        alt="Input-Absensi" />Input
                    Absensi</a>
            </li>
            <li>
                <a href="lihatsiswa-guru.php"><img src="../assets/person-group.svg" alt="Lihat-Siswa" />Lihat
                    Siswa</a>
            </li>
            <li>
                <a href="inputnilai-guru.php"><img src="../assets/transcript.svg" alt="Input-Nilai" />Input
                    Nilai</a>
            </li>
            <li>
                <a href="lihatnilaiakhir-guru.php"><img src="../assets/transcript.svg" alt="Lihat-Nilai-Akhir" />Lihat
                    Nilai Akhir</a>
            </li>
            <li>
                <a href="listmodul-guru.php"><img src="../assets/transcript.svg" alt="List-Modul" />List Modul</a>
            </li>
            <li>
                <a href="tambahmodul-guru.php" class="menu-end"><img src="../assets/transcript.svg" alt="Tambah-Modul" />Tambah
                    Modul</a>
            </li>
        </ul>
    </nav>
    <!-- /sidebar -->

    <!-- container -->
    <div class="kotak-isi">
        <!-- button group -->
    
    <div class="container">
        <p>Edit Absensi</p>
        <form action="" method="post">
            <div class="form-group">
                <label for="namaSiswa">Nama Siswa</label>
                <input type="text" id="namaSiswa" name="namaSiswa" value="<?php echo $data_absensi['nama'] ?>" readonly/><br><br>
                
                <label for="keterangan" class="form-label">Keterangan</label>
                <select name="keterangan" id="keterangan" class="form-select">
                    <option value="Hadir" <?php echo ($data_absensi['keterangan'] == 'Hadir') ? 'selected' : ''; ?>>Hadir</option>
                    <option value="Izin" <?php echo ($data_absensi['keterangan'] == 'Izin') ? 'selected' : ''; ?>>Izin</option>
                    <option value="Sakit" <?php echo ($data_absensi['keterangan'] == 'Sakit') ? 'selected' : ''; ?>>Sakit</option>
                    <option value="Alpa" <?php echo ($data_absensi['keterangan'] == 'Alpa') ? 'selected' : ''; ?>>Alpa</option>
                </select>
                
                <br><br>
                
            <input type="submit" value="Update">
        </form>
    </div>
    
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>

</html>