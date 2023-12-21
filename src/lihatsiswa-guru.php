<?php
session_start();
require('db.php');

if (!isset($_SESSION["guru"])) {
    header('Location: login.php');
    exit;
}

$guru = $_SESSION["guru"]["nip"];
$ambil_guru = mysqli_query($conn, "SELECT * FROM guru WHERE nip = '$guru'");
$data_guru = mysqli_fetch_array($ambil_guru);

$nip_guru = mysqli_real_escape_string($conn, $_SESSION["guru"]["nip"]);

// Query untuk mengambil daftar kelas yang diampu oleh guru
$query_kelas = mysqli_prepare($conn, "SELECT DISTINCT jp.kode_kelas FROM jadwal_pelajaran jp WHERE jp.nip = ?");
mysqli_stmt_bind_param($query_kelas, 's', $nip_guru);
mysqli_stmt_execute($query_kelas);
$hasil_kelas = mysqli_stmt_get_result($query_kelas);

$kelas_guru = [];
while ($kelas = mysqli_fetch_assoc($hasil_kelas)) {
    $kelas_guru[] = $kelas['kode_kelas'];
}

$daftar_siswa = [];
if (isset($_GET['kelas'])) {
    $kode_kelas_dipilih = mysqli_real_escape_string($conn, $_GET['kelas']);

    // Query untuk mengambil data siswa dari kelas yang dipilih
    $query_siswa = mysqli_prepare($conn, "SELECT s.nama, s.nisn, s.no_hp, s.no_telepon_wali FROM siswa s WHERE s.kode_kelas = ? ORDER BY nama ASC");
    mysqli_stmt_bind_param($query_siswa, 's', $kode_kelas_dipilih);
    mysqli_stmt_execute($query_siswa);
    $hasil_siswa = mysqli_stmt_get_result($query_siswa);

    while ($siswa = mysqli_fetch_assoc($hasil_siswa)) {
        $daftar_siswa[] = $siswa;
    }
}
?>

<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Guru | SMP Negeri 35 Bandar Lampung</title>
    <link rel="icon" href="../assets/LogoSMPN35.png" type="image/png">
    <!-- style vanilla css -->
    <link rel="stylesheet" type="text/css" href="../styles/styles.css" />
    <!-- iconify -->
    <script src="https://code.iconify.design/iconify-icon/1.0.8/iconify-icon.min.js"></script>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

  </head>
  <body>
    <!-- topbar -->
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
        <a href="profile-guru.php"><iconify-icon icon="material-symbols:person" width="30" class="align-middle p-3"></iconify-icon><?php echo $data_guru['nama'] ?></a>
      </div>
      <div class="logout-button">
        <a href="logout.php"><iconify-icon icon="material-symbols:logout" width="30" class="align-middle p-3"></iconify-icon>Logout</a>
      </div>
    </header>
      <!-- /topbar -->
  
      <!-- sidebar -->
      <nav>
        <ul class="side-menu">
          <li class="menu-disabled"><span>Menu</span></li>
          <li>
            <a href="dashboard-guru.php"
              ><img
                src="../assets/monitor-dashboard.svg"
                alt="Dashboard"
              />Dashboard</a
            >
          </li>
          <li>
            <a href="inputabsensi-guru.php"
              ><img src="../assets/person-rays.svg" alt="Input-Absensi" />Input
              Absensi</a
            >
          </li>
          <li>
            <a href="lihatsiswa-guru.php" class="active"
              ><img src="../assets/person-group.svg" alt="Lihat-Siswa" />Lihat
              Siswa</a
            >
          </li>
          <li>
            <a href="inputnilai-guru.php"
              ><img src="../assets/transcript.svg" alt="Input-Nilai" />Input
              Nilai</a
            >
          </li>
          <li>
            <a href="lihatnilaiakhir-guru.php"
              ><img src="../assets/transcript.svg" alt="Lihat-Nilai-Akhir" />Lihat
              Nilai Akhir</a
            >
          </li>
          <li>
            <a href="listmodul-guru.php"
              ><img src="../assets/transcript.svg" alt="List-Modul" />List Modul</a
            >
          </li>
          <li>
            <a href="tambahmodul-guru.php" class="menu-end"
              ><img src="../assets/transcript.svg" alt="Tambah-Modul" />Tambah
              Modul</a
            >
          </li>
        </ul>
      </nav>
      <!-- /sidebar -->

      <!-- content -->
      <div class="kotak-isi">
        <!-- button pilih kelas -->
        <div class="dropdown container mb-3">
    <button class="btn border-dark dropdown-toggle" style="background-color: #C6D8AF;" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
      Pilih Kelas
    </button>
    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
        <?php foreach ($kelas_guru as $kode_kelas): ?>
            <li><a class="dropdown-item" href="lihatsiswa-guru.php?kelas=<?php echo $kode_kelas; ?>"><?php echo $kode_kelas; ?></a></li>
        <?php endforeach; ?>
    </ul>
</div>
          <!-- /button pilih kelas -->

          <!-- table -->
            <!-- Bagian tabel data siswa -->
<div class="container">
      <table class="table table-striped table-fixed text-center">
          <caption>Data Siswa</caption>
          <thead style="background-color: #C6D8AF;">
              <tr>
                  <th scope="col">No.</th>
                  <th scope="col">Nama Siswa</th>
                  <th scope="col">NISN</th>
                  <th scope="col">No Telepon</th>
                  <th scope="col">No Telepon Wali</th>
                  <th scope="col">Action</th>
              </tr>
          </thead>
          <tbody>
              <?php $no = 1; foreach ($daftar_siswa as $siswa): ?>
                  <tr>
                      <td><?php echo $no++; ?></td>
                      <td scope="row"><?php echo htmlspecialchars($siswa['nama']); ?></td>
                      <td><?php echo htmlspecialchars($siswa['nisn']); ?></td>
                      <td><?php echo htmlspecialchars($siswa['no_hp']); ?></td>
                      <td><?php echo htmlspecialchars($siswa['no_telepon_wali']); ?></td>
                      <td><a href="viewsiswa-guru.php?nisn=<?php echo $siswa['nisn']; ?>" class="btn btn-success btn-sm">
            <iconify-icon icon="akar-icons:eye"></iconify-icon>
        </a></button></td>
                  </tr>
              <?php endforeach; ?>
          </tbody>
      </table>
  </div>
          <!-- /table -->
      </div>
      <!-- /content -->

    <!-- script -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
  </body>
</html>