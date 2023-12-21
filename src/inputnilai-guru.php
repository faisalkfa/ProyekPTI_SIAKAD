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

// Mengambil mata pelajaran yang diampu oleh guru
$query_mapel = mysqli_prepare($conn, "SELECT DISTINCT mp.kode_mapel, mp.nama_mapel, mp.tingkat_kelas FROM mata_pelajaran mp JOIN jadwal_pelajaran jp ON mp.kode_mapel = jp.kode_mapel WHERE jp.nip = ?");
mysqli_stmt_bind_param($query_mapel, 's', $nip_guru);
mysqli_stmt_execute($query_mapel);
$result_mapel = mysqli_stmt_get_result($query_mapel);

$mapel_guru = [];
while ($mapel = mysqli_fetch_assoc($result_mapel)) {
  $mapel_guru[] = $mapel; 
}

$kelas_guru = [];
$nilai_siswa = [];

if (isset($_GET['kode_mapel'])) {
  $kode_mapel_dipilih = mysqli_real_escape_string($conn, $_GET['kode_mapel']);

  // Mengambil kelas berdasarkan mata pelajaran yang dipilih
  $query_kelas = mysqli_prepare($conn, "SELECT DISTINCT jp.kode_kelas FROM jadwal_pelajaran jp WHERE jp.nip = ? AND jp.kode_mapel = ?");
  mysqli_stmt_bind_param($query_kelas, 'ss', $nip_guru, $kode_mapel_dipilih);
  mysqli_stmt_execute($query_kelas);
  $result_kelas = mysqli_stmt_get_result($query_kelas);

  while ($kelas = mysqli_fetch_assoc($result_kelas)) {
    $kelas_guru[] = $kelas['kode_kelas'];
  }

  if (isset($_GET['kelas'])) {
    $kelas_dipilih = mysqli_real_escape_string($conn, $_GET['kelas']);

    // Mengambil data siswa berdasarkan kelas yang dipilih
    $query_siswa = mysqli_prepare($conn, "SELECT nisn, nama FROM siswa WHERE kode_kelas = ? ORDER BY nama ASC");
    mysqli_stmt_bind_param($query_siswa, 's', $kelas_dipilih);
    mysqli_stmt_execute($query_siswa);
    $hasil_siswa = mysqli_stmt_get_result($query_siswa);

    while ($siswa = mysqli_fetch_assoc($hasil_siswa)) {
        // Cek apakah siswa sudah memiliki nilai
        $query_nilai = mysqli_prepare($conn, "SELECT ph1, ph2, uts, uas FROM nilai WHERE nisn = ? AND kode_mapel = ?");
        mysqli_stmt_bind_param($query_nilai, 'ss', $siswa['nisn'], $kode_mapel_dipilih);
        mysqli_stmt_execute($query_nilai);
        $hasil_nilai = mysqli_stmt_get_result($query_nilai);
        $nilai = mysqli_fetch_assoc($hasil_nilai);

        if (!$nilai) {
            $nilai = ['ph1' => 0, 'ph2' => 0, 'uts' => 0, 'uas' => 0];
        }

        $nilai_akhir = ($nilai['ph1'] * 0.3) + ($nilai['ph2'] * 0.3) + ($nilai['uts'] * 0.2) + ($nilai['uas'] * 0.2);
        $nilai_mutu = hitungMutu($nilai_akhir);

        $nilai_siswa[] = array_merge($siswa, $nilai, ['nilai_akhir' => $nilai_akhir, 'nilai_mutu' => $nilai_mutu]);
    }
}
}

function hitungMutu($nilai) {
    if ($nilai >= 80) return 'A';
    elseif ($nilai >= 70) return 'B';
    elseif ($nilai >= 55) return 'C';
    elseif ($nilai >= 40) return 'D';
    else return 'E';
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
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet"
    integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

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
  <!-- /sidebar -->

  <!-- Content -->
  <div class="kotak-isi">
    <div class="dropdown container mb-3">
      <button class="btn border-dark dropdown-toggle" style="background-color: #C6D8AF;" type="button"
        id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
        Pilih Mata Pelajaran
      </button>
      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
        <?php foreach ($mapel_guru as $mapel): ?>
          <li><a class="dropdown-item" href="inputnilai-guru.php?kode_mapel=<?php echo $mapel['kode_mapel']; ?>"> Kelas <?php echo $mapel['tingkat_kelas']; ?> - <?php echo $mapel['nama_mapel']; ?></a></li>
        <?php endforeach; ?>
      </ul>
    </div>
    
    <?php if (isset($kode_mapel_dipilih)): ?>
    <div class="dropdown container mb-3">
      <button class="btn border-dark dropdown-toggle" style="background-color: #C6D8AF;" type="button"
        id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
        Pilih Kelas
      </button>
      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
        <?php foreach ($kelas_guru as $kelas): ?>
            <li><a class="dropdown-item" href="inputnilai-guru.php?kode_mapel=<?php echo $kode_mapel_dipilih; ?>&kelas=<?php echo $kelas; ?>"><?php echo $kelas; ?></a></li>
        <?php endforeach; ?>
      </ul>
    </div>
    <?php endif; ?>

    <!-- table -->
    <div class="container">
      <table class="table table-striped table-fixed text-center">
        <caption>Data Siswa</caption>
        <thead style="background-color: #C6D8AF;">
          <tr>
            <th scope="col">Nama Siswa</th>
            <th scope="col">PH 1</th>
            <th scope="col">PH 2</th>
            <th scope="col">Nilai UTS</th>
            <th scope="col">Nilai UAS</th>
            <th scope="col">Nilai Akhir</th>
            <th scope="col">Nilai Mutu</th>
            <th scope="col">Aksi</th>
          </tr>
        </thead>
         <?php if (!empty($nilai_siswa)): ?>
        <tbody>
              <?php foreach ($nilai_siswa as $nilai): ?>
              <tr>
                <td><?php echo htmlspecialchars($nilai['nama']); ?></td>
                <td><?php echo htmlspecialchars($nilai['ph1']); ?></td>
                <td><?php echo htmlspecialchars($nilai['ph2']); ?></td>
                <td><?php echo htmlspecialchars($nilai['uts']); ?></td>
                <td><?php echo htmlspecialchars($nilai['uas']); ?></td>
                <td><?php echo htmlspecialchars($nilai['nilai_akhir']); ?></td>
                <td><?php echo htmlspecialchars($nilai['nilai_mutu']); ?></td>
                
                <!-- 
                <td><?php echo htmlspecialchars(hitungMutu(($nilai['ph1'] * 0.3) + ($nilai['ph2'] * 0.3) + ($nilai['uts'] * 0.2) + ($nilai['uas'] * 0.2))); ?></td> -->
                
                <td><a href="forminputnilai-guru.php?nisn=<?php echo $nilai['nisn']; ?>&kode_mapel=<?php echo $kode_mapel_dipilih; ?>"><img src="../assets/edit.svg" alt="edit-button"></a></td>
              </tr>
<?php endforeach; ?>
          </tbody>
      </table>
  </div>
<?php endif; ?>
    <!-- /table -->
  </div>
  <!-- /Content -->

  <!-- script -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
</body>

</html>