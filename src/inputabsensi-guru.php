<?php
session_start();

date_default_timezone_set('Asia/Jakarta'); // Menetapkan zona waktu

require('db.php');

require_once '../lib/fpdf.php';

// Cek login guru
if (!isset($_SESSION["guru"])) {
    header("Location: login.php");
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

//ambil data mapel, kelas, dan pertemuan yang dipilih
$mapel_dipilih = $_GET['kode_mapel'] ?? '';
$kelas_dipilih = $_GET['kelas'] ?? ''; 
$pertemuan_ke = $_GET['pertemuan_ke'] ?? '';

$nama_mapel = '';
if ($mapel_dipilih) {
    $query_nama_mapel = mysqli_prepare($conn, "SELECT nama_mapel FROM mata_pelajaran WHERE kode_mapel = ?");
    mysqli_stmt_bind_param($query_nama_mapel, 's', $mapel_dipilih);
    mysqli_stmt_execute($query_nama_mapel);
    $result_nama_mapel = mysqli_stmt_get_result($query_nama_mapel);
    if ($row_nama_mapel = mysqli_fetch_assoc($result_nama_mapel)) {
        $nama_mapel = $row_nama_mapel['nama_mapel'];
    }
}

//ambil daftar kelas sesuai mapel yang dipilih
if($mapel_dipilih) {
  $query_kelas = mysqli_prepare($conn, "SELECT DISTINCT jp.kode_kelas FROM jadwal_pelajaran jp WHERE jp.kode_mapel = ? AND jp.nip = ?");
  mysqli_stmt_bind_param($query_kelas, 'ss', $mapel_dipilih, $nip_guru);
  mysqli_stmt_execute($query_kelas);
  $kelas_result = mysqli_stmt_get_result($query_kelas);
  
  $kelas_guru = [];
  while($kelas = mysqli_fetch_assoc($kelas_result)) {
     $kelas_guru[] = $kelas['kode_kelas'];
  } 
}

$absensi_exist = false;

// Cek apakah absensi untuk kelas dan pertemuan ini sudah ada
if ($kelas_dipilih && $pertemuan_ke && $mapel_dipilih) {
    // Mendapatkan id_jadwal
    $query_jadwal = mysqli_prepare($conn, "SELECT id_jadwal FROM jadwal_pelajaran WHERE nip = ? AND kode_kelas = ? AND kode_mapel = ? LIMIT 1");
    mysqli_stmt_bind_param($query_jadwal, 'sss', $guru, $kelas_dipilih, $mapel_dipilih);
    mysqli_stmt_execute($query_jadwal);
    $result_jadwal = mysqli_stmt_get_result($query_jadwal);
    $data_jadwal = mysqli_fetch_assoc($result_jadwal);

    if ($data_jadwal) {
        $id_jadwal = $data_jadwal['id_jadwal'];
        
        // Cek apakah absensi sudah ada
        $query_absensi_exist = mysqli_prepare($conn, "SELECT a.*, s.nama FROM absensi a JOIN siswa s ON a.nisn = s.nisn WHERE a.id_jadwal = ? AND a.pertemuan_ke = ? ORDER BY s.nama ASC");
        mysqli_stmt_bind_param($query_absensi_exist, 'ii', $id_jadwal, $pertemuan_ke);
        mysqli_stmt_execute($query_absensi_exist);
        $hasil_absensi_exist = mysqli_stmt_get_result($query_absensi_exist);
        $absensi_exist = mysqli_num_rows($hasil_absensi_exist) > 0;

        if ($absensi_exist) {
            // Mengumpulkan data absensi dalam sebuah array
            $daftar_absensi = [];
            while ($row = mysqli_fetch_assoc($hasil_absensi_exist)) {
                $daftar_absensi[] = $row;
            }
        } else {
            // Mengumpulkan data siswa dalam sebuah array
            $query_siswa = mysqli_prepare($conn, "SELECT s.nama, s.nisn FROM siswa s WHERE s.kode_kelas = ? ORDER BY nama ASC");
            mysqli_stmt_bind_param($query_siswa, 's', $kelas_dipilih);
            mysqli_stmt_execute($query_siswa);
            $hasil_siswa = mysqli_stmt_get_result($query_siswa);
            $daftar_siswa = mysqli_fetch_all($hasil_siswa, MYSQLI_ASSOC);
        }
    }
}

// Menangani penyimpanan data absensi
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $mapel_dipilih = mysqli_real_escape_string($conn, $_POST['kode_mapel']);
    $kelas_dipilih = mysqli_real_escape_string($conn, $_POST['kelas']);
    $pertemuan_ke = mysqli_real_escape_string($conn, $_POST['pertemuan_ke']);

    // Mendapatkan id_jadwal
    $query_jadwal = "SELECT id_jadwal FROM jadwal_pelajaran WHERE nip = '$guru' AND kode_kelas = '$kelas_dipilih' AND kode_mapel = '$mapel_dipilih' LIMIT 1";
    $hasil_jadwal = mysqli_query($conn, $query_jadwal);
    $data_jadwal = mysqli_fetch_assoc($hasil_jadwal);
    $id_jadwal = $data_jadwal['id_jadwal'];

    foreach ($_POST['absensi'] as $nisn => $keterangan) {
        $nisn = mysqli_real_escape_string($conn, $nisn);
        $keterangan = mysqli_real_escape_string($conn, $keterangan);

        // Simpan data absensi ke database
        $query_simpan = "INSERT INTO absensi (id_jadwal, pertemuan_ke, kode_mapel, nisn, keterangan, tanggal, waktu_input)
                 VALUES ('$id_jadwal', '$pertemuan_ke', '$mapel_dipilih', '$nisn', '$keterangan', CURDATE(), NOW())";
        mysqli_query($conn, $query_simpan);
    }
    echo "<script>alert('Absensi berhasil disimpan!'); location='inputabsensi-guru.php?kode_mapel=$mapel_dipilih&kelas=$kelas_dipilih&pertemuan_ke=$pertemuan_ke';</script>";
    exit;
}

