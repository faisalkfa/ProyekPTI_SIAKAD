<?php
session_start();
require('db.php');

// Cek session admin
if (!isset($_SESSION["admin"])) {
    header('Location: login.php');
    exit;
}

$admin = $_SESSION["admin"]["nip"];
$admin = mysqli_real_escape_string($conn, $admin);
$stmt = mysqli_prepare($conn, "SELECT * FROM admin WHERE nip = ?");
mysqli_stmt_bind_param($stmt, 's', $admin);
mysqli_stmt_execute($stmt);
$result = mysqli_stmt_get_result($stmt);
$data_admin = mysqli_fetch_array($result);

// Query untuk mengambil data kelas dari database
$kelasQuery = "SELECT * FROM kelas";
$kelasResult = mysqli_query($conn, $kelasQuery);

// Query untuk mengambil data mata pelajaran dari database
$mapelQuery = "SELECT * FROM mata_pelajaran order BY nama_mapel ASC";
$mapelResult = mysqli_query($conn, $mapelQuery);

// Query untuk mengambil data guru dari database
$guruQuery = "SELECT * FROM guru ORDER BY nama ASC";
$guruResult = mysqli_query($conn, $guruQuery);

// Cek apakah form telah disubmit untuk menghindari kehilangan 'id_jadwal'
if (!isset($_POST['submit'])) {
    if (isset($_GET['id_jadwal'])) {
        $id_jadwal = mysqli_real_escape_string($conn, $_GET['id_jadwal']);
    } else {
        echo "<script>alert('Id Jadwal tidak ditemukan!'); window.location='daftarjadwal-admin.php';</script>";
        exit;
    }

    $stmt_jadwal = mysqli_prepare($conn, "SELECT * FROM jadwal_pelajaran WHERE id_jadwal = ?");
    mysqli_stmt_bind_param($stmt_jadwal, 's', $id_jadwal);
    mysqli_stmt_execute($stmt_jadwal);
    $result_jadwal = mysqli_stmt_get_result($stmt_jadwal);
    $data_jadwal = mysqli_fetch_array($result_jadwal);

    if (!$data_jadwal) {
        echo "<script>alert('Data jadwal tidak ditemukan!'); window.location='daftarjadwal-admin.php';</script>";
        exit;
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
          <a href="daftarmapel-admin.php"
            ><img src="../assets/transcript.svg" alt="Daftar-Mapel" />Daftar Mapel</a
          >
        </li>
        <li>
          <a href="daftarjadwal-admin.php" class="active"
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
        <p>Edit Jadwal Pelajaran<p>
        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
        <input type="hidden" name="id_jadwal" value="<?php echo $data_jadwal['id_jadwal']; ?>">
    
        <div class="form-group">
<!-- Bagian untuk Kelas -->
<label for="kelas">Kelas:</label>
<select name="kelas" id="kelas">
    <?php while($kelas = mysqli_fetch_assoc($kelasResult)): ?>
        <option value="<?php echo $kelas['kode_kelas']; ?>" <?php if ($kelas['kode_kelas'] == $data_jadwal['kode_kelas']) echo 'selected'; ?>>
            <?php echo $kelas['kode_kelas']; ?>
        </option>
    <?php endwhile; ?>
</select>
<br><br>

<!-- Bagian untuk Mata Pelajaran -->
<label for="mapel">Mata Pelajaran:</label>
<select name="mapel" id="mapel">
    <?php while($mapel = mysqli_fetch_assoc($mapelResult)): ?>
        <option value="<?php echo $mapel['kode_mapel']; ?>" <?php if ($mapel['kode_mapel'] == $data_jadwal['kode_mapel']) echo 'selected'; ?>>
            Kelas <?php echo $mapel['tingkat_kelas'] . " - " . $mapel['nama_mapel']; ?>
        </option>
    <?php endwhile; ?>
</select>
<br><br>

<!-- Bagian untuk Guru -->
<label for="guru">Guru:</label>
<select name="guru" id="guru">
    <?php while($guru = mysqli_fetch_assoc($guruResult)): ?>
        <option value="<?php echo $guru['nip']; ?>" <?php if ($guru['nip'] == $data_jadwal['nip']) echo 'selected'; ?>>
            <?php echo $guru['nip'] . " - " . $guru['nama']; ?>
        </option>
    <?php endwhile; ?>
</select>
<br><br>

<!-- Bagian untuk Jam Mulai dan Jam Selesai -->
<label for="jam_mulai">Jam Mulai:</label>
<input type="text" id="jam_mulai" name="jam_mulai" value="<?php echo $data_jadwal['jam_mulai']; ?>" required><br><br>

<label for="jam_selesai">Jam Selesai:</label>
<input type="text" id="jam_selesai" name="jam_selesai" value="<?php echo $data_jadwal['jam_selesai']; ?>" required><br><br>
        
<label for="hari">Hari:</label>
<select name="hari" id="hari" required>
    <option value="Senin" <?php if ($data_jadwal['hari'] == 'Senin') echo 'selected'; ?>>Senin</option>
    <option value="Selasa" <?php if ($data_jadwal['hari'] == 'Selasa') echo 'selected'; ?>>Selasa</option>
    <option value="Rabu" <?php if ($data_jadwal['hari'] == 'Rabu') echo 'selected'; ?>>Rabu</option>
    <option value="Kamis" <?php if ($data_jadwal['hari'] == 'Kamis') echo 'selected'; ?>>Kamis</option>
    <option value="Jumat" <?php if ($data_jadwal['hari'] == 'Jumat') echo 'selected'; ?>>Jumat</option>
    <option value="Sabtu" <?php if ($data_jadwal['hari'] == 'Sabtu') echo 'selected'; ?>>Sabtu</option>
</select>
<br><br>

        <div class="edit-profile-buttons">
                <input type="submit" name="submit" value="Save" id="edit-button">
            </div>
        </form>
    </div>
    <div class="" style="position:absolute; z-index:999">
<?php
if (isset($_POST['submit'])) {
    // Ambil dan sanitasi input dari form
    $id_jadwal = mysqli_real_escape_string($conn, $_POST['id_jadwal']);
    $kode_kelas = mysqli_real_escape_string($conn, $_POST['kelas']);
    $kode_mapel = mysqli_real_escape_string($conn, $_POST['mapel']);
    $nip = mysqli_real_escape_string($conn, $_POST['guru']);
    $jam_mulai = mysqli_real_escape_string($conn, $_POST['jam_mulai']);
    $jam_selesai = mysqli_real_escape_string($conn, $_POST['jam_selesai']);
    $hari = mysqli_real_escape_string($conn, $_POST['hari']);
    
    // Prepared statement untuk update
    $stmt_update = mysqli_prepare($conn, "UPDATE jadwal_pelajaran SET kode_kelas = ?, kode_mapel = ?, nip = ?, jam_mulai = ?, jam_selesai = ?, hari = ? WHERE id_jadwal = ?");
    mysqli_stmt_bind_param($stmt_update, 'ssssssi', $kode_kelas, $kode_mapel, $nip, $jam_mulai, $jam_selesai, $hari, $id_jadwal);
    $update_result = mysqli_stmt_execute($stmt_update);
    
    if ($update_result) {
        echo "<script>alert('Data berhasil diupdate!'); window.location='daftarjadwal-admin.php';</script>";
    } else {
        echo "<script>alert('Update gagal: " . mysqli_error($conn) . "');</script>";
    }
}
?>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>