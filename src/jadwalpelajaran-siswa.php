<?php
session_start();
require('db.php');
if (!isset($_SESSION["siswa"])) {
    header("Location: login.php");
    exit;
}
$siswa = $_SESSION["siswa"]["nisn"];
$ambil_siswa = mysqli_query($conn, "SELECT * FROM siswa WHERE nisn = '$siswa'");
$data = mysqli_fetch_array($ambil_siswa);

// Tambahkan query untuk jadwal pelajaran
$query_jadwal = "SELECT jp.hari, jp.jam_mulai, jp.jam_selesai, mp.nama_mapel
                 FROM jadwal_pelajaran jp
                 JOIN mata_pelajaran mp ON jp.kode_mapel = mp.kode_mapel
                 WHERE jp.kode_kelas = '{$data['kode_kelas']}'
                 ORDER BY FIELD(jp.hari, 'Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat'), jp.jam_mulai";
$hasil_jadwal = mysqli_query($conn, $query_jadwal);

$jadwal_pelajaran = [];
while ($row = mysqli_fetch_assoc($hasil_jadwal)) {
    $formatted_jam_mulai = date('H:i', strtotime($row['jam_mulai']));
    $formatted_jam_selesai = date('H:i', strtotime($row['jam_selesai']));

    $jadwal_pelajaran[$row['hari']][] = [
        'mapel' => $row['nama_mapel'],
        'jam' => $formatted_jam_mulai . " - " . $formatted_jam_selesai
    ];
}

$max_rows = 0;
foreach ($jadwal_pelajaran as $hari => $mapels) {
    $max_rows = max($max_rows, count($mapels));
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
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
  </head>

  <body>
    <header>
      <div class="logo-text">
        <a href="dashboard-siswa.php">
          <img src="../assets/LogoSMPN35.png" alt="LogoSMPN35" width="80px"/>
        </a>
      </div>
      <div class="title-text">
        <a href="dashboard-siswa.php">
          <h1>SIAKAD | Siswa</h1>
          <span>SMP Negeri 35 Bandar Lampung</span>
        </a>
      </div>
      <div class="profile-button">
        <a href="profile-siswa.php"><iconify-icon icon="material-symbols:person" width="30" class="align-middle p-3"></iconify-icon><a href="profile-siswa.php"><?php echo $data['nama'] ?></a>
      </div>
      <div class="logout-button">
        <a href="logout.php"><iconify-icon icon="material-symbols:logout" width="30" class="align-middle p-3"></iconify-icon>Logout</a>
      </div>
    </header>

    <nav>
        <ul class="side-menu">
          <li class="menu-disabled"><span>Menu</span></li>
          <li>
            <a href="dashboard-siswa.php"
              ><img
                src="../assets/monitor-dashboard.svg"
                alt="Dashboard"
              />Dashboard</a
            >
          </li>
          <li>
            <a href="jadwalpelajaran-siswa.php" class="active"
              ><img src="../assets/schedule.svg" alt="Jadwal-Pelajaran" />Jadwal
              Pelajaran</a
            >
          </li>
          <li>
            <a href="lihatabsensi-siswa.php"
              ><img src="../assets/person-rays.svg" alt="Absensi" />Absensi</a
            >
          </li>
          <li>
            <a href="lihatnilaiakhir-siswa.php"
              ><img src="../assets/transcript.svg" alt="Lihat-Nilai-Akhir" />Lihat
              Nilai Akhir</a
            >
          </li>
          <li>
            <a href="rinciannilai-siswa.php"
              ><img src="../assets/transcript.svg" alt="Lihat-RIncian-Nilai" />Lihat
              Rincian Nilai</a
            >
          </li>
          <li>
            <a href="lihatmodul-siswa.php" class="menu-end"
              ><img src="../assets/transcript.svg" alt="Lihat-Modul" />Lihat
              Modul</a
            >
          </li>
        </ul>
      </nav>

      <!-- content -->
    <div class="kotak-isi">
        <div class="container">
            <p class="fw-bold">Jadwal Pelajaran</p>
<!-- Bagian tabel jadwal pelajaran -->
<div class="container">
    <table class="table table-striped table-fixed text-center">
        <thead style="background-color: #C6D8AF;">
            <tr>
                <th scope="col">Senin</th>
                <th scope="col">Selasa</th>
                <th scope="col">Rabu</th>
                <th scope="col">Kamis</th>
                <th scope="col">Jumat</th>
            </tr>
        </thead>
        <tbody>
            <?php
            $hari = ['Senin', 'Selasa', 'Rabu', 'Kamis', 'Jumat'];
            for ($i = 0; $i < $max_rows; $i++) {
                echo "<tr>";
                foreach ($hari as $hd) {
                    echo "<td>";
                    if (isset($jadwal_pelajaran[$hd][$i])) {
                        echo $jadwal_pelajaran[$hd][$i]['mapel'] . " (" . $jadwal_pelajaran[$hd][$i]['jam'] . ")";
                    }
                    echo "</td>";
                }
                echo "</tr>";
            }
            ?>
        </tbody>
    </table>
</div>
            <!-- /table -->
        </div>
    </div>
    <!-- /content -->

    <!-- script -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
  integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
  crossorigin="anonymous"></script>
</body>

</html>