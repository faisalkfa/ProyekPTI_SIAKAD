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

// Mengambil data kelas dari database
$query_kelas = "SELECT * FROM kelas";
$hasil_kelas = mysqli_query($conn, $query_kelas);
$kelas = mysqli_fetch_all($hasil_kelas, MYSQLI_ASSOC);
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

    <div class="form-edit-profil">
        <form action="" method="POST" enctype="multipart/form-data">
            <div class="profile-picture">
                <img id="profile-image" src="../assets/default-profile-picture.jpg" alt="Profile Picture" />
                <div class="form-group">
                    <label>Upload Foto:</label>
                    <input type="file" name="foto" />
                </div>
            </div>

            <div class="data-diri-profile-edit" style="border: none;">
                <div class="column">
                    <div class="form-group">
                        <label for="nama">Nama Lengkap:</label>
                        <input type="text" name="nama" id="nama" maxlength="50" />
                    </div>
                    <div class="form-group">
                        <label for="nisn">NISN :</label>
                        <input type="text" name="nisn" />
                    </div>
                    <div class="form-group">
                        <label for="passsword">Password :</label>
                        <input type="text" name="password" />
                    </div>
                    <div class="form-group">
    <label for="kelas">Kelas :</label>
    <select name="kode_kelas" id="kelas" class="form-select">
        <?php foreach ($kelas as $kelasItem): ?>
            <option value="<?php echo htmlspecialchars($kelasItem['kode_kelas']); ?>">
                <?php echo htmlspecialchars($kelasItem['nama_kelas']); ?>
            </option>
        <?php endforeach; ?>
    </select>
</div>
                    <div class="form-group">
                        <label for="tempat-lahir">Tempat Lahir :</label>
                        <input type="text" name="tempat_lahir" id="tempat_lahir" maxlength="30" />
                    </div>
                    <div class="form-group">
                        <label for="angkatan">Angkatan :</label>
                        <input type="text" name="angkatan" id="angkatan" maxlength="4" />
                    </div>
                    <div class="form-group">
                        <label for="no-hp">No HP :</label>
                        <input type="text" name="no_hp" id="no_hp" maxlength="15" />
                    </div>

                </div>
                <div class="column">
                    <div class="form-group">
                        <label for="email">Email :</label>
                        <input type="text" name="email" id="email" maxlength="50" />
                    </div>
                    <div class="form-group">
                        <label for="tanggal-lahir">Tanggal Lahir (format: YYYY-MM-DD):</label>
                        <input type="text" name="tanggal_lahir" id="tanggal-lahir" placeholder="YYYY-MM-DD" />
                    </div>
                    <div class="form-group">
                    <label for="jenis-kelamin">Jenis Kelamin :</label>
                    <select name="jenis_kelamin" id="jenis-kelamin">
                            <option value="Laki-Laki">Laki-Laki</option>
                            <option value="Perempuan">Perempuan</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="agama">Agama :</label>
                        <select name="agama" id="agama">
                            <option value="Islam">Islam</option>
                            <option value="Kristen">Kristen</option>
                            <option value="Katholik">Katholik</option>
                            <option value="Hindu">Hindu</option>
                            <option value="Budha">Budha</option>
                            <option value="Kong Hu Chu">Kong Hu Chu</option>
                        </select>
                    </div>
                     <div class="form-group">
                        <label for="nama-wali">Nama Wali :</label>
                        <input type="text" name="nama_wali" id="nama_wali" maxlength="50" />
                    </div>
                    <div class="form-group">
                        <label for="no-wali">Nomor Telepon Wali :</label>
                        <input type="text" name="no_telepon_wali" id="no_telepon_wali" maxlength="15" />
                    </div>
                    <div class="form-group" style="border-bottom: none">
                        <label for="alamat">Alamat</label>
                        <input type="text" name="alamat" id="alamat" maxlength="100" />
                    </div>
                </div>
            </div>

            <div class="edit-profile-buttons">
                <input type="submit" name="submit" value="Save" id="edit-button">
            </div>
        </form>
    </div>
    <div class="" style="position:absolute; z-index:999">
