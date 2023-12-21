<?php
session_start();

date_default_timezone_set('Asia/Jakarta'); // Menetapkan zona waktu

require('db.php');

require_once '../lib/fpdf.php';

if (!isset($_SESSION["siswa"])) {
    header("Location: login.php");
    exit;
}
$siswa = $_SESSION["siswa"]["nisn"];
$ambil_siswa = mysqli_query($conn, "SELECT * FROM siswa WHERE nisn = '$siswa'");
$data = mysqli_fetch_array($ambil_siswa);

// NISN siswa yang login
$nisn_siswa = $data['nisn'];

// Query untuk mengambil nilai
$query_nilai = "SELECT mp.nama_mapel, n.ph1, n.ph2, n.uts, n.uas
                FROM nilai n
                JOIN mata_pelajaran mp ON n.kode_mapel = mp.kode_mapel
                WHERE n.nisn = '$nisn_siswa'";
$hasil_nilai = mysqli_query($conn, $query_nilai);

$nilai_akhir = [];
while ($row = mysqli_fetch_assoc($hasil_nilai)) {
  $nilai_hitung = ($row['ph1'] * 0.3) + ($row['ph2'] * 0.3) + ($row['uts'] * 0.2) + ($row['uas'] * 0.2);
  $nilai_akhir[] = [
    'nama_mapel' => $row['nama_mapel'],
    'ph1' => $row['ph1'],
    'ph2' => $row['ph2'],
    'uts' => $row['uts'],
    'uas' => $row['uas'],
    'nilai' => round($nilai_hitung),
    'mutu' => hitungMutu($nilai_hitung) // Fungsi untuk menghitung nilai mutu
  ];
}

// Fungsi untuk menghitung nilai mutu
function hitungMutu($nilai)
{
  if ($nilai >= 80)
    return 'A';
  else if ($nilai >= 70)
    return 'B';
  else if ($nilai >= 55)
    return 'C';
  else if ($nilai >= 40)
    return 'D';
  else
    return 'E';
}

function generatePDF($nilai_akhir, $nama_siswa, $nisn_siswa, $kelas_siswa, $waktu_download) {
    $pdf = new FPDF();
    $pdf->AddPage();
    $pdf->SetMargins(10, 10, 10);

    $pdf->SetFont('Arial', 'B', 12);
    $pdf->Cell(0, 10, "Nama: $nama_siswa", 0, 1, 'L'); // Nama siswa
    $pdf->Cell(0, 10, "NISN: $nisn_siswa", 0, 1, 'L'); // NISN siswa
    $pdf->Cell(0, 10, "Kelas: $kelas_siswa", 0, 1, 'L'); // Kelas siswa
    $pdf->Ln(10);

    $pdf->SetFont('Arial', 'B', 16);
    $pdf->Cell(0, 10, "Rincian Nilai Akhir", 0, 1, 'C');
    $pdf->Ln(5);

    $pdf->SetFillColor(198, 216, 175); 
    $pdf->SetTextColor(0, 0, 0);
    $pdf->SetFont('Arial', 'B', 10); // Mengurangi ukuran font
    $headers = ['No', 'Mata Pelajaran', 'PH 1', 'PH 2', 'UTS', 'UAS', 'Nilai Akhir', 'Mutu'];
    $widths = [10, 80, 15, 15, 15, 15, 20, 20]; // Mengatur lebar kolom

    for ($i = 0; $i < count($headers); $i++) {
        $pdf->Cell($widths[$i], 10, $headers[$i], 1, 0, 'C', true);
    }
    $pdf->Ln();

    $pdf->SetFont('Arial', '', 10);
    $pdf->SetFillColor(255, 255, 255);
    $no = 1;
    foreach ($nilai_akhir as $nilai) {
        $pdf->Cell($widths[0], 10, $no++, 1, 0, 'C', true);
        $pdf->Cell($widths[1], 10, $nilai['nama_mapel'], 1, 0, 'C');
        $pdf->Cell($widths[2], 10, $nilai['ph1'], 1, 0, 'C');
        $pdf->Cell($widths[3], 10, $nilai['ph2'], 1, 0, 'C');
        $pdf->Cell($widths[4], 10, $nilai['uts'], 1, 0, 'C');
        $pdf->Cell($widths[5], 10, $nilai['uas'], 1, 0, 'C');
        $pdf->Cell($widths[6], 10, $nilai['nilai'], 1, 0, 'C');
        $pdf->Cell($widths[7], 10, $nilai['mutu'], 1, 0, 'C');
        $pdf->Ln();
    }

    $y_position = $pdf->GetY() + 10; // Jarak 10 dari akhir tabel
    $pdf->SetY($y_position);

    $pdf->SetFont('Arial', '', 12);
    $page_width = $pdf->GetPageWidth() - 10; // Lebar halaman dikurangi margin
    $waktu_download_width = $pdf->GetStringWidth($waktu_download) + 6; // Lebar teks waktu download + margin
    $x_position = $page_width - $waktu_download_width;
    $pdf->SetX($x_position);
    $pdf->Cell($waktu_download_width, 10, "Waktu Download: $waktu_download", 0, 0, 'R'); // Tampilkan waktu download

    $pdf->Output('D', 'NilaiAkhir_'.$nama_siswa.'.pdf');
}

