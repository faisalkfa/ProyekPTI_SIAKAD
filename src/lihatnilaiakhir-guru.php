<?php
session_start();

date_default_timezone_set('Asia/Jakarta'); // Menetapkan zona waktu

require('db.php');

require_once '../lib/fpdf.php';

if (!isset($_SESSION["guru"])) {
    header("Location: login.php");
    exit;
}

$guru = $_SESSION["guru"]["nip"];

$stmt = $conn->prepare("SELECT * FROM guru WHERE nip = ?");
$stmt->bind_param("s", $guru);
$stmt->execute();
$hasil = $stmt->get_result();
$data = $hasil->fetch_assoc();

if (!$hasil) {
    die("Query gagal: " . mysqli_error($conn));
}

// Query untuk mengambil daftar mata pelajaran yang diampu oleh guru
$query_mapel = "SELECT DISTINCT mp.kode_mapel, mp.nama_mapel, mp.tingkat_kelas
                FROM mata_pelajaran mp
                JOIN jadwal_pelajaran jp ON mp.kode_mapel = jp.kode_mapel
                WHERE jp.nip = '$guru'";
$hasil_mapel = mysqli_query($conn, $query_mapel);

$mapel_guru = [];
while ($mapel = mysqli_fetch_assoc($hasil_mapel)) {
    $mapel_guru[] = $mapel;
}

$kelas_guru = [];
if (isset($_GET['kode_mapel'])) {
    $kode_mapel_dipilih = isset($_GET['kode_mapel']) ? mysqli_real_escape_string($conn, $_GET['kode_mapel']) : null;
    
    // tambahan: ambil nama mata pelajaran
    $query_nama_mapel = "SELECT nama_mapel FROM mata_pelajaran WHERE kode_mapel = '$kode_mapel_dipilih'";
    $hasil_nama_mapel = mysqli_query($conn, $query_nama_mapel);
    if ($row = mysqli_fetch_assoc($hasil_nama_mapel)) {
        $nama_mapel = $row['nama_mapel'];
    }

    // Query untuk mengambil daftar kelas berdasarkan mata pelajaran yang dipilih
    $query_kelas = "SELECT DISTINCT k.kode_kelas
                    FROM kelas k
                    JOIN jadwal_pelajaran jp ON k.kode_kelas = jp.kode_kelas
                    WHERE jp.kode_mapel = '$kode_mapel_dipilih'
                    AND jp.nip = '$guru'";
    $hasil_kelas = mysqli_query($conn, $query_kelas);

    while ($kelas = mysqli_fetch_assoc($hasil_kelas)) {
        $kelas_guru[] = $kelas['kode_kelas'];
    }
}

$nilai_siswa = [];
if (isset($_GET['kelas'])) {
    $kode_kelas_dipilih = $_GET['kelas'];

    // Query yang dimodifikasi untuk mengambil nilai siswa dari kelas yang dipilih
    // dan hanya untuk mata pelajaran yang diampu oleh guru tersebut
    $query_nilai = "SELECT s.nama, n.nisn, n.ph1, n.ph2, n.uts, n.uas
                FROM siswa s
                JOIN nilai n ON s.nisn = n.nisn
                JOIN jadwal_pelajaran jp ON n.kode_mapel = jp.kode_mapel AND s.kode_kelas = jp.kode_kelas
                WHERE s.kode_kelas = '$kode_kelas_dipilih'
                AND jp.kode_mapel = '$kode_mapel_dipilih'
                AND jp.nip = '$guru' ORDER BY s.nama ASC";
    $hasil_nilai = mysqli_query($conn, $query_nilai);

    while ($row = mysqli_fetch_assoc($hasil_nilai)) {
        $nilai_akhir = ($row['ph1'] * 0.3) + ($row['ph2'] * 0.3) + ($row['uts'] * 0.2) + ($row['uas'] * 0.2);
        $nilai_akhir = round($nilai_akhir); // Pembulatan nilai akhir
        $nilai_mutu = hitungMutu($nilai_akhir);
        $nilai_siswa[] = array_merge($row, ['nilai_akhir' => $nilai_akhir, 'nilai_mutu' => $nilai_mutu]);
    }
}

