<?php
session_start();
require('db.php');
if (!isset($_SESSION["admin"])) {
    header("Location: login.php");
    exit;
}
$admin = $_SESSION["admin"]["nip"];
$ambil_admin = mysqli_query($conn, "SELECT * FROM admin WHERE nip = '$admin'");
$data_admin = mysqli_fetch_array($ambil_admin);

// Query untuk mengambil data guru dari database
$guruQuery = "SELECT * FROM guru ORDER BY nama ASC";
$guruResult = mysqli_query($conn, $guruQuery);

// Fungsi untuk menambahkan mata pelajaran
if ($_SERVER["REQUEST_METHOD"] == "POST") {
    $kode_mapel = $_POST['kode_mapel'];
    $tingkat_kelas = $_POST['tingkat_kelas'];
    $nama_mapel = $_POST['nama_mapel'];
    $nip = $_POST['guru'];

    // Query untuk memasukkan data ke database
    $query = "INSERT INTO mata_pelajaran (kode_mapel, tingkat_kelas, nama_mapel) VALUES ('$kode_mapel', '$tingkat_kelas', '$nama_mapel')";

    if (mysqli_query($conn, $query)) {
        echo "<script>alert('Mata pelajaran berhasil ditambahkan');window.location='daftarmapel-admin.php';</script>";
    } else {
        echo "<script>alert('Gagal menambahkan mata pelajaran');window.location='addmapel-admin.php';</script>";
    }
}
?>

<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Admin | SMP Negeri 35 Bandar Lampung</title>
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
        <a href="dashboard-admin.php">
          <img src="../assets/LogoSMPN35.png" alt="LogoSMPN35" width="80px" />
        </a>
      </div>
      <div class="title-text">
        <a href="dashboard-admin.php">
          <h1>SIAKAD | Admin</h1>
          <span>SMP Negeri 35 Bandar Lampung</span>
        </a>
      </div>
      <div class="profile-button">
        <a href="profile-admin.php"><iconify-icon icon="material-symbols:person" width="30" class="align-middle p-3"></iconify-icon><?php echo $data_admin['nama'] ?></a>
      </div>
      <div class="logout-button">
        <a href="logout.php"><iconify-icon icon="material-symbols:logout" width="30" class="align-middle p-3"></iconify-icon>Logout</a>
      </div>
    </header>
    
    <nav>
      <ul class="side-menu">
        <li class="menu-disabled"><span>Menu</span></li>
        <li>
          <a href="dashboard-admin.php"
            ><img
              src="../assets/monitor-dashboard.svg"
              alt="Dashboard"
            />Dashboard</a
          >
        </li>
        <li>
          <a href="daftarguru-admin.php"
            ><img src="../assets/person-rays.svg" alt="Daftar-Guru" />Daftar Guru</a
          >
        </li>
        <li>
          <a href="daftarsiswa-admin.php"
            ><img src="../assets/person-group.svg" alt="Daftar-Siswa" />Daftar Siswa</a
          >
        </li>
        <li>
          <a href="daftarmapel-admin.php" class="active"
            ><img src="../assets/transcript.svg" alt="Daftar-Mapel" />Daftar Mapel</a
          >
        </li>
        <li>
          <a href="daftarjadwal-admin.php"
            ><img src="../assets/transcript.svg" alt="Daftar-Jadwal" />Daftar Jadwal</a
          >
        </li>
        <li>
          <a href="datanilai-admin.php"
            ><img src="../assets/transcript.svg" alt="Data-Nilai" />Data Nilai</a
          >
        </li>
        <li>
          <a href="datamodul-admin.php" class="menu-end"><img src="../assets/transcript.svg" alt="Data-Modul" />Data Modul </a
          >
        </li>
      </ul>
    </nav>
      <!-- /sidebar -->

     <!-- content -->
    <div class="kotak-isi">
        <div class="container">
        <p>Tambah Mata Pelajaran<p>
    <form action="addmapel-admin.php" method="POST">
        <div class="form-group">
            
        <label for="tingkat_kelas">Tingkat Kelas:</label>
        <select name="tingkat_kelas" id="tingkat_kelas">
                            <option value="7">Kelas 7</option>
                            <option value="8">Kelas 8</option>
                            <option value="9">Kelas 9</option>
                            </select>
        <br><br>
        
        <label for="kode_mapel">Kode Mapel:</label>
        <input type="text" id="kode_mapel" name="kode_mapel" required><br><br>

        <label for="nama_mapel">Nama Mapel:</label>
        <input type="text" id="nama_mapel" name="nama_mapel" required><br><br>

        <input type="submit" value="Tambah">
    </form>
</div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>