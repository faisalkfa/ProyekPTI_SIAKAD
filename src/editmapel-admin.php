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

// Query untuk mengambil data guru dari database
$guruQuery = "SELECT * FROM guru ORDER BY nama ASC";
$guruResult = mysqli_query($conn, $guruQuery);

// Cek apakah form telah disubmit untuk menghindari kehilangan 'id_mapel'
if (!isset($_POST['submit'])) {
    if (isset($_GET['id_mapel'])) {
        $id_mapel = mysqli_real_escape_string($conn, $_GET['id_mapel']);
    } else {
        echo "<script>alert('Id Mapel tidak ditemukan!'); window.location='daftarmapel-admin.php';</script>";
        exit;
    }

    $stmt_mapel = mysqli_prepare($conn, "SELECT * FROM mata_pelajaran WHERE id_mapel = ?");
    mysqli_stmt_bind_param($stmt_mapel, 's', $id_mapel);
    mysqli_stmt_execute($stmt_mapel);
    $result_mapel = mysqli_stmt_get_result($stmt_mapel);
    $data_mapel = mysqli_fetch_array($result_mapel);

    if (!$data_mapel) {
        echo "<script>alert('Data mapel tidak ditemukan!'); window.location='daftarmapel-admin.php';</script>";
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
        <p>Edit Mata Pelajaran<p>
        <form action="<?php echo $_SERVER['PHP_SELF']; ?>" method="POST">
        <input type="hidden" name="id_mapel" value="<?php echo $data_mapel['id_mapel']; ?>">
    
        <div class="form-group">
            
        <label for="tingkat_kelas">Tingkat Kelas:</label>
        <select name="tingkat_kelas" id="tingkat_kelas">
                            <option value="7" <?php if($data_mapel['tingkat_kelas'] == '7') echo 'selected'; ?>>Kelas 7</option>
                            <option value="8" <?php if($data_mapel['tingkat_kelas'] == '8') echo 'selected'; ?>>Kelas 8</option>
                            <option value="9" <?php if($data_mapel['tingkat_kelas'] == '9') echo 'selected'; ?>>Kelas 9</option>
                            </select>
        <br><br>
        
        <label for="kode_mapel">Kode Mapel:</label>
        <input type="text" id="kode_mapel" name="kode_mapel" value="<?php echo $data_mapel['kode_mapel'] ?>" /><br><br>

        <label for="nama_mapel">Nama Mapel:</label>
        <input type="text" id="nama_mapel" name="nama_mapel" value="<?php echo $data_mapel['nama_mapel'] ?>" /><br><br>

        <div class="edit-profile-buttons">
                <input type="submit" name="submit" value="Save" id="edit-button">
            </div>
        </form>
    </div>
    <div class="" style="position:absolute; z-index:999">
<?php
if (isset($_POST['submit'])) {
    // Ambil dan sanitasi input dari form
    $id_mapel = mysqli_real_escape_string($conn, $_POST['id_mapel']);
    $kode_mapel = mysqli_real_escape_string($conn, $_POST['kode_mapel']);
    $tingkat_kelas = mysqli_real_escape_string($conn, $_POST['tingkat_kelas']);
    $nama_mapel = mysqli_real_escape_string($conn, $_POST['nama_mapel']);
    
    // Prepared statement untuk update
    $stmt_update = mysqli_prepare($conn, "UPDATE mata_pelajaran SET kode_mapel = ?, tingkat_kelas = ?, nama_mapel = ? WHERE id_mapel = ?");
    mysqli_stmt_bind_param($stmt_update, 'ssss', $kode_mapel, $tingkat_kelas, $nama_mapel, $id_mapel);
    $update_result = mysqli_stmt_execute($stmt_update);
    
    if ($update_result) {
        echo "<script>alert('Data berhasil diupdate!'); window.location='daftarmapel-admin.php';</script>";
    } else {
        echo "<script>alert('Update gagal: " . mysqli_error($conn) . "');</script>";
    }
}
?>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>