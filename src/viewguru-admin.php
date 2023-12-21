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

$nip = isset($_GET['nip']) ? $_GET['nip'] : ''; // Ambil NIP dari URL

// Cek apakah NIP kosong, jika iya redirect
if (empty($nip)) {
    echo "<script>alert('NIP tidak ditemukan.'); window.location='daftarguru-admin.php';</script>";
    exit;
}

// Query untuk mengambil data guru berdasarkan NIP
$query = "SELECT * FROM guru WHERE nip = '$nip'";
$result = mysqli_query($conn, $query);
$data_guru = mysqli_fetch_assoc($result);

// Jika data guru tidak ditemukan
if (!$data_guru) {
    echo "<script>alert('Data guru tidak ditemukan.'); window.location='daftarguru-admin.php';</script>";
    exit;
}

// Tampilkan data guru
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
            <img id="profile-image" src="image/<?php echo $data_guru['foto'] ?>" alt="Profile Picture" />
        </div>

            <div class="data-diri-profile-edit" style="border: none;">
                <div class="column">
                    <div class="form-group">
                        <label for="nama">Nama :</label>
                        <input type="text" name="nama" value="<?php echo $data_guru['nama'] ?>" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="nip">NIP :</label>
                        <input type="text" name="nip" value="<?php echo $data_guru['nip'] ?>" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="passsword">Password :</label>
                        <input type="text" name="password" value="Password Tidak Dapat Dilihat" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="tempat-lahir">Tempat Lahir :</label>
                        <input type="text" name="tempat_lahir" value="<?php echo $data_guru['tempat_lahir'] ?>" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="no-hp">No HP :</label>
                        <input type="text" name="no_hp" value="<?php echo $data_guru['no_hp'] ?>" readonly/>
                    </div>

                </div>
                <div class="column">
                    <div class="form-group">
                        <label for="email">Email :</label>
                        <input type="text" name="email" value="<?php echo $data_guru['email'] ?>" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="tanggal-lahir">Tanggal Lahir :</label>
                        <input type="text" name="tanggal_lahir" value="<?php echo $data_guru['tanggal_lahir'] ?>" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="jenis-kelamin">Jenis Kelamin :</label>
                        <input type="text" name="jenis_kelamin" value="<?php echo $data_guru['jenis_kelamin'] ?>" readonly/>
                    </div>
                    <div class="form-group">
                        <label for="agama">Agama:</label>
                        <input type="text" name="agama" value="<?php echo $data_guru['agama'] ?>" readonly/>
                    </div>
                    <div class="form-group" style="border-bottom: none">
                        <label for="alamat">Alamat</label>
                        <input type="text" name="alamat" value="<?php echo $data_guru['alamat'] ?>" readonly/>
                    </div>
                </div>
            </div>

            <div class="edit-profile-buttons">
                <a href="daftarguru-admin.php" value="Back" id="edit-button"> Back </a>
            </div>
        </form>
    </div>
    <div class="" style="position:absolute; z-index:999">
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>