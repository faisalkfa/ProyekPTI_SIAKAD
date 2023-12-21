<?php
session_start();
require('db.php');
if (!isset($_SESSION["siswa"])) {
    header("Location: login.php");
    exit;
}
$siswa = $_SESSION["siswa"]["nisn"];
$ambil_siswa = mysqli_query($conn, "SELECT * FROM siswa WHERE nisn = $siswa");
$data = mysqli_fetch_array($ambil_siswa);

$nama_max_length = 50;
$tempat_lahir_max_length = 30;
$email_max_length = 30;
$no_hp_max_length = 15;
$alamat_max_length = 100;
$nama_wali_max_length = 50;
$no_telepon_wali_max_length = 15;
$angkatan_max_length = 5;
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
    
<style>
.profile-picture {
  position: fixed;
  top: 165px;
  left: 55px;
  width: 240px;
  height: 350px;
  display: flex;
  border-radius: 10px;
  flex-direction: column;
  align-items: center;
  background-color: #fff;
  border: 2px solid #000;
  overflow: hidden;
}
</style>

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
            <a href="profile-siswa.php"><iconify-icon icon="material-symbols:person" width="35" class="align-middle p-3"></iconify-icon><?php echo $data['nama'] ?></a>
        </div>
        <div class="logout-button">
        <a href="logout.php"><iconify-icon icon="material-symbols:logout" width="30" class="align-middle p-3"></iconify-icon>Logout</a>
      </div>
    </header>

    <div class="form-edit-profil">
        <form action="" method="POST" enctype="multipart/form-data">
            <div class="profile-picture">
                <img id="profile-image" src="image/<?php echo $data['foto'] ?>" alt="Profile Picture" />
                <div class="form-group">
                    <label>Upload Foto:</label>
                    <input type="file" name="foto" />
                </div>
            </div>

            <div class="data-diri-profile-edit" style="border: none;">
                <div class="column">
                    <div class="form-group">
                        <label for="nama">Nama :</label>
                        <input type="text" name="nama" value="<?php echo $data['nama'] ?>" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="nisn">NISN :</label>
                        <input type="text" name="nisn" value="<?php echo $data['nisn'] ?>" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="kelas">Kelas :</label>
                        <input type="text" name="kode_kelas" value="<?php echo $data['kode_kelas'] ?>" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="tempat-lahir">Tempat Lahir :</label>
                        <input type="text" name="tempat_lahir" value="<?php echo $data['tempat_lahir'] ?>" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="angkatan">Angkatan :</label>
                        <input type="text" name="angkatan" value="<?php echo $data['angkatan'] ?>" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="no-hp">No HP :</label>
                        <input type="text" name="no_hp" value="<?php echo $data['no_hp'] ?>" readonly/>
                    </div>

                </div>
                <div class="column">
                    <div class="form-group">
                        <label for="email">Email :</label>
                        <input type="text" name="email" value="<?php echo $data['email'] ?>" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="tanggal-lahir">Tanggal Lahir :</label>
                        <input type="text" name="tanggal_lahir" value="<?php echo $data['tanggal_lahir'] ?>" readonly/>
                    </div>
                    <div class="form-group">
                    <label for="jenis-kelamin">Jenis Kelamin :</label>
                        <input type="text" name="jenis_kelamin" value="<?php echo $data['jenis_kelamin'] ?>" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="agama">Agama :</label>
                        <input type="text" name="agama" value="<?php echo $data['agama'] ?>" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="nama-wali">Nama Wali :</label>
                        <input type="text" name="nama_wali" value="<?php echo $data['nama_wali'] ?>" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="no-wali">Nomor Telepon Wali :</label>
                        <input type="text" name="no_telepon_wali" value="<?php echo $data['no_telepon_wali'] ?>" readonly/>
                    </div>
                    <div class="form-group" style="border-bottom: none">
                        <label for="alamat">Alamat</label>
                        <input type="text" name="alamat" value="<?php echo $data['alamat'] ?>" readonly/>
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
    $nama = mysqli_real_escape_string($conn, $_POST['nama']);
    $kode_kelas = mysqli_real_escape_string($conn, $_POST['kode_kelas']);
    $tempat_lahir = mysqli_real_escape_string($conn, $_POST['tempat_lahir']);
    $angkatan = mysqli_real_escape_string($conn, $_POST['angkatan']);
    $no_hp = mysqli_real_escape_string($conn, $_POST['no_hp']);
    $email = mysqli_real_escape_string($conn, $_POST['email']);
    $tanggal_lahir = mysqli_real_escape_string($conn, $_POST['tanggal_lahir']);
    $jenis_kelamin = $_POST['jenis_kelamin'];
    $agama = $_POST['agama'];
    $nama_wali = mysqli_real_escape_string($conn, $_POST['nama_wali']);
    $no_telepon_wali = mysqli_real_escape_string($conn, $_POST['no_telepon_wali']);
    $alamat = mysqli_real_escape_string($conn, $_POST['alamat']);
    $password = !empty($_POST['password']) ? password_hash($_POST['password'], PASSWORD_DEFAULT) : $data['password'];

    // Penanganan upload foto
    $filename = $data['foto']; // Default ke foto yang sudah ada
    if (isset($_FILES['foto']) && $_FILES['foto']['error'] === UPLOAD_ERR_OK) {
    $file_tmp = $_FILES['foto']['tmp_name'];
    $file_type = $_FILES['foto']['type'];
    $file_size = $_FILES['foto']['size'];
    $old_filename = $data['foto']; // Nama file foto lama

    $allowed_types = ['image/jpeg', 'image/png', 'image/jpg'];
    if (in_array($file_type, $allowed_types) && $file_size <= 10000000) {
        // Hapus file lama jika bukan file default dan jika file tersebut ada
        $default_files = ["default-profile-picture.jpg"]; // Tambahkan semua nama file default yang Anda gunakan
        if (!in_array($old_filename, $default_files) && file_exists("image/" . $old_filename)) {
            unlink("image/" . $old_filename); // Hapus file lama
        }

        // Proses dan simpan file baru
        $filename = time() . '-' . $_FILES['foto']['name'];
        $destination = "image/" . $filename;
        move_uploaded_file($file_tmp, $destination);
    } else {
        echo "<script>alert('File tidak valid atau terlalu besar.');</script>";
        return;
    }
}
    $update_query = "UPDATE siswa SET 
                nama = '$nama',
                kode_kelas = '$kode_kelas',
                tempat_lahir = '$tempat_lahir',
                angkatan = '$angkatan',
                no_hp = '$no_hp',
                email = '$email',
                tanggal_lahir = '$tanggal_lahir',
                jenis_kelamin = '$jenis_kelamin',
                agama = '$agama',
                nama_wali = '$nama_wali',
                no_telepon_wali = '$no_telepon_wali',
                alamat = '$alamat',
                foto = '$filename'
                WHERE nisn = '$siswa'";

    if (mysqli_query($conn, $update_query)) {
        echo "<script>alert('Data berhasil diupdate!'); window.location='dashboard-siswa.php';</script>";
    } else {
        echo "<script>alert('Update gagal: " . mysqli_error($conn) . "');</script>";
    }
}
        ?>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>