<?php
session_start();
require('db.php');
if (!isset($_SESSION["admin"])) {
    header("Location: login.php");
    exit;
}
$admin = $_SESSION["admin"]["nip"];
$ambil_admin = mysqli_query($conn, "SELECT * FROM admin WHERE nip = '$admin'");
$data = mysqli_fetch_array($ambil_admin);

$sql = "SELECT jp.*, g.nama AS nama_guru 
        FROM jadwal_pelajaran jp 
        LEFT JOIN guru g ON jp.nip = g.nip 
        ORDER BY jp.kode_kelas ASC";
$hasil_jadwal = mysqli_query($conn, $sql);
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
    <script src="https://code.iconify.design/2/2.1.1/iconify.min.js"></script>
    <script src="https://code.iconify.design/iconify-icon/1.0.8/iconify-icon.min.js"></script>
    <!-- bootstrap 5 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    
<style>
/* Style untuk tabel guru */
.table-guru {
  width: 100%;
  border-collapse:
}

.table-guru th,
.table-guru td {
  padding: 8px;
  text-align: left;
  border-bottom: 1px solid #ddd;
}

.table-guru th {
  background-color: #C6D8AF;
  color: black;
  cursor: pointer;
}

.table-guru th:hover {
  background-color: #B0C297;
}

.table-guru th .iconify {
  vertical-align: middle;
  margin-left: 5px;
}

.table-guru tr:hover {
  background-color: #f5f5f5;
}

.table-guru .action-icons {
  display: flex;
  justify-content: space-around;
}


.icon-action {
  cursor: pointer; 
  color: #4CAF50;
  margin: 0 5px;
}

.icon-action:hover {
  color: #3E8E41;
}
</style>

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
        <a href="profile-admin.php"><iconify-icon icon="material-symbols:person" width="30" class="align-middle p-3"></iconify-icon><?php echo $data['nama'] ?></a>
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
    <div class="d-flex justify-content-between mb-2">
        <div>
            <p class="fw-bold">Data Jadwal Mata Pelajaran</p>
        </div>
        <div>
            <a href="addjadwal-admin.php" class="btn btn-success">Tambah Jadwal</a>
        </div>
    </div>
    
    <div class="mb-3 d-flex justify-content-end">
        <input type="search" class="form-control" style="width: 200px;" id="searchInput" onkeyup="searchTable()" placeholder="Cari Jadwal...">
    </div>

        <!-- Bagian Tabel Guru -->
        <div class="container">
        <table id="tableGuru" class="table-guru">
        <thead style="background-color: #C6D8AF;">
    <thead>
        <tr>
            <th onclick="sortTable(0)">No <span class="iconify" data-icon="akar-icons:arrow-up-down"></span></th>
            <th onclick="sortTable(1)">Kode Kelas<span class="iconify" data-icon="akar-icons:arrow-up-down"></span></th>
            <th onclick="sortTable(2)">Kode Mapel<span class="iconify" data-icon="akar-icons:arrow-up-down"></span></th>
            <th onclick="sortTable(3)">Nama Guru Pengampu<span class="iconify" data-icon="akar-icons:arrow-up-down"></span></th>
            <th onclick="sortTable(4)">Jam Mulai<span class="iconify" data-icon="akar-icons:arrow-up-down"></span></th>
            <th onclick="sortTable(5)">Jam Selesai<span class="iconify" data-icon="akar-icons:arrow-up-down"></span></th>
            <th onclick="sortTable(6)">Hari<span class="iconify" data-icon="akar-icons:arrow-up-down"></span></th>
            <th>Action</th>
        </tr>
    </thead>
    <tbody>
    <?php 
    $no = 1; // Inisialisasi variabel counter
    foreach($hasil_jadwal as $jadwal): ?>
