<?php
session_start();
require('db.php');
if (!isset($_SESSION["siswa"])) {
    header("Location: login.php");
    exit;
}
$siswa = $_SESSION["siswa"]["nisn"];
$ambil_siswa = mysqli_query($conn, "SELECT * FROM siswa WHERE nisn = $siswa");
$data = mysqli_fetch_array($ambil_siswa);

$query_nilai_rata = "SELECT AVG((ph1 * 0.3 + ph2 * 0.3 + uts * 0.2 + uas * 0.2)) AS nilai_rata_rata 
                     FROM nilai 
                     WHERE nisn = '$siswa'";
$result_nilai_rata = mysqli_query($conn, $query_nilai_rata);
$data_nilai_rata = mysqli_fetch_assoc($result_nilai_rata);

// Memeriksa apakah nilai_rata_rata adalah null dan tangani
if ($data_nilai_rata['nilai_rata_rata'] !== null) {
    $nilai_rata_rata = number_format($data_nilai_rata['nilai_rata_rata'], 2);
} else {
    $nilai_rata_rata = '0.00';
}
?>

<!DOCTYPE html>
<html>

<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Siswa | SMP Negeri 35 Bandar Lampung</title>
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
    <header>
        <div class="logo-text">
            <a href="dashboard-siswa.php">
                <img src="../assets/LogoSMPN35.png" alt="LogoSMPN35" width="80px" />
            </a>
        </div>
        <div class="title-text">
            <a href="dashboard-siswa.php">
                <h1>SIAKAD | Siswa</h1>
                <span>SMP Negeri 35 Bandar Lampung</span>
            </a>
        </div>
        <div class="profile-button">
            <a href="profile-siswa.php"><iconify-icon icon="material-symbols:person" width="35"
                    class="align-middle p-3"></iconify-icon>
                <?php echo $data['nama'] ?>
            </a>
        </div>
        <div class="logout-button">
        <a href="logout.php"><iconify-icon icon="material-symbols:logout" width="30" class="align-middle p-3"></iconify-icon>Logout</a>
      </div>
    </header>

    <nav>
        <ul class="side-menu">
            <li class="menu-disabled"><span>Menu</span></li>
            <li>
                <a href="dashboard-siswa.php" class="active"><img src="../assets/monitor-dashboard.svg"
                        alt="Dashboard" />Dashboard</a>
            </li>
            <li>
                <a href="jadwalpelajaran-siswa.php"><img src="../assets/schedule.svg" alt="Jadwal-Pelajaran" />Jadwal
                    Pelajaran</a>
            </li>
            <li>
                <a href="lihatabsensi-siswa.php"><img src="../assets/person-rays.svg" alt="Absensi" />Absensi</a>
            </li>
            <li>
                <a href="lihatnilaiakhir-siswa.php"><img src="../assets/transcript.svg" alt="Lihat-Nilai-Akhir" />Lihat
                    Nilai Akhir</a>
            </li>
            <li>
                <a href="rinciannilai-siswa.php"><img src="../assets/transcript.svg" alt="Lihat-RIncian-Nilai" />Lihat
                    Rincian Nilai</a>
            </li>
            <li>
                <a href="lihatmodul-siswa.php" class="menu-end"><img src="../assets/transcript.svg" alt="Lihat-Modul" />Lihat
                    Modul</a>
            </li>
        </ul>
    </nav>

    <div class="kotak-isi">
        <div class="kelas-box">
            <h1>Kelas</h1>
            <span>
                <?php echo $data['kode_kelas'] ?>
            </span>
        </div>
        <div class="kotak-hijau-kelas"></div>

        <div class="nilai-box">
            <h1>Nilai Rata-rata</h1>
            <span>
                <?php echo $nilai_rata_rata; ?>
            </span>
        </div>
        <div class="kotak-hijau-nilai-rata-rata"></div>

        <div class="data-diri-dashboard">
            <div class="column">
                <div class="data-item">
                    <label for="nama">Nama :</label>
                    <span id="nama">
                        <?php echo $data['nama'] ?>
                    </span>
                </div>
                <div class="data-item">
                    <label for="nisn">NISN :</label>
                    <span id="nisn">
                        <?php echo $data['nisn'] ?>
                    </span>
                </div>
                <div class="data-item">
                    <label for="kelas">Kelas :</label>
                    <span id="kelas">
                        <?php echo $data['kode_kelas'] ?>
                    </span>
                </div>
            </div>
            <div class="column">
                <div class="data-item">
                    <label for="jenis-kelamin">Jenis Kelamin :</label>
                    <span id="jenis-kelamin">
                        <?php echo $data['jenis_kelamin'] ?>
                    </span>
                </div>
                <div class="data-item">
                    <label for="agama">Agama :</label>
                    <span id="agama">
                        <?php echo $data['agama'] ?>
                    </span>
                </div>
                <div class="data-item">
                    <label for="nama-ibu">Nama Wali Murid :</label>
                    <span id="nama-ibu">
                        <?php echo $data['nama_wali'] ?>
                    </span>
                </div>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>

</html>