function hitungMutu($nilai) {
    if ($nilai >= 80) return 'A';
    elseif ($nilai >= 70) return 'B';
    elseif ($nilai >= 55) return 'C';
    elseif ($nilai >= 40) return 'D';
    else return 'E';
}

function generatePDF($nilai_siswa, $nama_mapel, $kelas, $nama_guru, $waktu_download) {
    $pdf = new FPDF();
    $pdf->AddPage();
    $pdf->SetMargins(10, 10, 10);

    $pdf->SetFont('Arial', 'B', 12);
    $pdf->Cell(0, 10, "Guru: $nama_guru", 0, 1, 'L'); // Nama guru
    $pdf->Ln(10);

    $pdf->SetFont('Arial', 'B', 16);
    $pdf->Cell(0, 10, "Daftar Nilai Akhir", 0, 1, 'C');
    $pdf->Ln(1);
    
    $pdf->SetFont('Arial', 'B', 16);
    $pdf->Cell(0, 10, "$nama_mapel - Kelas $kelas", 0, 1, 'C');
    $pdf->Ln(5);

    $pdf->SetFillColor(198, 216, 175); 
    $pdf->SetTextColor(0, 0, 0);
    $pdf->SetFont('Arial', 'B', 10); // Mengurangi ukuran font
    $headers = ['No', 'Nama Siswa', 'PH 1', 'PH 2', 'UTS', 'UAS', 'Nilai Akhir', 'Mutu'];
    $widths = [10, 80, 15, 15, 15, 15, 20, 20]; // Mengatur lebar kolom

    for ($i = 0; $i < count($headers); $i++) {
        $pdf->Cell($widths[$i], 10, $headers[$i], 1, 0, 'C', true);
    }
    $pdf->Ln();

    $pdf->SetFont('Arial', '', 10);
    $pdf->SetFillColor(255, 255, 255);
    $no = 1;
    foreach ($nilai_siswa as $nilai) {
        $pdf->Cell($widths[0], 10, $no++, 1, 0, 'C', true); // Nomor rata tengah
        $pdf->Cell($widths[1], 10, substr($nilai['nama'], 0, 50), 1, 0, 'C'); // Nama rata kiri
        $pdf->Cell($widths[2], 10, $nilai['ph1'], 1, 0, 'C'); // PH1 rata tengah
        $pdf->Cell($widths[3], 10, $nilai['ph2'], 1, 0, 'C'); // PH2 rata tengah
        $pdf->Cell($widths[4], 10, $nilai['uts'], 1, 0, 'C'); // UTS rata tengah
        $pdf->Cell($widths[5], 10, $nilai['uas'], 1, 0, 'C'); // UAS rata tengah
        $pdf->Cell($widths[6], 10, $nilai['nilai_akhir'], 1, 0, 'C'); // Nilai Akhir rata tengah
        $pdf->Cell($widths[7], 10, $nilai['nilai_mutu'], 1, 0, 'C'); // Mutu rata tengah
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

    // Mengganti spasi dengan underscore (_) dan menghapus karakter yang tidak diperlukan
    $namaMapelFormatted = str_replace(' ', '_', preg_replace('/[^A-Za-z0-9 ]/', '', $nama_mapel));
    $namaFile = "NilaiAkhir_" . $namaMapelFormatted . "_" . $kelas . ".pdf";

    $pdf->Output('D', $namaFile);
}

if (isset($_GET['download']) && $_GET['download'] == 'pdf') {
    $nama_guru = $data['nama']; // Misalnya, nama guru diambil dari session
    $waktu_download = date("Y-m-d H:i:s"); // Format waktu saat ini
    generatePDF($nilai_siswa, $nama_mapel, $_GET['kelas'], $nama_guru, $waktu_download);
    exit;
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
      <a href="profile-guru.php"><iconify-icon icon="material-symbols:person" width="30" class="align-middle p-3"></iconify-icon><?php echo $data['nama'] ?></a>
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
        <a href="inputnilai-guru.php"><img src="../assets/transcript.svg" alt="Input-Nilai" />Input
          Nilai</a>
      </li>
      <li>
        <a href="lihatnilaiakhir-guru.php" class="active"><img src="../assets/transcript.svg"
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
    <!-- Dropdown untuk Memilih Mata Pelajaran -->
    <div class="dropdown container mb-3">
        <button class="btn border-dark dropdown-toggle" style="background-color: #C6D8AF;" type="button"
            id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
            Pilih Mata Pelajaran
        </button>
        <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
            <?php foreach ($mapel_guru as $mapel): ?>
                <li><a class="dropdown-item" href="lihatnilaiakhir-guru.php?kode_mapel=<?php echo $mapel['kode_mapel']; ?>"> Kelas <?php echo $mapel['tingkat_kelas']; ?> - <?php echo $mapel['nama_mapel']; ?></a></li>
            <?php endforeach; ?>
        </ul>
    </div>
    
    <?php if (isset($kode_mapel_dipilih)): ?>
        <!-- Dropdown untuk Memilih Kelas, hanya muncul jika mata pelajaran telah dipilih -->
        <div class="dropdown container mb-3">
            <button class="btn border-dark dropdown-toggle" style="background-color: #C6D8AF;" type="button"
                id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
                Pilih Kelas
            </button>
            <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
                <?php foreach ($kelas_guru as $kelas): ?>
                    <li><a class="dropdown-item" href="lihatnilaiakhir-guru.php?kode_mapel=<?php echo $kode_mapel_dipilih; ?>&kelas=<?php echo $kelas; ?>"><?php echo $kelas; ?></a></li>
                <?php endforeach; ?>
            </ul>
        </div>
    <?php endif; ?>

    <!-- table -->
    <div class="container">
     <div class="d-flex justify-content-between align-items-center mb-3">
  <div></div> <!-- Div kosong untuk menyelaraskan tombol ke kanan -->
  <?php if (isset($kode_kelas_dipilih) && isset($kode_mapel_dipilih)): ?>
    <a href="lihatnilaiakhir-guru.php?kode_mapel=<?php echo $kode_mapel_dipilih; ?>&kelas=<?php echo $kode_kelas_dipilih; ?>&download=pdf" class="btn btn-success">Download PDF</a>
  <?php endif; ?>
    </div>
      <table class="table table-striped table-fixed text-center">
        <caption>Data Siswa</caption>
        <thead style="background-color: #C6D8AF;">
            <tr>
            <th scope="col">No.</th> <!-- Kolom nomor -->
            <th scope="col">Nama Siswa</th>
            <th scope="col">PH 1</th>
            <th scope="col">PH 2</th>
            <th scope="col">Nilai UTS</th>
            <th scope="col">Nilai UAS</th>
            <th scope="col">Nilai Akhir</th>
            <th scope="col">Nilai Mutu</th>
          </tr>
        </thead>
        <tbody>
              <?php $no = 1; foreach ($nilai_siswa as $nilai): ?>
              <tr>
                      <td scope="row"><?php echo $no++; ?></td> <!-- Menampilkan nomor -->
                      <td scope="row"><?php echo htmlspecialchars($nilai['nama']); ?></td>
                      <td><?php echo htmlspecialchars($nilai['ph1']); ?></td>
                      <td><?php echo htmlspecialchars($nilai['ph2']); ?></td>
                      <td><?php echo htmlspecialchars($nilai['uts']); ?></td>
                      <td><?php echo htmlspecialchars($nilai['uas']); ?></td>
                      <td><?php echo htmlspecialchars($nilai['nilai_akhir']); ?></td>
                      <td><?php echo htmlspecialchars($nilai['nilai_mutu']); ?></td>
                  </tr>
              <?php endforeach; ?>
          </tbody>
      </table>
  </div>
    <!-- /table -->
  </div>
  <!-- /Content -->

  <!-- script -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
    crossorigin="anonymous"></script>
</body>

</html>