<tr>
    <td><?php echo $no++; ?></td>
    <td><?php echo $jadwal['kode_kelas']; ?></td>
    <td><?php echo $jadwal['kode_mapel']; ?></td>
    <td><?php echo $jadwal['nama_guru']; ?></td>
    <td><?php echo $jadwal['jam_mulai']; ?></td>
    <td><?php echo $jadwal['jam_selesai']; ?></td>
    <td><?php echo $jadwal['hari']; ?></td>
    <td>
        <!-- Menyimpan ID secara tersembunyi (jika diperlukan) -->
        <input type="hidden" name="id_jadwal" value="<?php echo $jadwal['id_jadwal']; ?>">
        <!-- Tombol Edit -->
        <a href="editjadwal-admin.php?id_jadwal=<?php echo $jadwal['id_jadwal']; ?>" class="btn btn-primary btn-sm">
            <iconify-icon icon="bxs:edit"></iconify-icon>
        </a>
        <!-- Tombol Delete -->
        <button onclick="confirmDelete('<?php echo $jadwal['id_jadwal']; ?>')" class="btn btn-danger btn-sm">
            <iconify-icon icon="fluent:delete-24-filled"></iconify-icon>
        </button>
    </td>
</tr>
<?php endforeach; ?>
    </tbody>
</table>
        </div>
    </div>
        
<script>
function sortTable(n) {
  var table, rows, switching, i, x, y, shouldSwitch, dir = "asc", switchcount = 0;
  table = document.getElementById("tableGuru");
  switching = true;
  
  while (switching) {
    switching = false;
    rows = table.getElementsByTagName("TR");

    for (i = 1; i < (rows.length - 1); i++) {
      shouldSwitch = false;
      x = rows[i].getElementsByTagName("TD")[n];
      y = rows[i + 1].getElementsByTagName("TD")[n];

      if (dir == "asc") {
        if (x.innerHTML.toLowerCase() > y.innerHTML.toLowerCase()) {
          shouldSwitch = true;
          break;
        }
      } else if (dir == "desc") {
        if (x.innerHTML.toLowerCase() < y.innerHTML.toLowerCase()) {
          shouldSwitch = true;
          break;
        }
      }
    }
    
    if (shouldSwitch) {
      rows[i].parentNode.insertBefore(rows[i + 1], rows[i]);
      switching = true;
      switchcount++;
    } else {
      if (switchcount == 0 && dir == "asc") {
        dir = "desc";
        switching = true;
      }
    }
  }

  // Update icons after sorting
  updateSortIcons(n, dir);
}

function updateSortIcons(columnIndex, direction) {
  var icons = document.querySelectorAll('.table-guru th .iconify');
  icons.forEach(function(icon, index) {
    icon.setAttribute('data-icon', 'akar-icons:arrow-up-down');
    if (index === columnIndex) {
      var newIcon = direction === 'asc' ? 'akar-icons:arrow-down' : 'akar-icons:arrow-up';
      icon.setAttribute('data-icon', newIcon);
    }
  });
}

function confirmDelete(id_jadwal) {
    var confirmDelete = confirm("Apakah Anda yakin ingin menghapus Jadwal dengan ID Jadwal: " + id_jadwal + "?");
    if (confirmDelete) {
        window.location.href = 'deletejadwal-admin.php?id_jadwal=' + id_jadwal;
    }
}
</script>

<script>
function searchTable() {
  var input, filter, table, tr, td, i, j, txtValue;
  input = document.getElementById("searchInput");
  filter = input.value.toUpperCase();
  table = document.getElementById("tableGuru");
  tr = table.getElementsByTagName("tr");

  // Loop through all table rows, and hide those who don't match the search query
  for (i = 1; i < tr.length; i++) {
    tr[i].style.display = "none"; // Hide the row initially
    td = tr[i].getElementsByTagName("td");
    for (j = 0; j < td.length; j++) {
      if (td[j]) {
        txtValue = td[j].textContent || td[j].innerText;
        if (txtValue.toUpperCase().indexOf(filter) > -1) {
          tr[i].style.display = ""; // Show the row if the query matches
          break; // Stop looking through the rest of the cells
        }
      }
    }
  }
}
</script>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
</body>

</html>