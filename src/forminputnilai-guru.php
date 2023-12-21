<?php
session_start();
require('db.php');
if (!isset($_SESSION["guru"])) {
    header("Location: login.php");
    exit;
}

$guru = $_SESSION["guru"]["nip"];
$ambil_guru = mysqli_query($conn, "SELECT * FROM guru WHERE nip = '$guru'");
$data = mysqli_fetch_array($ambil_guru);

$pesan = "";

if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $nisn = $_POST['nisn'];
    $kode_mapel = $_POST['kode_mapel'];
    $ph1 = $_POST['ph1'];
    $ph2 = $_POST['ph2'];
    $uts = $_POST['uts'];
    $uas = $_POST['uas'];

    // Cek apakah nilai sudah ada
    $cek_query = mysqli_prepare($conn, "SELECT * FROM nilai WHERE nisn = ? AND kode_mapel = ?");
    mysqli_stmt_bind_param($cek_query, 'ss', $nisn, $kode_mapel);
    mysqli_stmt_execute($cek_query);
    $result = mysqli_stmt_get_result($cek_query);

    if (mysqli_num_rows($result) > 0) {
        // Jika nilai sudah ada, lakukan UPDATE
        $query_update = mysqli_prepare($conn, "UPDATE nilai SET ph1 = ?, ph2 = ?, uts = ?, uas = ? WHERE nisn = ? AND kode_mapel = ?");
        mysqli_stmt_bind_param($query_update, 'ddddss', $ph1, $ph2, $uts, $uas, $nisn, $kode_mapel);
        $success = mysqli_stmt_execute($query_update);
    } else {
        // Jika tidak, lakukan INSERT
        $query_insert = mysqli_prepare($conn, "INSERT INTO nilai (nisn, kode_mapel, ph1, ph2, uts, uas) VALUES (?, ?, ?, ?, ?, ?)");
        mysqli_stmt_bind_param($query_insert, 'ssdddd', $nisn, $kode_mapel, $ph1, $ph2, $uts, $uas);
        $success = mysqli_stmt_execute($query_insert);
    }

    if ($success) {
        $pesan = "Nilai berhasil diperbarui.";
        echo "<script>alert('$pesan'); window.location.href = 'inputnilai-guru.php';</script>";
    } else {
        $pesan = "Error: " . mysqli_error($conn);
        echo "<script>alert('$pesan');</script>";
    }
}

// Memeriksa apakah NISN dan kode_mapel diterima dari URL
if (!isset($_GET['nisn']) || !isset($_GET['kode_mapel'])) {
    echo "NISN atau kode mata pelajaran tidak ditemukan.";
    exit;
}

$nisn = $_GET['nisn'];
$kode_mapel = $_GET['kode_mapel'];

// Mengambil data nilai siswa
$query = "SELECT * FROM nilai WHERE nisn = '$nisn' AND kode_mapel = '$kode_mapel'";
$result = mysqli_query($conn, $query);

if (mysqli_num_rows($result) > 0) {
    // Jika data nilai ditemukan
    $nilai = mysqli_fetch_assoc($result);
} else {
    // Jika tidak ada data nilai, set nilai default ke 0
    $nilai = ['ph1' => 0, 'ph2' => 0, 'uts' => 0, 'uas' => 0];
}

$query_siswa = "SELECT nama FROM siswa WHERE nisn = '$nisn'";
$siswa_result = mysqli_query($conn, $query_siswa);
$data_siswa = mysqli_fetch_assoc($siswa_result);
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  </head>

  <body>
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
        <a href="profile-guru.php"><iconify-icon icon="material-symbols:person" width="30" class="align-middle p-3"></iconify-icon><?php echo $data['nama'] ?></a>
      </div>
      <div class="logout-button">
        <a href="logout.php"><iconify-icon icon="material-symbols:logout" width="30" class="align-middle p-3"></iconify-icon>Logout</a>
      </div>
    </header>

    <nav>
    <ul class="side-menu">
      <li class="menu-disabled"><span>Menu</span></li>
      <li>
        <a href="dashboard-guru.php"><img src="../assets/monitor-dashboard.svg" alt="Dashboard" />Dashboard</a>
      </li>
      <li>
        <a href="inputabsensi-guru.php"><img src="../assets/person-rays.svg" alt="Input-Absensi" />Input
          Absensi</a>
      </li>
      <li>
        <a href="lihatsiswa-guru.php"><img src="../assets/person-group.svg" alt="Lihat-Siswa" />Lihat
          Siswa</a>
      </li>
      <li>
        <a href="inputnilai-guru.php" class="active"><img src="../assets/transcript.svg" alt="Input-Nilai" />Input
          Nilai</a>
      </li>
      <li>
        <a href="lihatnilaiakhir-guru.php"><img src="../assets/transcript.svg"
            alt="Lihat-Nilai-Akhir" />Lihat
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
    
    <!-- content -->
    <div class="kotak-isi">
    <div class="form-inputnilai">
        <h2><?php echo $data_siswa['nama']; ?></h2>
<form action="" method="POST">
    <!-- Isi formulir -->
    <input type="hidden" name="nisn" value="<?php echo $nisn; ?>">
    <input type="hidden" name="kode_mapel" value="<?php echo $kode_mapel; ?>">
    <div class="form-group">
        <div class="row">
            <div class="col">
                <label for="ph1">PH1</label>
                <input type="number" name="ph1" required autocomplete="off" value="<?php echo $nilai['ph1']; ?>">
            </div>
            <div class="col">
                <label for="ph2">PH2</label>
                <input type="number" name="ph2" required autocomplete="off" value="<?php echo $nilai['ph2']; ?>">
            </div>
        </div>
    </div>
    <div class="form-group">
        <div class="row">
            <div class="col">
                <label for="uts">Nilai UTS</label>
                <input type="number" name="uts" required autocomplete="off" value="<?php echo $nilai['uts']; ?>">
            </div>
            <div class="col">
                <label for="uas">Nilai UAS</label>
                <input type="number" name="uas" required autocomplete="off" value="<?php echo $nilai['uas']; ?>">
            </div>
        </div>
    </div>
    <button type="submit" id="edit-button">Save</button>
</form>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>
</html>