function generateAbsensiPDF($daftar_absensi, $nama_mapel, $kelas, $pertemuan_ke, $nama_guru, $waktu_download) {
    $pdf = new FPDF();
    $pdf->AddPage();
    $pdf->SetMargins(10, 10, 10);

    $pdf->SetFont('Arial', 'B', 12);
    $pdf->Cell(0, 10, "Guru: $nama_guru", 0, 1, 'L');
    $pdf->Ln(10);

    $pdf->SetFont('Arial', 'B', 16);
    $pdf->Cell(0, 10, "Daftar Absensi Siswa", 0, 1, 'C');
    $pdf->Ln(1);
    
    $pdf->SetFont('Arial', 'B', 16);
    $pdf->Cell(0, 10, "$nama_mapel - Kelas $kelas - Pertemuan Ke $pertemuan_ke", 0, 1, 'C');
    $pdf->Ln(5);

    $pdf->SetFillColor(198, 216, 175);
    $pdf->SetFont('Arial', 'B', 10);
    $headers = ['No', 'Nama Siswa', 'Keterangan', 'Waktu Absensi'];
    $widths = [10, 80, 50, 50];

    for ($i = 0; $i < count($headers); $i++) {
        $pdf->Cell($widths[$i], 10, $headers[$i], 1, 0, 'C', true);
    }
    $pdf->Ln();

    $pdf->SetFont('Arial', '', 10);
    $pdf->SetFillColor(255, 255, 255);
    $no = 1;
    foreach ($daftar_absensi as $absensi) {
        $pdf->Cell($widths[0], 10, $no++, 1, 0, 'C', true);
        $pdf->Cell($widths[1], 10, $absensi['nama'], 1, 0, 'C');
        $pdf->Cell($widths[2], 10, $absensi['keterangan'], 1, 0, 'C');
        $pdf->Cell($widths[3], 10, $absensi['waktu_input'], 1, 0, 'C');
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
    
    $namaMapelFormatted = str_replace(' ', '_', preg_replace('/[^A-Za-z0-9 ]/', '', $nama_mapel));
    $namaFile = "Absensi_" . $kelas . "_". $namaMapelFormatted . "_Pertemuan_Ke_" . $pertemuan_ke . ".pdf";

    $pdf->Output('D', $namaFile);
}

if (isset($_GET['download']) && $_GET['download'] == 'pdf' && $absensi_exist) {
    $nama_guru = $data_guru['nama']; // Nama guru
    $waktu_download = date("Y-m-d H:i:s"); // Format waktu saat ini
    generateAbsensiPDF($daftar_absensi, $nama_mapel, $kelas_dipilih, $pertemuan_ke, $nama_guru, $waktu_download);
    exit;
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
    
      <div class="btn-group mb-3">
      <div class="dropdown container mb-3">
      <button class="btn border-dark dropdown-toggle" style="background-color: #C6D8AF;" type="button"
        id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
        Pilih Mata Pelajaran
      </button>
      <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
        <?php foreach ($mapel_guru as $mapel): ?>
          <li><a class="dropdown-item" href="inputabsensi-guru.php?kode_mapel=<?php echo $mapel['kode_mapel']?>"> Kelas <?php echo $mapel['tingkat_kelas']; ?> - <?php echo $mapel['nama_mapel']; ?></a></li>
        <?php endforeach; ?>
      </ul>
    </div>
    
            <!-- button pilih kelas -->
            <?php if ($mapel_dipilih): ?>
            <div class="dropdown container mb-3">
                <button class="btn border-dark dropdown-toggle" style="background-color: #C6D8AF;" type="button"
                    id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
                    Pilih Kelas
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton1">
    <?php foreach ($kelas_guru as $kode_kelas): ?>
        <li>
            <a class="dropdown-item" href="inputabsensi-guru.php?kode_mapel=<?php echo $mapel_dipilih; ?>&kelas=<?php echo $kode_kelas; ?>">
                <?php echo $kode_kelas; ?>
            </a>
        </li>
    <?php endforeach; ?>
</ul>
            </div>
            <?php endif; ?>
            <!-- /button pilih kelas -->

            <!-- button pertemuan -->
            <?php if ($kelas_dipilih): ?>
            <div class="dropdown container ml-3 mb-3">
                <button class="btn border-dark dropdown-toggle" style="background-color: #C6D8AF;" type="button"
                    id="dropdownMenuButton2" data-bs-toggle="dropdown" aria-expanded="false">
                    Pertemuan
                </button>
                <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton2">
    <?php for ($i = 1; $i <= 10; $i++): ?>
        <li>
            <a class="dropdown-item" href="inputabsensi-guru.php?kode_mapel=<?php echo $mapel_dipilih; ?>&kelas=<?php echo $kelas_dipilih; ?>&pertemuan_ke=<?php echo $i; ?>">
                Pertemuan <?php echo $i; ?>
            </a>
        </li>
    <?php endfor; ?>
</ul>
            </div>
            <?php endif; ?>
            <!-- /button pertemuan -->
        </div>
        <!-- button group -->

        <!-- table -->
<?php if ($absensi_exist): ?>
    <div class="container">
    <div class="d-flex justify-content-between align-items-center mb-3">
  <div></div> <!-- Div kosong untuk menyelaraskan tombol ke kanan -->
    <a href="inputabsensi-guru.php?kode_mapel=<?php echo $mapel_dipilih; ?>&kelas=<?php echo $kelas_dipilih; ?>&pertemuan_ke=<?php echo $pertemuan_ke; ?>&download=pdf" class="btn btn-success">Download PDF</a>
    </div>
      <table class="table table-striped table-fixed text-center">
          <p style="text-align: center; font-weight: bold;">Absensi sudah dilakukan untuk pertemuan ini</p>
          <thead style="background-color: #C6D8AF;">
    <tr>
        <th scope="col">No.</th>
        <th scope="col">Nama Siswa</th>
        <th scope="col">Keterangan</th>
        <th scope="col">Waktu Absensi</th>
        <th scope="col">Edit</th> <!-- Kolom baru untuk edit -->
    </tr>
</thead>
        <tbody>
            <?php $no = 1; foreach ($daftar_absensi as $data): ?>
    <tr>
        <td><?php echo $no++; ?></td>
        <td><?php echo htmlspecialchars($data['nama']); ?></td>
        <td><?php echo htmlspecialchars($data['keterangan']); ?></td>
        <td><?php echo htmlspecialchars($data['waktu_input']); ?></td>
        <td>
            <a href="editabsensi.php?id=<?php echo $data['id_absensi']; ?>" class="btn btn-primary btn-sm">
            <iconify-icon icon="bxs:edit"></iconify-icon>
        </a>
        </td>
    </tr>
<?php endforeach; ?>
        </tbody>
    </table>
</div>
<?php elseif ($mapel_dipilih && $kelas_dipilih && $pertemuan_ke): ?>
    <form action="inputabsensi-guru.php" method="post">
        <input type="hidden" name="kode_mapel" value="<?php echo $mapel_dipilih; ?>">
        <input type="hidden" name="kelas" value="<?php echo $kelas_dipilih; ?>">
        <input type="hidden" name="pertemuan_ke" value="<?php echo $pertemuan_ke; ?>">
        <div class="container">
            <table class="table table-striped table-fixed text-center">
                <thead style="background-color: #C6D8AF;">
                    <tr>
                        <th scope="col">No.</th>
                        <th scope="col">Nama Siswa</th>
                        <th scope="col">Keterangan</th>
                    </tr>
                </thead>
                <tbody>
                    <?php $no = 1; foreach ($daftar_siswa as $siswa): ?>
                        <tr>
                            <td><?php echo $no++; ?></td>
                            <td><?php echo htmlspecialchars($siswa['nama']); ?></td>
                            <td>
                                <select name="absensi[<?php echo $siswa['nisn']; ?>]" class="form-select">
                                    <option value="Hadir">Hadir</option>
                                    <option value="Izin">Izin</option>
                                    <option value="Sakit">Sakit</option>
                                    <option value="Alpa">Alpa</option>
                                </select>
                            </td>
                        </tr>
                    <?php endforeach; ?>
                </tbody>
            </table>
            <input type="submit" name="submit" value="Simpan Absensi" class="btn btn-success">
        </div>
    </form>
<?php endif; ?>
        <!-- /table -->
        
    </div>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
        crossorigin="anonymous"></script>
</body>

</html>