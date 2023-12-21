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
            <a href="profile-siswa.php"><iconify-icon icon="material-symbols:person" width="35" class="align-middle p-3"></iconify-icon>
                <?php echo $data['nama'] ?>
            </a>
        </div>
        <div class="logout-button">
        <a href="logout.php"><iconify-icon icon="material-symbols:logout" width="30" class="align-middle p-3"></iconify-icon>Logout</a>
      </div>
    </header>

    <div class="form-edit-profil">
        <form action="" method="POST" enctype="multipart/form-data">
            <div class="profile-picture">
            <img id="profile-image" src="image/<?php echo $data['foto'] ?>" alt="Profile Picture" />
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
                        <label for="agama">Agama:</label>
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
                <a href="edit-siswa.php" id="edit-button">Edit</a>
            </div>
        </div>

        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>