<?php
if (isset($_POST['submit'])) {
    // Terima data dari form
    $nisn = mysqli_real_escape_string($conn, $_POST['nisn']);
    $nama = mysqli_real_escape_string($conn, $_POST['nama']);
    $kode_kelas = mysqli_real_escape_string($conn, $_POST['kode_kelas']);
    $angkatan = mysqli_real_escape_string($conn, $_POST['angkatan']);
    $tempat_lahir = mysqli_real_escape_string($conn, $_POST['tempat_lahir']);
    $tanggal_lahir = mysqli_real_escape_string($conn, $_POST['tanggal_lahir']);
    $jenis_kelamin = mysqli_real_escape_string($conn, $_POST['jenis_kelamin']);
    $agama = mysqli_real_escape_string($conn, $_POST['agama']);
    $no_hp = mysqli_real_escape_string($conn, $_POST['no_hp']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $nama_wali = mysqli_real_escape_string($conn, $_POST['nama_wali']);
    $no_telepon_wali = mysqli_real_escape_string($conn, $_POST['no_telepon_wali']);
    $alamat = mysqli_real_escape_string($conn, $_POST['alamat']);
    $rawPassword = $_POST['password'];
    $password = password_hash($rawPassword, PASSWORD_DEFAULT);
    
    // NIP admin yang sedang login
    $nip_admin = $admin;

    // Penanganan upload foto
    $filename = 'default-profile-picture.jpg'; // Nama file default jika tidak ada upload
    if ($_FILES['foto']['error'] === UPLOAD_ERR_OK) {
        $filename = $_FILES['foto']['name'];
        $file_tmp = $_FILES['foto']['tmp_name'];
        $file_type = $_FILES['foto']['type'];
        $file_size = $_FILES['foto']['size'];

        $allowed_types = ['image/jpeg', 'image/png', 'image/jpg'];
        if (in_array($file_type, $allowed_types) && $file_size <= 1000000) {
            $destination = "image/" . $filename;
            move_uploaded_file($file_tmp, $destination);
        } else {
            echo "<script>alert('File tidak valid atau terlalu besar.');</script>";
            return;
        }
    }
    
    // Validasi format tanggal lahir
    if (!preg_match("/^\d{4}-\d{2}-\d{2}$/", $tanggal_lahir)) {
        echo "<script>alert('Format tanggal lahir tidak valid. Gunakan format YYYY-MM-DD.');</script>";
        return; // Menghentikan eksekusi lebih lanjut
    }
    
    // Pengecekan NISN di database
    $checkNisnQuery = "SELECT nisn FROM siswa WHERE nisn = ?";
    $stmt = mysqli_prepare($conn, $checkNisnQuery);
    mysqli_stmt_bind_param($stmt, 's', $nisn);
    mysqli_stmt_execute($stmt);
    $result = mysqli_stmt_get_result($stmt);

    if (mysqli_num_rows($result) > 0) {
        // Jika NISN sudah ada di database
        echo "<script>alert('Gagal: NISN sudah terdaftar di sistem');</script>";
    } else {
        // Jika NISN belum ada, lanjutkan dengan penambahan data siswa
         $query = "INSERT INTO siswa (nisn, nama, kode_kelas, tempat_lahir, angkatan, tanggal_lahir, jenis_kelamin, agama, no_hp, email, nama_wali, no_telepon_wali, alamat, password, foto, nip_admin) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
         $stmt = mysqli_prepare($conn, $query);
         mysqli_stmt_bind_param($stmt, 'ssssssssssssssss', $nisn, $nama, $kode_kelas, $tempat_lahir, $angkatan, $tanggal_lahir, $jenis_kelamin, $agama, $no_hp, $email, $nama_wali, $no_telepon_wali, $alamat, $password, $filename, $nip_admin);
        
        if (mysqli_stmt_execute($stmt)) {
            echo "<script>alert('Data berhasil ditambahkan!'); window.location='daftarsiswa-admin.php';</script>";
        } else {
            echo "<script>alert('Gagal: " . mysqli_error($conn) . "');</script>";
        }
    }
}
?>
    </div>
    
<script>
document.getElementById('tanggal-lahir').addEventListener('blur', function(e) {
    var inputTanggal = e.target.value;
    var regex = /^\d{4}-\d{2}-\d{2}$/;

    if (!regex.test(inputTanggal)) {
        alert('Format tanggal lahir tidak valid. Gunakan format YYYY-MM-DD. (Contoh 2023-12-21)');
        // Atau manipulasi DOM untuk menampilkan pesan error
    }
});

document.getElementById('nama').addEventListener('input', function(e) {
    if (e.target.value.length > 50) {
        alert('Nama tidak boleh lebih dari 50 karakter.');
    }
});

document.getElementById('tempat_lahir').addEventListener('input', function(e) {
    if (e.target.value.length > 30) {
        alert('Tempat lahir tidak boleh lebih dari 30 karakter.');
    }
});

document.getElementById('email').addEventListener('input', function(e) {
    if (e.target.value.length > 50) {
        alert('Email tidak boleh lebih dari 50 karakter.');
    }
});

document.getElementById('no_hp').addEventListener('input', function(e) {
    if (e.target.value.length > 15) {
        alert('No HP tidak boleh lebih dari 15 karakter.');
    }
});

document.getElementById('alamat').addEventListener('input', function(e) {
    if (e.target.value.length > 100) {
        alert('Alamat tidak boleh lebih dari 100 karakter.');
    }
});
</script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>