if (isset($_GET['download']) && $_GET['download'] == 'pdf') {
    $nama_siswa = $data['nama']; // Nama siswa dari session
    $nisn_siswa = $data['nisn']; // NISN siswa dari data yang diambil
    $kelas_siswa = $data['kode_kelas']; // Asumsi bahwa 'kelas' adalah bagian dari $data
    $waktu_download = date("Y-m-d H:i:s"); // Format waktu saat ini
    generatePDF($nilai_akhir, $nama_siswa, $nisn_siswa, $kelas_siswa, $waktu_download);
    exit;
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
      <a href="profile-siswa.php"><iconify-icon icon="material-symbols:person" width="30"
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
        <a href="dashboard-siswa.php"><img src="../assets/monitor-dashboard.svg" alt="Dashboard" />Dashboard</a>
      </li>
      <li>
        <a href="jadwalpelajaran-siswa.php"><img src="../assets/schedule.svg" alt="Jadwal-Pelajaran" />Jadwal
          Pelajaran</a>
      </li>
      <li>
        <a href="lihatabsensi-siswa.php"><img src="../assets/person-rays.svg" alt="Absensi" />Absensi</a>
      </li>
      <li>
        <a href="lihatnilaiakhir-siswa.php" class="active"><img src="../assets/transcript.svg"
            alt="Lihat-Nilai-Akhir" />Lihat
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

  <!-- content -->
  <div class="kotak-isi">
      <div class="container">
      <p class="fw-bold">Rincian Nilai Akhir</p>
    <div class="d-flex justify-content-between align-items-center mb-3">
  <div></div> <!-- Div kosong untuk menyelaraskan tombol ke kanan -->
    <a href="lihatnilaiakhir-siswa.php?&download=pdf" class="btn btn-success">Download PDF</a>
    </div>
        <table class="table table-striped table-fixed text-center">
          <thead style="background-color: #C6D8AF;">
            <tr>
              <th scope="col">No.</th>
              <th scope="col">Mata Pelajaran</th>
              <th scope="col">PH 1</th>
              <th scope="col">PH 2</th>
              <th scope="col">Nilai UTS</th>
              <th scope="col">Nilai UAS</th>
              <th scope="col">Nilai Akhir</th>
              <th scope="col">Nilai Mutu</th>
            </tr>
          </thead>
          <tbody>
            <?php $no = 1; foreach ($nilai_akhir as $nilai): ?>
              <tr>
                <td scope="row"><?php echo $no++; ?></td>
                <td scope="row">
                  <?php echo htmlspecialchars($nilai['nama_mapel']); ?>
                </td>
                <td>
                  <?php echo htmlspecialchars($nilai['ph1']); ?>
                </td>
                <td>
                  <?php echo htmlspecialchars($nilai['ph2']); ?>
                </td>
                <td>
                  <?php echo htmlspecialchars($nilai['uts']); ?>
                </td>
                <td>
                  <?php echo htmlspecialchars($nilai['uas']); ?>
                </td>
                <td>
                  <?php echo htmlspecialchars($nilai['nilai']); ?>
                </td>
                <td>
                  <?php echo htmlspecialchars($nilai['mutu']); ?>
                </td>
              </tr>
            <?php endforeach; ?>
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