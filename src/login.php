<?php
require('db.php');
session_start();

function verifyUser($conn, $table, $identifier_field, $username, $password) {
    $stmt = $conn->prepare("SELECT * FROM $table WHERE $identifier_field = ? LIMIT 1");
    $stmt->bind_param("s", $username);
    $stmt->execute();
    $result = $stmt->get_result();
    if ($result->num_rows === 1) {
        $user = $result->fetch_assoc();
        if (password_verify($password, $user['password'])) {
            return ['user' => $user, 'role' => $table];
        }
    }
    return null;
}

// Cek sesi dan redirect ke dashboard yang sesuai
if (isset($_SESSION['admin'])) {
    header("Location: dashboard-admin.php");
    exit;
} elseif (isset($_SESSION['guru'])) {
    header("Location: dashboard-guru.php");
    exit;
} elseif (isset($_SESSION['siswa'])) {
    header("Location: dashboard-siswa.php");
    exit;
}

$error = '';

if (isset($_POST["submit"])) {
    $username = $_POST['username'];
    $password = $_POST['password'];

    if ($username != "" && $password != "") {
        $loginData = verifyUser($conn, 'siswa', 'nisn', $username, $password) ??
                     verifyUser($conn, 'guru', 'nip', $username, $password) ??
                     verifyUser($conn, 'admin', 'nip', $username, $password);

        if ($loginData) {
            if ($loginData['role'] === 'admin') {
                $_SESSION["admin"] = $loginData['user'];
                header("Location: dashboard-admin.php");
            } elseif ($loginData['role'] === 'guru') {
                $_SESSION["guru"] = $loginData['user'];
                header("Location: dashboard-guru.php");
            } elseif ($loginData['role'] === 'siswa') {
                $_SESSION["siswa"] = $loginData['user'];
                header("Location: dashboard-siswa.php");
            }
            exit;
        } else {
            $error = "NIP/NISN atau Password Salah!";
        }
    }
}
?>

<!DOCTYPE html>
<html>

<head>
  <title>LOGIN | SMP Negeri 35 Bandar Lampung</title>
  <link rel="icon" href="../assets/LogoSMPN35.png" type="image/png">
  <link rel="stylesheet" type="text/css" href="../styles/styles.css" />
</head>

<body>
  <div class="left-half"></div>
  <div class="top-left">
    <img src="../assets/LogoSMPN35.png" alt="SMPN 35" class="logo" />
    <h1>Sistem Informasi Akademik <br />SMP Negeri 35 Bandar Lampung</h1>
  </div>
  <div class="right-half">
    <div class="login-container">
      <h1>Masuk Ke <b>SIAKAD</b></h1>
      <form id="loginForm" method="POST">
        <div class="atasbawah">
          <div class="atas">
            <p class="atas2">NISN/NIP:</p>
            <input type="text" id="username" name="username" placeholder="NISN/NIP" required autocomplete="off" />
          </div>
          <div class="bawah">
            <p class="bawah2">Kata Sandi:</p>
            <input type="password" id="password" name="password" placeholder="Password" required autocomplete="off" />
          </div>
        </div>
        <button type="submit" name="submit">Masuk</button>
      </form>
      <p id="loginMessage"><?php echo $error; ?></p>
    </div>
  </div>

  <footer>
    <p>&copy; SMP Negeri 35 Bandar Lampung</p>
  </footer>
</body>

</html>