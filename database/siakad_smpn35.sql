-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Dec 21, 2023 at 08:06 PM
-- Server version: 10.6.16-MariaDB-cll-lve
-- PHP Version: 8.1.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `siakadsm_dtbs`
--

-- --------------------------------------------------------

--
-- Table structure for table `absensi`
--

CREATE TABLE `absensi` (
  `id_absensi` int(11) NOT NULL,
  `id_jadwal` int(11) NOT NULL,
  `pertemuan_ke` int(11) NOT NULL,
  `kode_mapel` varchar(20) NOT NULL,
  `nisn` varchar(30) NOT NULL,
  `keterangan` enum('Hadir','Izin','Sakit','Alpa') NOT NULL,
  `tanggal` date NOT NULL,
  `waktu_input` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `absensi`
--

INSERT INTO `absensi` (`id_absensi`, `id_jadwal`, `pertemuan_ke`, `kode_mapel`, `nisn`, `keterangan`, `tanggal`, `waktu_input`) VALUES
(872, 2, 1, 'PAK7', '0117960703', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(871, 2, 1, 'PAK7', '0118699996', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(870, 2, 1, 'PAK7', '0114715268', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(869, 2, 1, 'PAK7', '0109481203', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(868, 2, 1, 'PAK7', '0113808006', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(867, 2, 1, 'PAK7', '0116053851', 'Izin', '2023-12-21', '2023-12-21 19:24:09'),
(866, 2, 1, 'PAK7', '0104738705', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(865, 2, 1, 'PAK7', '0101439042', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(864, 2, 1, 'PAK7', '3112852721', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(863, 2, 1, 'PAK7', '3119464057', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(862, 2, 1, 'PAK7', '3114641290', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(861, 2, 1, 'PAK7', '0116131129', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(860, 2, 1, 'PAK7', '0117400387', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(859, 2, 1, 'PAK7', '0116090559', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(858, 2, 1, 'PAK7', '0108135616', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(857, 2, 1, 'PAK7', '0103913191', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(856, 2, 1, 'PAK7', '0117090237', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(855, 2, 1, 'PAK7', '0105541468', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(854, 2, 1, 'PAK7', '3124823117', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(853, 2, 1, 'PAK7', '0112817904', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(852, 2, 1, 'PAK7', '0119455622', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(851, 2, 1, 'PAK7', '0106184109', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(850, 2, 1, 'PAK7', '0093460468', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(849, 2, 1, 'PAK7', '0101547474', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(848, 2, 1, 'PAK7', '0095016539', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(847, 2, 1, 'PAK7', '0117623442', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(846, 2, 1, 'PAK7', '3111236582', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(845, 2, 1, 'PAK7', '0117720870', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(844, 2, 1, 'PAK7', '0117277818', 'Hadir', '2023-12-21', '2023-12-21 19:24:09'),
(843, 2, 1, 'PAK7', '0113701227', 'Hadir', '2023-12-21', '2023-12-21 19:24:09');

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id_admin` int(11) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status_admin` enum('Aktif','Tidak Aktif') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id_admin`, `nip`, `password`, `nama`, `jenis_kelamin`, `tanggal_lahir`, `tempat_lahir`, `agama`, `no_hp`, `email`, `alamat`, `foto`, `status_admin`) VALUES
(1, 'liliksugeng85@gmail.com', '$2y$10$7yLNenS1ba776ZmrFz2OZuCroziG4/PR8Ey1ZzCXWwto/xsnTEtla', 'Lilik Sugeng', 'Laki-Laki', '1985-06-22', 'Bandar Lampung', 'Islam', '0816412873', 'liliksugeng85@gmail.com', 'Jl. Kopi Utara III No. 116 Perumnas Way Halim Kecamatan Way Halim', 'default-profile-picture.jpg', 'Aktif'),
(6, '120140197', '$2y$10$RONvpKfp/uwPtM7lZlp1sOihOkOUUuCx2lsQ2uzdwylziZ4o28a4q', 'Aqsal Yazid Setiawan', 'Laki-Laki', '2023-01-01', 'Bandar Lampung', 'Islam', '-', '-', '-', 'default-profile-picture.jpg', 'Aktif'),
(7, '120140157', '$2y$10$tIb8U7TlOcRdI1uRM7h1AurR/99oxzogjAzyDVXb4HGaJ6mZNGhQO', 'Faustine Elvaretta Tambila', 'Perempuan', '2002-10-09', 'TIMIKA', 'Katholik', '0895361124699', '-', '-', 'default-profile-picture.jpg', 'Aktif'),
(8, '120140123', '$2y$10$pPfH2qSo6W2CGqpWehHcCe/FXy9tQis/2xsZZmvGhMcjY83KSkfWS', 'Winda Manurung', 'Perempuan', '2023-01-01', '-', '-', '-', '-', '-', 'default-profile-picture.jpg', 'Aktif'),
(9, '120140199', '$2y$10$shufohVct3rhibcQrgrPgO8GADdib.lXok5TnnYhc60BtXaNKl2tS', 'Chaterine Sidabutar', 'Perempuan', '2023-01-01', '-', '-', '-', '-', '-', 'default-profile-picture.jpg', 'Aktif'),
(10, '120140108', '$2y$10$o5n.nJzWSiOcvYNVAl2rTeeSF6LDYo1rly5jBldPEp6M.oIl7NEwa', 'Muhammad Alhafiz', 'Laki-Laki', '2023-01-01', '-', '-', '-', '-', '-', 'default-profile-picture.jpg', 'Aktif'),
(11, '120140201', '$2y$10$wLZmFqVEe/DZt/iIMIC2d.MFSKYvE/qcfwObhzCFjpjdBI06a2zXq', 'Azka Hafidz Asianto', 'Laki-Laki', '2023-01-01', '-', '-', '-', '-', '-', 'default-profile-picture.jpg', 'Aktif'),
(12, '120140158', '$2y$10$658iOBFOI0j4UoetyukHceFMUjKxuRclSsHFvExFu2s/g2WH7.RAy', 'Faisal Khairul Fasha', 'Laki-Laki', '2003-03-02', 'Kotabumi', 'Islam', '082375575526', '-', '-', 'default-profile-picture.jpg', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `guru`
--

CREATE TABLE `guru` (
  `id_guru` int(11) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `email` varchar(50) NOT NULL,
  `alamat` varchar(100) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status_guru` enum('Aktif','Tidak Aktif') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `guru`
--

INSERT INTO `guru` (`id_guru`, `nip`, `password`, `nama`, `jenis_kelamin`, `tanggal_lahir`, `tempat_lahir`, `agama`, `no_hp`, `email`, `alamat`, `foto`, `status_guru`) VALUES
(28, 'annisaikalestari313@gmail.com', '$2y$10$djjd/xKluxF6Z3SFP.dBZOpe0onEBaoiuSY76mMboHg2bPHwMkPPO', 'Annisa Ika Lestari', 'Perempuan', '1992-03-31', 'Bandar Lampung', 'Islam', '081390222263', 'annisaikalestari313@gmail.com', 'Jl. Untung Suropati Gg. Makarti No. 39', 'default-profile-picture.jpg', 'Aktif'),
(43, '197505112006041010', '$2y$10$jXLiRaIZ4Aw9zRpvIJTz8u9EPzQwjz.eCukRmvxBKgEmbFyKfvcL2', 'Bambang Budi Wahyudi', 'Laki-Laki', '1975-05-11', 'Bandar Lampung', 'Islam', '082281848577', 'bambangbudiwahyudi718@gmail.com', 'Jl. Bahari No. 58, RT 4, RW 0, Dusun Sukabaru, Kelurahan Panjang Utara, Kec. Panjang', 'default-profile-picture.jpg', 'Aktif'),
(12, '199611082022212010', '$2y$10$bxESUzrJoeUHmmBfDlHyxOv2b9F8RRYK1FxxbhSYb2bP9C2a3PKAC', 'Adinda Wijayanti', 'Perempuan', '1996-11-08', 'Jakarta', 'Islam', '082261622042', 'adindawijayanti23@gmail.com', 'Jl. Ikan Baung No. 34 LK. II, RT 30, Kelurahan Bumi Waras, Kec. Bumi Waras, ', 'default-profile-picture.jpg', 'Aktif'),
(16, '199301172023211010', '$2y$10$dXlgnDTgBVbQa4QpOmxhauzQMGv5Io/4awv5IHcBAhT2SK9t1Ujie', 'Galuh Wahyu Pramana', 'Laki-Laki', '1993-01-17', 'Bandar Lampung', 'Islam', '08976113884', 'wahyupramanagaluh@gmail.com', 'JL. Murai No. 21 VB 10 Polda 2, Kelurahan BERINGIN RAYA, Kec. Kemiling', 'default-profile-picture.jpg', 'Aktif'),
(17, '199109182019032009', '$2y$10$FRiHl1QYnyI/nmJtDf1BNuecbsMwCOWmTNFgvwxg9xf07dnia0kxu', 'Iskadina Eka Putri', 'Perempuan', '1991-09-18', 'Jakarta', 'Islam', '089523101440', 'iskadinaekaputri@gmail.com', 'Jl. H. Komarudin Gg. Ismail 2 No. 63, RT 5, Kelurahan Rajabasa Raya, Kec. Rajabasa, ', 'default-profile-picture.jpg', 'Aktif'),
(21, 'kharina.oktaviana3@gmail.com', '$2y$10$J06V/ozdMd8ZTn0n2c8DjeJgc0zNlNfvHj2n6txyRrixXr8wTh4e6', 'Kharina Oktaviana', 'Perempuan', '1992-10-17', 'Bandar Lampung', 'Islam', '082186446875', 'kharina.oktaviana3@gmail.com', 'JL. DR. SETIA BUDI NO.60 LK I, RT 3, Kelurahan KURIPAN, Kec. Teluk Betung Barat', 'default-profile-picture.jpg', 'Aktif'),
(19, '199408062019032003', '$2y$10$OH4P49tEzlNRuCar3nrtSuypzFi6XSgOswqAgteoVPE8xsudRCpum', 'Klara Ken Laras', 'Perempuan', '1994-08-06', 'Bandar Lampung', 'Katholik', '085768227131', 'larasken08@gmail.com', 'Jl Ratu Dibalau Gg. Timbul No. 28, Kelurahan Tanjung Senang, Kec. Tanjung Senang', 'default-profile-picture.jpg', 'Aktif'),
(20, '199501112020122017', '$2y$10$6TolIKVGUAvxvRoIDSEWuOzluBhIr8Rqo/Mgyohp59wbooDRw7xcu', 'Lela Tri Indriani', 'Perempuan', '1995-01-11', 'Bandar Lampung', 'Islam', '081957031825', 'lelatriindriani@gmail.com', 'Jl. Merpati No. 3 LK. II Perum Polda II, Kelurahan Beringin Raya, Kec. Kemiling', 'default-profile-picture.jpg', 'Aktif'),
(22, '199702082020122021', '$2y$10$SpLnxHlI3VWa0he4oMippuackwhYrlzcuTY3AcmNPK5rm4LYCQ4SK', 'Shofura Farah Diba', 'Perempuan', '1997-02-08', 'PENAWAR JAYA', 'Islam', '082269399269', 'sfd.farah@gmail.com', 'MEKAR JAYA rt 2 rw 3 desa Mekar Jaya, Kec. Banjar Margo', 'default-profile-picture.jpg', 'Aktif'),
(23, '199412182023212025', '$2y$10$PhahtzTJy5cwQY9HQ8cPbec30SzjsxXeIhvsq5CDNPi.X5HBV1Uu.', 'Rizki Samty Ayuningtyas', 'Perempuan', '1994-12-18', 'BANDAR LAMPUNG', 'Islam', '08111634599', 'rizkysamty94@gmail.com', 'Jl.TURI RAYA Gg. PALEM No. 28	LABUHAN DALAM,	Kec. Tanjung Senang', 'default-profile-picture.jpg', 'Aktif'),
(24, '196410071990032004', '$2y$10$GF9YGG7X8VyVjtvvtYYLHeGgU8FpFsYrHwZ2mZeQWgBH1tyArQBX6', 'Santini', 'Perempuan', '1964-10-07', 'Teluk Betung', 'Islam', '081369563904', 'tinisantini427@gmail.com', 'Jl Ciptomangunkusumo No 61 rt 0 rw 0, Desa SUMUR BATU, Kec. Teluk Betung Utara', 'default-profile-picture.jpg', 'Aktif'),
(25, '197310091999032004', '$2y$10$h0HtKSre9EZJ0phprt/HqO4G9Wxpw3vq53iVg.4DYOEAPDJIKgaz6', 'Ristiyana', 'Perempuan', '1973-10-09', 'Padang Ratu', 'Islam', '081369207337', 'ristiyanahasan@gmail.com', 'Jl. Cikditiro Perumahan Wismamas Estate Blok D 3 No. 9 Desa Beringin Raya, Kec. Kemilin', 'default-profile-picture.jpg', 'Aktif'),
(26, '199608242023212013', '$2y$10$zOQArwUExnA670Dg7ZSJi.rsPCVTB59dOHahdtNLG.2fkh1TRuZ0m', 'Ani Sulastri', 'Perempuan', '1996-08-24', 'Bandar Lampung', 'Islam', '082380125893', 'anisulastri902@gmail.com', 'perumahan Pesawaran Residence Cluster Plamboyan Blok H No. 11', 'default-profile-picture.jpg', 'Aktif'),
(29, '199203222022211004', '$2y$10$yz7.i9xR8RB1pBLmu9LYBeOtuRei6cpRWnp8bEiJiuN9MpR5VfzKO', 'M.H.MUDRIK MUBAROK', 'Laki-Laki', '1992-03-22', 'BandarÂ Lampung', 'Islam', '081280800926', 'mudrikmubarok22@gmail.com', 'JL.PRAMUKA GG.VANILI 3, LANGKAPURA, Kec. Langkapura', 'default-profile-picture.jpg', 'Aktif'),
(30, '199610222019031002', '$2y$10$uOreCe6A6/lMaDtqqtvZp.4XKSVObA2iQm7s8mRJJ7NEu6aIsQJUq', 'Maskur Ahmad', 'Laki-Laki', '1996-10-22', 'Bukit Kemuning', 'Islam', '082376850835', 'maskurahmad83@gmail.com', 'Perumahan Pesawaran Residence Cluster Plamboyan Blok H No. 10, RT 23 RW 2, Negeri Sakti, Kec. Gedung', 'default-profile-picture.jpg', 'Aktif'),
(31, '199306072023212027', '$2y$10$hcUPQiUTC92044z.wjL6NujDhdr2lY3FeFRZXkRGjJ5m37dHYntdG', 'Mentari Puspasari', 'Perempuan', '1993-06-07', 'Tanjung Karang', 'Islam', '08976001256', 'sarimentaripuspa@gmail.com', 'Jl. PURNAWIRAWAN. Gg. SWADAYA 3. LK.I, GUNUNG TERANG, Kec. Langkapura', 'default-profile-picture.jpg', 'Aktif'),
(32, '197007122021212002', '$2y$10$lbtcxWOffuFrNYPfHlVQlO5SNKW2McVa8AqlFEi1ZWxw11n7SM4zm', 'Supini', 'Perempuan', '1970-07-12', 'Gunung Terang', 'Islam', '081292964132', 'supinilp3333@gmail.com', 'Jl. Purnawirawan 1 No. 44, RT 3 RW 0, Kelurahan Gunung Terang, Kecamatan Langkapura', 'default-profile-picture.jpg', 'Aktif'),
(45, 'mellydrmynti95@gmail.com', '$2y$10$ba3b3uYmjXRJ7m6MzkBUHe0rF9on2Y7aopfMYqYlaqbFOIxynPpTG', 'MELLY DARMAYANTI', 'Perempuan', '1995-05-25', 'KOTA BUMI', 'Islam', '082178856969', 'mellydrmynti95@gmail.com', 'JL. PAJAJARAN GG.TERATAI NO.59 JAGABAYA II, Kec. Way Halim', 'default-profile-picture.jpg', 'Aktif'),
(44, 'ramadhaniannisa378@gmail.com', '$2y$10$kDWGXY.PXlUgmRchVdcvcOsXzPZQAZcANBkGKC2823BpEye7sWXgO', 'Annisa Ramadhani', 'Perempuan', '1993-02-24', 'KEMILING', 'Islam', '082282450953', 'ramadhaniannisa378@gmail.com', 'JL. TEUKU CIK DITIRO GG. MELATI 3 NO. 33, RT 17, RW 7, Kelurahan SUMBEREJO, Kec. Kemiling', 'default-profile-picture.jpg', 'Aktif'),
(35, '199511092022212009', '$2y$10$M/JGOoj5v1roMrsnfZ6YieHgq.DpFH7/wR3Y.WOFhdiMH.89cbIWu', 'Puteri Indah Sri Wahyuni', 'Perempuan', '1995-11-09', 'Bandar Lampung', 'Islam', '085763886392', 'puteriindah09@gmail.com', 'Jl Jati Dalam Gg. waru No. 91 RT. 18, Tanjung Raya, Kec. Kedamaian', 'default-profile-picture.jpg', 'Aktif'),
(36, '197908262014072001', '$2y$10$lZPc2SW6S.kvRjltdBnkDufZVwdA4EHaBcLleULSGzJLcQPhgyGtq', 'Rina Fitria', 'Perempuan', '1979-08-26', 'Tanjung Karang', 'Islam', '081272377741', 'inaega3@gmail.com', 'Jl H. Nasir No. 5 RT. 10, KOTA BARU, Kec. Tanjung Karang Timur', 'default-profile-picture.jpg', 'Aktif'),
(37, 'resta.niriza02@gmail.com', '$2y$10$o8NJ0NepU6L581UMWuWQA.ZL8ubgkFfS4UBFx6l1ulh8Y7/zJZMh.', 'Resta Niriza', 'Perempuan', '1995-09-02', 'Bandar Lampung', 'Islam', '082280149542', 'resta.niriza02@gmail.com', 'JL Mangris Blok Tm I No. 3, RT. 3, Way Halim Permai, Kec. Way Halim', 'default-profile-picture.jpg', 'Aktif'),
(38, 'rifkifarindra0114@gmail.com', '$2y$10$sOizJJapqkFkp16iYnsf1epDpKKXXz4qrsu/DaJW2mjQoHRUlhgSK', 'Rifki Farindra', 'Laki-Laki', '1993-12-01', 'Bandar Lampung', 'Islam', '081231801881', 'rifkifarindra0114@gmail.com', 'Jl. Imam Bonjol Gedong Air Gg. Durian, RT. 7, Gedung Air, Kec. Tanjung Karang Barat', 'default-profile-picture.jpg', 'Aktif'),
(39, '199412192022212016', '$2y$10$5NDFMtXWypPyC6vtzGKyF.JD33M4ybqFxWg7FBZRcY36Ca8RzooGC', 'Defriyanti', 'Perempuan', '1994-12-19', 'BandarÂ Lampung', 'Islam', '082178948008', 'defriyanti64@gmail.com', 'Jl. Putri Balau No 148	Tanjung Agung Raya	Tanjung Agung Raya', 'default-profile-picture.jpg', 'Aktif'),
(40, '199609042022212003', '$2y$10$b68qD.oeVAuVidQhdoYFcO7gPTS99NU9eezeGtbFFMg5qkQoqeU0S', 'Devi Septiani', 'Perempuan', '1996-09-04', 'BandarÂ Lampung', 'Islam', '0895640010210', 'septiani.devi94@gmail.com', 'Jl. Teluk Bone I Gg. Masjid Jami Nurul Huda No. 71, LK.1   Kota Karang	Kec. Teluk Betung Timur', 'default-profile-picture.jpg', 'Aktif'),
(41, '199407032023212033', '$2y$10$uZYM1N/n4ZPOX.VVtzGvK.TshdfK.rP6SVld9iCTsrgWRDeIljOd6', 'Dian Puspita Sari', 'Perempuan', '1994-07-03', 'LAMONGAN', 'Islam', '082175753506', 'dianps023@gmail.com', 'Jl Tamin Gg. Sumur Santi	Sukajawa	Kec. Tanjung Karang Barat', 'default-profile-picture.jpg', 'Aktif'),
(46, '198211212010012004', '$2y$10$kV68wOp1qWfL2qez1MThKO9F/48QdbpnhXaW5534ono0.RJYSpWFu', 'Suwartini', 'Perempuan', '1982-11-21', 'Rantau Temiang', 'Islam', '082178031116', 'tini211182@gmail.com', 'Jl.Perintis Kemerdekaan No 145, RT 2, RW 0, Kelurahan Tanjung Gading, Kec. Kedamaian', 'default-profile-picture.jpg', 'Aktif'),
(47, 'yosiagustiyarini@gmail.com', '$2y$10$8Vamv7.XnuL/BPWHCS5EVOzeplc2tS6HYEiHb0uS6GjoTve0nA7XO', 'Yosi Agustiya Rini', 'Perempuan', '1994-03-13', 'Bandar Lampung', 'Islam', '08981601092', 'yosiagustiyarini@gmail.com', 'Jl Pagar Alam Perumahan geriya Sejahtera Blok M No. 1, Kelurahan Gunung Terang, Kec. Langkapura', 'default-profile-picture.jpg', 'Aktif'),
(48, '197906062005012020', '$2y$10$FlNIHMs2U3GXd.o2Sbc/n.JAEXH/E5il0uqmIWyPnUsIkfGp7IJZG', 'Yuni Dian Sari', 'Perempuan', '1979-06-06', 'Tanjung Karang', 'Islam', '082376291068', 'yunidiansari06@gmail.com', 'Jl. Pulau Tegal GG Apel I No. 48 Lk. 2, Kelurahan Waydadi, Kec. Sukarame', 'default-profile-picture.jpg', 'Aktif');

-- --------------------------------------------------------

--
-- Table structure for table `jadwal_pelajaran`
--

CREATE TABLE `jadwal_pelajaran` (
  `id_jadwal` int(11) NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `kode_mapel` varchar(10) NOT NULL,
  `nip` varchar(50) NOT NULL,
  `jam_mulai` time NOT NULL,
  `jam_selesai` time NOT NULL,
  `hari` varchar(20) NOT NULL,
  `aktif` enum('Ya','Tidak') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `jadwal_pelajaran`
--

INSERT INTO `jadwal_pelajaran` (`id_jadwal`, `kode_kelas`, `kode_mapel`, `nip`, `jam_mulai`, `jam_selesai`, `hari`, `aktif`) VALUES
(1, '7A', 'SDP7', '199412182023212025', '07:40:00', '09:00:00', 'Senin', 'Ya'),
(2, '7A', 'PAK7', 'annisaikalestari313@gmail.com', '09:00:00', '09:40:00', 'Senin', 'Ya'),
(3, '7A', 'PKN7', 'annisaikalestari313@gmail.com', '10:00:00', '11:20:00', 'Senin', 'Ya'),
(4, '7A', 'MTK7', '199301172023211010', '11:20:00', '13:10:00', 'Senin', 'Ya'),
(5, '7A', 'BHL7', '199407032023212033', '13:10:00', '14:30:00', 'Senin', 'Ya'),
(37, '7A', 'PJS7', 'kharina.oktaviana3@gmail.com', '07:00:00', '08:20:00', 'Selasa', 'Ya'),
(38, '7A', 'IPS7', 'yosiagustiyarini@gmail.com', '08:20:00', '10:40:00', 'Selasa', 'Ya'),
(39, '7A', 'BIG7', '197906062005012020', '10:40:00', '13:10:00', 'Selasa', 'Ya'),
(40, '7A', 'IPA7', '199412182023212025', '07:00:00', '08:20:00', 'Rabu', 'Ya'),
(41, '7A', 'IFK7', '199109182019032009', '08:20:00', '09:40:00', 'Rabu', 'Ya'),
(42, '7A', 'BID7', '197007122021212002', '10:00:00', '11:20:00', 'Rabu', 'Ya'),
(43, '7A', 'PAI7', 'rifkifarindra0114@gmail.com', '11:20:00', '13:10:00', 'Rabu', 'Ya'),
(44, '7A', 'MTK7', '199301172023211010', '07:00:00', '08:20:00', 'Kamis', 'Ya'),
(45, '7A', 'IPA7', '199412182023212025', '08:20:00', '09:40:00', 'Kamis', 'Ya'),
(46, '7A', 'BKL7', '199511092022212009', '10:00:00', '10:40:00', 'Kamis', 'Ya'),
(47, '7A', 'BID7', '197007122021212002', '10:40:00', '13:10:00', 'Kamis', 'Ya'),
(48, '7A', 'BID7', '197007122021212002', '10:40:00', '13:10:00', 'Kamis', 'Ya'),
(49, '7B', 'PAI7', 'rifkifarindra0114@gmail.com', '07:40:00', '09:00:00', 'Senin', 'Ya'),
(50, '7B', 'MTK7', '199301172023211010', '09:00:00', '10:40:00', 'Senin', 'Ya'),
(51, '7B', 'IPA7', '199306072023212027', '10:40:00', '12:00:00', 'Senin', 'Ya'),
(52, '7B', 'BIG7', '197906062005012020', '12:30:00', '14:30:00', 'Senin', 'Ya'),
(53, '7B', 'MTK7', '199611082022212010', '07:00:00', '08:20:00', 'Selasa', 'Ya'),
(54, '7B', 'IFK7', '199109182019032009', '08:20:00', '09:40:00', 'Selasa', 'Ya'),
(55, '7B', 'BKL7', '199511092022212009', '10:00:00', '10:40:00', 'Selasa', 'Ya'),
(56, '7B', 'BID7', '197007122021212002', '10:40:00', '13:10:00', 'Selasa', 'Ya'),
(57, '7B', 'PJS7', 'kharina.oktaviana3@gmail.com', '07:00:00', '08:20:00', 'Rabu', 'Ya'),
(58, '7A', 'BID7', '197007122021212002', '08:20:00', '09:40:00', 'Rabu', 'Ya'),
(59, '7B', 'IPA7', '199306072023212027', '10:00:00', '11:20:00', 'Rabu', 'Ya'),
(60, '7B', 'PKN7', 'annisaikalestari313@gmail.com', '11:20:00', '13:10:00', 'Rabu', 'Ya'),
(61, '7B', 'SDP7', '199412182023212025', '07:00:00', '08:20:00', 'Kamis', 'Ya'),
(62, '7B', 'BHL7', '199407032023212033', '08:20:00', '09:40:00', 'Kamis', 'Ya'),
(63, '7B', 'PAK7', 'annisaikalestari313@gmail.com', '10:00:00', '10:40:00', 'Kamis', 'Ya'),
(64, '7B', 'IPS7', 'yosiagustiyarini@gmail.com', '10:40:00', '13:10:00', 'Kamis', 'Ya'),
(65, '7C', 'IPS7', 'yosiagustiyarini@gmail.com', '07:00:00', '09:40:00', 'Senin', 'Ya'),
(66, '7C', 'MTK7', '199608242023212013', '10:00:00', '11:20:00', 'Senin', 'Ya'),
(67, '7C', 'MTK7', '199608242023212013', '10:00:00', '11:20:00', 'Senin', 'Ya'),
(68, '7C', 'BHL7', '199407032023212033', '11:20:00', '13:10:00', 'Senin', 'Ya'),
(69, '7C', 'IPA7', '199306072023212027', '13:10:00', '14:30:00', 'Senin', 'Ya'),
(70, '7C', 'BID7', '197007122021212002', '07:00:00', '09:00:00', 'Selasa', 'Ya'),
(71, '7C', 'BID7', '197007122021212002', '07:00:00', '09:00:00', 'Selasa', 'Ya'),
(72, '7C', 'PJS7', 'kharina.oktaviana3@gmail.com', '09:00:00', '10:40:00', 'Selasa', 'Ya'),
(73, '7C', 'IPA7', '199306072023212027', '10:40:00', '12:00:00', 'Selasa', 'Ya'),
(74, '7C', 'BKL7', '199511092022212009', '12:30:00', '13:10:00', 'Selasa', 'Ya'),
(75, '7C', 'PKN7', 'annisaikalestari313@gmail.com', '07:00:00', '08:20:00', 'Rabu', 'Ya'),
(76, '7C', 'PAI7', 'rifkifarindra0114@gmail.com', '08:20:00', '09:40:00', 'Rabu', 'Ya'),
(77, '7C', 'IFK7', '199109182019032009', '10:00:00', '11:20:00', 'Rabu', 'Ya'),
(78, '7C', 'BID7', '197007122021212002', '11:20:00', '13:10:00', 'Rabu', 'Ya'),
(79, '7C', 'BID7', '197007122021212002', '11:20:00', '13:10:00', 'Rabu', 'Ya'),
(80, '7C', 'MTK7', '199608242023212013', '07:00:00', '08:20:00', 'Kamis', 'Ya'),
(81, '7C', 'BIG7', '199109182019032009', '08:20:00', '10:40:00', 'Kamis', 'Ya'),
(82, '7C', 'SDP7', '199412182023212025', '10:40:00', '12:00:00', 'Kamis', 'Ya'),
(83, '7C', 'SDP7', '199412182023212025', '10:40:00', '12:00:00', 'Kamis', 'Ya'),
(84, '7C', 'PAK7', 'annisaikalestari313@gmail.com', '12:30:00', '13:10:00', 'Kamis', 'Ya'),
(85, '7D', 'BIG7', '199109182019032009', '07:40:00', '09:40:00', 'Senin', 'Ya'),
(86, '7D', 'PJS7', 'kharina.oktaviana3@gmail.com', '10:00:00', '11:20:00', 'Senin', 'Ya'),
(87, '7D', 'MTK7', '199608242023212013', '11:20:00', '13:10:00', 'Senin', 'Ya'),
(88, '7D', 'PKN7', 'annisaikalestari313@gmail.com', '13:10:00', '14:30:00', 'Senin', 'Ya'),
(89, '7D', 'IFK7', '199109182019032009', '07:00:00', '08:20:00', 'Selasa', 'Ya'),
(90, '7D', 'IPA7', '199306072023212027', '08:20:00', '09:40:00', 'Selasa', 'Ya'),
(91, '7D', 'PAK7', 'annisaikalestari313@gmail.com', '10:00:00', '10:40:00', 'Selasa', 'Ya'),
(92, '7D', 'IPS7', 'yosiagustiyarini@gmail.com', '10:40:00', '13:10:00', 'Selasa', 'Ya'),
(93, '7D', 'BID7', '197007122021212002', '07:00:00', '08:20:00', 'Rabu', 'Ya'),
(94, '7D', 'BID7', '197007122021212002', '07:00:00', '08:20:00', 'Rabu', 'Ya'),
(95, '7D', 'MTK7', '199608242023212013', '08:20:00', '09:40:00', 'Rabu', 'Ya'),
(96, '7D', 'SDP7', '199412192022212016', '10:00:00', '11:20:00', 'Rabu', 'Ya'),
(97, '7D', 'SDP7', '199412192022212016', '10:00:00', '11:20:00', 'Rabu', 'Ya'),
(98, '7D', 'IPA7', '199306072023212027', '11:20:00', '13:10:00', 'Rabu', 'Ya'),
(99, '7D', 'BHL7', '199407032023212033', '07:00:00', '08:20:00', 'Kamis', 'Ya'),
(100, '7D', 'BID7', '197007122021212002', '08:20:00', '10:40:00', 'Kamis', 'Ya'),
(101, '7D', 'PAI7', 'rifkifarindra0114@gmail.com', '10:40:00', '12:00:00', 'Kamis', 'Ya'),
(103, '7D', 'BKL7', '199511092022212009', '12:30:00', '13:10:00', 'Kamis', 'Ya');

-- --------------------------------------------------------

--
-- Table structure for table `kelas`
--

CREATE TABLE `kelas` (
  `id_kelas` int(11) NOT NULL,
  `kode_kelas` varchar(10) NOT NULL,
  `tingkat_kelas` enum('7','8','9') NOT NULL,
  `nama_kelas` varchar(20) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `kelas`
--

INSERT INTO `kelas` (`id_kelas`, `kode_kelas`, `tingkat_kelas`, `nama_kelas`) VALUES
(1, '7A', '7', 'Kelas 7A'),
(2, '7B', '7', 'Kelas 7B'),
(3, '7C', '7', 'Kelas 7C'),
(4, '7D', '7', 'Kelas 7D'),
(5, '8A', '8', 'Kelas 8A'),
(6, '8B', '8', 'Kelas 8B'),
(7, '8C', '8', 'Kelas 8C'),
(8, '8D', '8', 'Kelas 8D'),
(9, '8E', '8', 'Kelas 8E'),
(10, '9A', '9', 'Kelas 9A'),
(11, '9B', '9', 'Kelas 9B'),
(12, '9C', '9', 'Kelas 9C'),
(13, '9D', '9', 'Kelas 9D'),
(14, '9E', '9', 'Kelas 9E'),
(15, '9F', '9', 'Kelas 9F');

-- --------------------------------------------------------

--
-- Table structure for table `mata_pelajaran`
--

CREATE TABLE `mata_pelajaran` (
  `id_mapel` int(11) NOT NULL,
  `kode_mapel` varchar(20) NOT NULL,
  `tingkat_kelas` int(11) NOT NULL,
  `nama_mapel` varchar(150) NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `mata_pelajaran`
--

INSERT INTO `mata_pelajaran` (`id_mapel`, `kode_mapel`, `tingkat_kelas`, `nama_mapel`) VALUES
(1, 'SDP7', 7, 'Seni dan Prakarya\r\n'),
(2, 'PAK7', 7, 'Pendidikan Anti Korupsi'),
(3, 'MTK7', 7, 'Matematika'),
(4, 'BHL7', 7, 'Bahasa Lampung'),
(10, 'PKN7', 7, 'Pendidikan Kewarganegaraan'),
(11, 'PAI7', 7, 'Pendidikan Agama Islam'),
(12, 'PAI8', 8, 'Pendidikan Agama Islam'),
(14, 'PAI9', 9, 'Pendidikan Agama Islam'),
(15, 'PKN8', 8, 'Pendidikan Kewarganegaraan'),
(16, 'PKN9', 9, 'Pendidikan Kewarganegaraan'),
(18, 'BID7', 7, 'Bahasa Indonesia'),
(22, 'BID9', 9, 'Bahasa Indonesia'),
(20, 'BID8', 8, 'Bahasa Indonesia'),
(25, 'BIG7', 7, 'Bahasa Inggris'),
(27, 'BIG8', 8, 'Bahasa Inggris'),
(28, 'BIG9', 9, 'Bahasa Inggris'),
(30, 'MTK8', 8, 'Matematika'),
(31, 'MTK9', 9, 'Matematika'),
(37, 'IPA9', 9, 'Ilmu Pengetahuan Alam'),
(35, 'IPA7', 7, 'Ilmu Pengetahuan Alam'),
(36, 'IPA8', 8, 'Ilmu Pengetahuan Alam'),
(39, 'IPS7', 7, 'Ilmu Pengetahuan Sosial'),
(40, 'IPS8', 8, 'Ilmu Pengetahuan Sosial'),
(43, 'IPS9', 9, 'Ilmu Pengetahuan Sosial'),
(51, 'PJS8', 8, 'Penjaskes'),
(45, 'SDB8', 8, 'Seni Budaya'),
(49, 'PJS7', 7, 'Penjaskes'),
(48, 'SDB9', 9, 'Seni Budaya'),
(53, 'PJS9', 9, 'Penjaskes'),
(55, 'SDP8', 8, 'Seni dan Prakarya'),
(56, 'SDP9', 9, 'Seni dan Prakarya'),
(57, 'BHL8', 8, 'Bahasa Lampung'),
(58, 'BHL9', 9, 'Bahasa Lampung'),
(59, 'IFK7', 7, 'Informatika'),
(60, 'IFK8', 8, 'Informatika'),
(61, 'IFK9', 9, 'Informatika'),
(62, 'PAK8', 8, 'Pendidikan Anti Korupsi'),
(63, 'PAK9', 9, 'Pendidikan Anti Korupsi'),
(64, 'BKL7', 7, 'Bimbingan Konseling'),
(65, 'BKL8', 8, 'Bimbingan Konseling'),
(66, 'BKL9', 9, 'Bimbingan Konseling');

-- --------------------------------------------------------

--
-- Table structure for table `modul`
--

CREATE TABLE `modul` (
  `id_modul` int(11) NOT NULL,
  `kode_mapel` varchar(10) NOT NULL,
  `nama_file` varchar(255) NOT NULL,
  `file_upload` text NOT NULL,
  `tanggal_upload` datetime NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `modul`
--

INSERT INTO `modul` (`id_modul`, `kode_mapel`, `nama_file`, `file_upload`, `tanggal_upload`) VALUES
(40, 'PAK7', 'Contoh Modul', '1703161348.pdf', '2023-12-21 19:22:28');

-- --------------------------------------------------------

--
-- Table structure for table `nilai`
--

CREATE TABLE `nilai` (
  `id_nilai` int(11) NOT NULL,
  `kode_mapel` varchar(20) NOT NULL,
  `nisn` varchar(30) NOT NULL,
  `ph1` float NOT NULL,
  `ph2` float NOT NULL,
  `uts` float NOT NULL,
  `uas` float NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `nilai`
--

INSERT INTO `nilai` (`id_nilai`, `kode_mapel`, `nisn`, `ph1`, `ph2`, `uts`, `uas`) VALUES
(21, 'BHL7', '0103913191', 100, 77, 90, 83),
(22, 'BHL7', '0113701227', 50, 90, 75, 50),
(23, 'PAK7', '0113701227', 50, 75, 75, 100),
(24, 'PKN7', '0113701227', 25, 75, 39, 89),
(25, 'PKN7', '0117277818', 100, 90, 75, 70),
(26, 'PKN7', '0117720870', 90, 75, 50, 77),
(27, 'PKN7', '3111236582', 50, 25, 50, 30),
(28, 'PKN7', '0113808006', 57, 77, 90, 89),
(29, 'MTK7', '0113395006', 50, 100, 25, 20);

-- --------------------------------------------------------

--
-- Table structure for table `siswa`
--

CREATE TABLE `siswa` (
  `id_siswa` int(11) NOT NULL,
  `nisn` varchar(30) NOT NULL,
  `password` varchar(255) NOT NULL,
  `nama` varchar(50) NOT NULL,
  `jenis_kelamin` varchar(20) NOT NULL,
  `tanggal_lahir` date NOT NULL,
  `tempat_lahir` varchar(30) NOT NULL,
  `agama` varchar(20) NOT NULL,
  `no_hp` varchar(15) NOT NULL,
  `email` varchar(30) NOT NULL,
  `alamat` text NOT NULL,
  `nama_wali` varchar(50) NOT NULL,
  `no_telepon_wali` varchar(15) NOT NULL,
  `angkatan` int(11) NOT NULL,
  `kode_kelas` varchar(5) NOT NULL,
  `foto` varchar(255) NOT NULL,
  `status_siswa` enum('Aktif','Tidak Aktif') NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `siswa`
--

INSERT INTO `siswa` (`id_siswa`, `nisn`, `password`, `nama`, `jenis_kelamin`, `tanggal_lahir`, `tempat_lahir`, `agama`, `no_hp`, `email`, `alamat`, `nama_wali`, `no_telepon_wali`, `angkatan`, `kode_kelas`, `foto`, `status_siswa`) VALUES
(10, '0107854807', '$2y$10$bKZntMx1O5n9oPNTGaS6E.zOw5RP9wMcW1Y3nI4mqi6./2xkoC.0S', 'Fattih Akbar Ramadhan', 'Laki-Laki', '2010-08-25', 'BandarÂ Lampung', 'Islam', '0895330771264', '-', 'Jl. Tangkuban Perahu No. 13/23 Lk. I, Kelurahan Kupang Kota, Kec. Teluk Betung Utara', 'Prio Hidayat', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(6, '0096373489', '$2y$10$DrC.nljXM3gQYuk4W1Dk.OxXNlBJ1Xwj6XEKw.8DLzYd0EKbKNPZ6', 'A. AFRIYANDI FATAHILLAH', 'Laki-Laki', '2009-04-17', 'TELUK BETUNG', 'Islam', '0895601769700', '-', 'JL.RW.MONGINSIDI Gg.ARSAD LK.III, Keluarahan Talang, Kec. Teluk Betung Selatan', 'ABDUL ROSYID', '-', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(11, '0095312364', '$2y$10$c6Q6vrtd3ThMiFBlvuxfPelVSAYVHj60c/nLqg2we63ggIhraxZ8m', 'FAUZAN DWI ANDIKA', 'Laki-Laki', '2009-10-01', 'Bandar Lampung', 'Islam', '08994104455', '-', 'JL. WR. SUPRATMAN GG. PEGADAIAN LK II, Kelurahan KUPANG KOTA, Kec. Teluk Betung Utara', 'DEDI', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(12, '0087919165', '$2y$10$tIA7kPdIaNODJlhvj5pwJOAmFhrTgQEnQDaLgleAYhA/bPy0YCmnC', 'FAUZI BAADILLAH', 'Laki-Laki', '2008-12-08', 'KOTA AGUNG', 'Islam', '089629886748', '', 'JL.YOS SUDARSO GG KENARI II LK II, Kelurahan SUKARAJA, Kec. Teluk Betung Selatan', 'SUROTO', '', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(13, '3124823117', '$2y$10$9xMhBt.dC3G1Ab5OCy4Svu.aWEfI.Wj2Lwf.EI.jZEAQMkgJ6w17K', 'FEBRILIYA', 'Perempuan', '2012-02-25', 'Bandar Lampung', 'Islam', '081369190351', '-', 'Jl. Hasanudin Gg Nangka No 12, Desa/Kel. Kupang Teba, Kec. Teluk Betung Utara', 'Hendrik', '-', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(14, '0098682897', '$2y$10$Hlng/p.uCMS.fG26pisRIec1k5wtSND8Zaj6YXVW3bqYdPl5RgTYi', 'FEBYOLLA GEISYLLA MAHARANI', 'Perempuan', '2009-02-28', 'Teluk Betung', 'Islam', '081541395126', '-', 'Jl. Slamet Riyadi IV, Gg. Dahlia, Kelurahan Pecoh Raya, Kec. Teluk Betung Selatan', 'PUNGUT KUSUMA', '-', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(15, '0098612709', '$2y$10$83wAvUt6wbtzdDcLDrYGYuUvzycWrIZ/.TldX5XRf6u81taQDTS5G', 'Ferdian Putranto', 'Laki-Laki', '2009-08-17', 'Bandar Lampung', 'Islam', '083170372687', '-', 'Jl. Gn. Krakatau No. 30 Lk. 1, Kelurahan Kupang Kota, Kec. Teluk Betung Utara', 'Triyanto', '-', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(16, '3111235638', '$2y$10$DNEBYB3bV5JXaEG.s4Ra.OIzfgqY2Em.xByF6dlENh0KPtb0gkrLO', 'Ferly Sundava', 'Laki-Laki', '2011-09-08', 'BandarÂ Lampung', 'Islam', '082181070413', '-', 'Jl. Drs. Warsito Gg. Rajabasa 2 Lk. I, Kelurahan Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'FATONI', '-', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(17, '0095500187', '$2y$10$oXw9iCvh.ilp4Mi1uITQxO.w24bWTD6njia1orW9enpQaD0ur3wvK', 'Fira Ayu Ningtias', 'Perempuan', '2009-12-15', 'Bandar Lampung', 'Islam', '089517076310', '-', 'Jl. Gn Agung LK 1, Kupang Kota, Kec. Teluk Betung Utara', 'HOADARI', '-', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(18, '0092210010', '$2y$10$TO297Rhpop6x6L.YYker4eHvi3g54zOiEHF17pV0v/MvT2HHCXJE.', 'FITRIA RAMADANI', 'Perempuan', '2009-09-20', 'TELUK BETUNG', 'Islam', '-', '-', 'JL. M. AGUS LK I, Kelurahan BUMI WARAS, Kec. Bumi Waras', 'ROHIYAT', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(19, '0094674054', '$2y$10$8ryYicPwLHFp/DbySzI1Ae5SjFoURwnCvjK1IJa3vWBTwidXizWp.', 'Gali Raka Siwi', 'Laki-Laki', '2009-08-06', 'Teluk Betung', 'Islam', '085764215938', '-', 'Jl. Gn. Krakatau Lk. 1, Kelurahan Kupang Kota, Kec. Teluk Betung Utara', 'Husen', '-', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(20, '0117803929', '$2y$10$crVJ11gDYZM3FCirLs11m.edWzBwS1qggdHSWM1PS8BBAG.AN4VOm', 'GARNIS', 'Perempuan', '2011-06-16', 'TELUK BETUNG', 'Islam', '085789410991', '-', 'JL. WR MONGONSIDI N0.72 LK II, Kelurahan Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'RIDWAN', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(21, '0116568330', '$2y$10$hDJzIvGWbGiPGjh2lvSFx.OtikQ.AHqqwruY8t/ca0cYq8Rp8VQAe', 'GHANDI PRADANA PUTRA', 'Laki-Laki', '2011-03-08', 'BandarÂ Lampung', 'Islam', '0895385245060', '-', 'JL. WR. SUPRATMAN GG PEGADAIAN NO. 23 LK II, Kelurahan Desa/Kel. Kupang Kota, Kec. Teluk Betung Utar', 'DEDE ISWANDI', '-', 2022, '7C', 'default-profile-picture.jpg', 'Aktif'),
(22, '0094861667', '$2y$10$Uh7YUy1DGzKr7LkIt0RFYelWeb472AHUSIrZrzAAqyQFWlvW7odEa', 'Gilang Pratama', 'Laki-Laki', '2009-08-19', 'BandarÂ Lampung', 'Islam', '083160788985', '-', 'Jl. Drs. Warsito Gg. Semeru Lk. II, Kelurahan Kupang Kota, Kec. Teluk Betung Utara', 'Supandi', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(23, '0095756046', '$2y$10$hi9IYv9ndlK9zeWuB16n4OROfqSnyMivIH7X6rxV8EeXkyrG/QBZm', 'Gita Aqmalia', 'Perempuan', '2009-11-01', 'Teluk Betung', 'Islam', '089523115655', '-', 'WR. Monginsidi Gg Aslim No 17 Lk II, Kelurahan Talang, Kec. Teluk Betung Selatan', 'Marjoko', '-', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(24, '0117766681', '$2y$10$RPa8sPm/K53cO64tz4geZ.p9QUCsBLT/Qc43fl.snZoB9O8RKQ/kW', 'GRACETASYA KHUMAIROH PARIZQY', 'Perempuan', '2011-04-30', 'Bandar Lampung', 'Islam', '082372177036', '-', 'JL.IKAN KITER 26 LK.II, Kelurahan Desa/Kel. Kangkung, Kec. Bumi Waras', 'TAMZONI HIDAYAT', '-', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(25, '0092750833', '$2y$10$E7eyj6TzXRyZ2yECAEn3c.VYeuLSQtWszli1LPnzAt9NGUiSsQvHa', 'HAFIDZ AL RASYA', 'Laki-Laki', '2009-10-24', 'Bandar Lampung', 'Islam', '085709720650', '-', 'TELUK BONE NO 81 LK II, Kelurahan KOTAKARANG, Kec. Teluk Betung Timur', 'A. FIRMANSYAH', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(26, '0108257536', '$2y$10$lcVoiDFBsyyY/QDSfDifwOuT4t17gOISVHdP0TfPET3j5C22FXgEm', 'Hafirah Nindah Destiani', 'Perempuan', '2010-12-29', 'Bandar Lampung', 'Islam', '089633482670', '-', 'Jl. DRS. Warsito Gg Tanggamus, Kelurahan Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'Zefri Romansyah', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(27, '0097466927', '$2y$10$QHv5GrrQwy1zqxrYom9SXOQIFFrcu2ZZitwPivUxUCmBe0iFU/b/W', 'Hanni Salsabila', 'Perempuan', '2009-04-03', 'Bandar Lampung', 'Islam', '081271988751', '-', 'Wolter Monginsidi No 11, Kelurahan Talang, Kec. Teluk Betung Selatan', 'Hartoni', '-', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(28, '0083211912', '$2y$10$kcZx/l8ExbH/2FmAfyuFJ.DxOwFIW8hZqS5VMrHkarn92TZicZ80.', 'HARDIAN SAPUTRA', 'Laki-Laki', '2009-10-13', 'Bandar Lampung', 'Islam', '0895327318080', '-', 'JL. YOSSUDARSO GG M.AGUS, Kelurahan Desa/Kel. Bumiwaras, Kec. Bumi Waras', 'SOFIANTO', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(29, '0118069791', '$2y$10$KqHTI7uffqTphU37SNC6ceO16b3y3j.0XuigFGdzKyqpiO10ZtguG', 'Harfkhan Ridho Riski', 'Laki-Laki', '2011-01-23', 'Teluk Betung', 'Islam', '089673184132', '-', 'Jl. WR. Supratman Gg. R. Danial LK. I, Kelurahan Gunung Mas, Kec. Teluk Betung Selatan', 'Bambang Irawan', '-', 2021, '8E', 'default-profile-picture.jpg', 'Aktif'),
(30, '0105541468', '$2y$10$rrwxWeT2tFP2v/5VfRU8kuGLP70C1m.rc10T9B8VtSr7.N5vsZY4u', 'Hazmi Hardiansyah', 'Laki-Laki', '2010-04-03', 'BandarÂ Lampung', 'Islam', '001917535907', '-', 'Jl. Hasanuddin Gg Nangka No. 19, Kelurahan Desa/Kel. Kupang Teba, Kec. Teluk Betung Utara', 'Oci Andriansyah', '-', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(31, '0106105497', '$2y$10$gsOh5oh3M5nrd5C4PvTtjOLszfZ468SqtcQgQ/Oiugdji9tP05oW2', 'Ibnu Safwa Andrean', 'Laki-Laki', '2010-12-14', 'Teluk Betung', 'Islam', '08136783929', '-', 'JL. IKAN JULUNG SKIP RAHAYU LK I, Kelurahan Desa/Kel. Bumiwaras, Kec. Bumi Waras', 'Safari', '-', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(32, '0097009709', '$2y$10$h/7oo78NXujjBqhhwubj6O41K7X4n2Db/2lJmko3MBAWU.hU5m6Lq', 'Iin Pratiwi', 'Perempuan', '2009-07-06', 'Bandar Lampung', 'Islam', '085730118617', '-', 'Jl. Tangkuban Perahu No. 29 Lk. I, Kelurahan Kupang Kota, Kec. Teluk Betung Utara', 'Anduk Prabowo', '-', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(33, '0106767253', '$2y$10$Pimq9LoQebFMmwYjIaxpE.Tj2AMxHhPJzflMti9fHzgn2yeYCMtDa', 'ILYAS ALVIN RAZKA ADITYA', 'Laki-Laki', '2010-10-09', 'SEPUTIH JAYA', 'Islam', '085222411390', '-', 'JL. TANGKUBAN PERAHU GG. MUKTI NO 23, Kelurahan Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'ADITYA SANTOSO', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(34, '0092209210', '$2y$10$8sg.t6CTUBC3amOBvcMUuenrjQN63MIn0sqQxTzD6tbJ8kbyRkG.G', 'INDRATA ALFARIZY', 'Laki-Laki', '2009-05-08', 'Bandar Lampung', 'Islam', '085369635388', '-', 'JL. PATIMURA, Kelurahan KUPANG KOTA, Kec. Teluk Betung Utara', 'SASMITA', '-', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(35, '0107901447', '$2y$10$rYzgZu4DF9p4sxw3Qne50OOR6/5UwZi871O7gQGTRh6yP.2bSfieS', 'Intan Manila Sari', 'Perempuan', '2010-02-07', 'Teluk Betung', 'Islam', '0895392416620', '-', 'Jl. Patimura LK II, Kelurahan Gunung Mas, Kec. Teluk Betung Selatan', 'Muhamad Sani', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(36, '0093898357', '$2y$10$SoZshx82/fnSSM1XBlQEOu1w9g4amD4.3J8zq1AE6FgunFaFaZgFO', 'INTAN SISILIA', 'Perempuan', '2009-10-23', 'TELUK BETUNG', 'Islam', '089630566536', '-', 'JL. IKAN MAS, Kelurahan KANGKUNG, Kec. Bumi Waras', 'AZWIN', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(37, '0084440666', '$2y$10$YBdTydDghU4Eb.IzvbQdCOIpOGr5KfOB61u2aNuP.K6MXnkAUv0aq', 'Iqbal Tirtana', 'Laki-Laki', '2008-07-31', 'Teluk Betung', 'Islam', '-', '-', 'Jln Ikan Julung, Kelurahan skip rahayu, Kec. Bumi Waras', 'Endang Tirtana', '-', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(38, '0103279197', '$2y$10$i8ck9F.QRgUTDQI9m9KYJuQeJXgjLoWLxIifnknwVKw0u5cg7qBJi', 'Irhab Kadavi', 'Laki-Laki', '2010-05-14', 'BandarÂ Lampung', 'Islam', '089601572824', '-', 'Jl. Hasanudin Gg. Kntr. Pos 16 LK II, Kelurahan Gunung Mas, Kec. Teluk Betung Selatan', 'Novi Widiyanto', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(39, '0105207033', '$2y$10$wa9FmNNepZ6kyKOIpSJfVO6IQvLyexOHc8W7xxmqY.cjoXsB7dyxW', 'ISTI ANATUL MA\'RAH', 'Perempuan', '2010-10-04', 'BandarÂ Lampung', 'Islam', '085382900613', '-', 'JL. DRS. WARSITO GG KRAKATAU NO.25 LK I, Kelurahan Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'CATUR WIDODO', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(40, '0107220944', '$2y$10$IFWqtpr3rCKRIa8KAru8KO.92DELoUVJbl870xMgx.OBrzt.2Sfum', 'JAFAR SODIQ', 'Laki-Laki', '2010-05-25', 'BandarÂ Lampung', 'Islam', '083153597831', '-', 'GUNUNG MASTUR LK 2, Kelurahan PERWATA, Kec. Teluk Betung Timur', 'JUPRI', '-', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(41, '0109125919', '$2y$10$Iv33WpE7gp7pE0wu1B6XdejTPEAodFRR9nKvtswCtkQ9dU2EdLyH.', 'JANNES TRIGO MANURUNG', 'Laki-Laki', '2010-08-06', 'PangkalÂ Pinang', 'Islam', '08983166450', '-', 'JL. YOS SUDARSO GG. KETAPANG LK I, Kelurahan SUKARAJA, Kec. Bumi Waras', 'RIDWAN MANURUNG', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(42, '3102491700', '$2y$10$LTmPXbAj9WZG8h8r9e3iY.8orpMD9AMfcVwwbYrAliMu431pC7HN2', 'Jella Africhal', 'Laki-Laki', '2010-08-04', 'Tulang Bawang', 'Islam', '081272771641', '-', 'Jl. Drs. Warsito Gg. Rajabasa No. 04 Lk. I, Kelurahan Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'Jepri', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(43, '0092286745', '$2y$10$W/QfrYAN03TS7wR51AdaCu1laxIx4OI6p0vcQUfmP08Qu1w97Ws/i', 'Jhon Armando', 'Laki-Laki', '2009-05-28', 'Teluk Betung', 'Islam', '085769854278', '-', 'Jl. Beringin Raya Gg. Koplak Lk II, Kelurahan Talang, Kec. Teluk Betung Selatan', 'Bastian Afriansyah', '-', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(44, '0103080188', '$2y$10$Le731t7e1OoZgTlhz7Lst.UExU1HLw6BrBG0gjzghSf/nF0lkr4MW', 'NIKO PRATAMA WIBOWO', 'Laki-Laki', '2010-10-08', 'TELUK BETUNG', 'Islam', '08988192743', '-', 'Jl. MS. BATUBARA Gg. PLAM NO. 5 LK II, Desa/Kel. Kupang Teba, Desa/Kel. Kupang Teba', 'EKO EDI WIBOWO', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(45, '3094011395', '$2y$10$qwA.bmoZOea2Xv9chqmWZec6aqHWiBJrvQ9wRU3x..Xg7CaAL.C8a', 'NISRINA NADHIFA AZMI', 'Perempuan', '2009-03-08', 'Kotabumi', 'Islam', '-', '-', 'JL. IKAN MAS GG MANAN, Kangkung, Kec. Bumi Waras', 'Danu Asmoro Widagdo', '-', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(46, '0107612113', '$2y$10$PQP7spEl4nBJIZxmUKNcpuWw0sYcWRhlfQPyDAEZm2my9scV3CCNu', 'Normala', 'Perempuan', '2010-04-11', 'Teluk Betung', 'Islam', '085709296484', '-', 'Jl. Drs. Warsito Gg. Tanggamus, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara ', 'Pausi Sanusi', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(47, '0107519264', '$2y$10$mowuxYBHQ4Kn1BYSkCry..VB9RSCDI3ZnPpskqp9ufNIzjC9mTDkC', 'Novilia Putri', 'Perempuan', '2010-11-27', 'BandarÂ Lampung', 'Islam', '089630464328', '-', 'Jl. Gn. Krakatau No. 5 Lk. I, Desa/Kel. K, Kec. Teluk Betung Utaraupang Kota, ', 'Elyanto', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(48, '0096480097', '$2y$10$m6s6/Abn.EYaWf8xBgU4nuGfeJ0rRHghMuiQheWxN8hbyCyFxCe0i', 'Nur Anggraeni', 'Laki-Laki', '2009-02-13', 'teluk betung', 'Islam', '08536672520', '-', 'jl. ikan pari no 27, teluk betung, Kec. Teluk Betung Selatan', 'ahmad muhta', '-', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(49, '0097436936', '$2y$10$zalprK5qIzPYlaNqf1TQMefXPA0VMRikEJpkNej.C2UWXP8OueCey', 'Nur Saidah', 'Perempuan', '2009-11-07', 'teluk betung', 'Islam', '089634188813', '-', 'Jl. Hasanudin Gg. kantor pos lk.II, gunung mas, Kec. Teluk Betung Utara', 'M. Sueb', '-', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(50, '0097271790', '$2y$10$QJMkLZqXL7FZzvAxoBnrDu75UF./NSIStPxfJAE570xoj52qW1PcG', 'NUR WAHID RAMADHAN', 'Laki-Laki', '2009-08-29', 'TELUK BETUNG', 'Islam', '087899757207', '-', 'JL. YOS SUDARSO GG. CENDANA, BUMI WARAS, Kec. Bumi Waras', 'SUYAMTO', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(51, '0092109314', '$2y$10$rexCdi.W4NyXfWDVZeibjevlr3EB.GehYQBmUAEAjO4R/TkxHogEm', 'Nuri Dwi Indah Pertiwi', 'Laki-Laki', '2009-06-13', 'teluk betung', 'Islam', '0895320580705', '-', 'jl. ikan pari gg. chandra lama no.152/17 A, teluk betung, Kec. Teluk Betung Selatan', 'ahmad hidayat', '-', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(52, '0094596859', '$2y$10$JlcJstBaLBPB.AZXQ.6xeemTd1nBAGtlFjL9ceIFM0BHT3S1wsism', 'Nurlita Khasanah', 'Laki-Laki', '2009-08-03', 'teluk betung', 'Islam', '083168996655', '-', 'jl. hasanudin no.34/164 lk.I, teluk betung, Kec. Teluk Betung Selatan ', 'Surip', '-', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(53, '0107635114', '$2y$10$VvA8LBkiwhFwqcJWMSluKeMJJGpBAvu3BIPco/KygKOPg7U9OwMWe', 'Nurul Tri Utami', 'Perempuan', '2010-12-25', 'Teluk Betung', 'Islam', '-', '-', 'ikan julung, skip rahayu, Kec. Bumi Waras', 'Kastomo', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(54, '0104875474', '$2y$10$jMHBp28SsNoqO2U9/499yO6Bt.OAosPP5jp8DlQhJljcmfFyMWstS', 'OKSA KRESNANTARA', 'Laki-Laki', '2010-10-28', 'Teluk Betung', 'Islam', '-', '-', 'JALAN WR. MONGISIDI GG PERMAI NO 2 LK 2, Talang, Kec. Teluk Betung Selatan ', 'Yudi Hartono', '-', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(55, '0098077678', '$2y$10$N4I0tTjNwQNigm03hv2vlOzp48AIYSBCwCfGbx9EzUpqd3RYrDm5C', 'Paramita Saputri', 'Perempuan', '2009-07-30', 'BandarÂ Lampung', 'Islam', '085368941474', '-', 'Jl. Drs. Warsito Gg. Tanggamus Lk. II, Kupang Kota, Kec. Teluk Betung Utara', 'Ahmad', '-', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(56, '0099524114', '$2y$10$Aewo4VlzLzjbZ/qrdM3VEeETdP3jh7dPBmtVULgpkD47tfm2sByDK', 'PASKAH HAMONANGAN', 'Laki-Laki', '2009-04-10', 'PangkalÂ Pinang', 'Islam', '085368941474', '-', 'Jl.Yos Sudarso Gg.Taslim Ketapang, Sukaraja, Kec. Bumi Waras', 'RIDUAN MANURUNG', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(57, '3108599573', '$2y$10$KZTf7mwut5gg.7JhXqWrLesDw1G7oUiMtdSfgky.VU1MR49hyfvau', 'PRIMA RAMADHAN TRIDA', 'Laki-Laki', '2010-08-26', 'Teluk Betung', 'Islam', '089532213703', '-', 'Jl Hasanudin Gg, Nangka no.05 Lk.I, Kupang Teba, Kec. Teluk Betung Utara	', 'MUHAMMAD SUMANTRI', '-', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(58, '0104738705', '$2y$10$ZjYyRwYzBvJGe/wIFm3dguG.YAv76H.VjcNW9jJv.juA4TP1nTeZq', 'PUSPITA NINGSIH', 'Laki-Laki', '2010-01-02', 'JATIMULYO', 'Islam', '082181528635', '-', 'Jl Slamet Riyadi Gg. Ikan Cupang I Lk II, Desa/Kel. Sukaraja, Kec. Bumi Waras', 'Wahyudi', '-', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(59, '0112033528', '$2y$10$3mZVQeaVrHubs0.oo/hiR.HivD6ESby9y5ApuHSRCRFsl79HV.W2C', 'Putri Aprilia', 'Perempuan', '2011-04-02', 'Teluk Betung', 'Islam', '-', '-', 'Jl. Drs. Warsito Gg. Tanggamus Lk. II, Kupang Kota, Kec. Teluk Betung Utara', 'Roni Saputra', '-', 2022, '7B', 'default-profile-picture.jpg', 'Aktif'),
(60, '0096537218', '$2y$10$bXPOtI7dGXZvW.FpNBC5ke3keZSMnHEjz5K/86bPOE8YFg.6w4Ppu', 'Putri Febryka', 'Perempuan', '2009-02-26', 'BandarÂ Lampung', 'Islam', '089632734050', '-', 'Hasanudin Gg. Kantor Pos No.16 LK.II, Gunung Mas, Kec. Teluk Betung Selatan	', 'Eddy Tahir', '-', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(61, '0079400288', '$2y$10$EF1lSu5.EMUMT7ci/qwlWeFu3xR4zlVeenv7cBONnLxj9L0NH8Tri', 'Putri Permata Sari', 'Perempuan', '2007-06-20', 'Teluk Betung', 'Islam', '085268057988', '-', 'jl. hasannudin no. 33 gg. kantos pos, Desa/Kel. GUNUNG MAS, Kec. Teluk Betung Selatan	', 'Suharjo', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(62, '0093425519', '$2y$10$AnoqkYmd2P4Q3kST8BWRl.SS5FpoOB24gJFgHkXz/0Vb1Ye5pNV4q', 'PUTRI SAHRINI', 'Perempuan', '2011-02-12', 'BandarÂ Lampung', 'Islam', '0895639966080', '-', 'JL. RW MONGINSIDI GG ARSAD NO 34 LK II, Talang, Kec. Teluk Betung Selatan	', 'JUNAIDI', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(63, '0105718054', '$2y$10$FEiXY/9kU3/PF5udkaJT2enhvw3CP9xDje6J1XoqZjK3QIBX9m5/y', 'PUTRI VIANTI MALA', 'Perempuan', '2010-01-26', 'BandarÂ Lampung', 'Islam', '083169184388', '-', 'JL. GUNUNG KRAKATAU NO. 7 LK II, TALANG, Kec. Teluk Betung Selatan	', 'SUPRIATNA', '-', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(64, '0093299293', '$2y$10$32cNSCQ5Fh/mQWhHfeEcQ.utb1cPwWox6axMeTS3XLphCZsYzPGiq', 'Putri Zalfa Maliha', 'Laki-Laki', '2009-02-19', 'BandarÂ Lampung', 'Islam', '087877657334', '-', 'MS. Batubara No. 36, Kupang Teba, Kec. Teluk Betung Utara	', 'Ahmad Saihu', '-', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(65, '0099112258', '$2y$10$rga5WQ7vfWjSeHtBev3MOOKInoQThGk0U1/T9AqOTTxwiTBRFrf/q', 'Putri Zevani Al\\\'cyidla', 'Perempuan', '2009-07-28', 'BandarÂ Lampung', 'Islam', '0895621633149', '-', 'Jl. Hasanuddin Gg. Kantor Pos, Gunung Mas, Kec. Teluk Betung Selatan	', 'Zepri', '-', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(66, '0111586354', '$2y$10$PTEPJwum86/zSUsL3Oq1Ae7ml/v73yvr8xuBDFLz4RxaL.qj9rxvG', 'QEYNISHA RAYHANUN', 'Perempuan', '2011-02-11', 'BandarÂ Lampung', 'Islam', '089508044106', '-', 'JL. Ikan Layur NO. 8 Blok B, Teluk Betung, Kec. Teluk Betung Selatan	', 'ASEP AMRULLAH', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(67, '0104810496', '$2y$10$vh6391DNgL2H.qUjAWHvZOCOkFh/2PCwt.zQCjV89DEOcmfEsZrni', 'R. Ajeng Sharifa Sukma Wicitra', 'Perempuan', '2010-03-01', 'Teluk Betung', 'Islam', '0895620466364', '-', 'Jl. Drs. Warsito No. 24 Lk. II, Kupang Kota, Kec. Teluk Betung Utara	', 'Danu Sasmita', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(68, '0085120318', '$2y$10$dI2Ucv99khfC19JAiJqdauRUBfdzJbZfGvX4EYFh75uDGMWGLFuy2', 'Raditya Danti Saputra', 'Laki-Laki', '2008-04-18', 'Teluk Betung', 'Islam', '089603820199', '-', 'Jl.Abdi Negara Beringin Bawah, Gulak Galik, Kec. Teluk Betung Utara	', 'Das\\\'ad', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(69, '0118913842', '$2y$10$4SEPMM8RtvKVhEk8wO5RYOyZRJJ7txPqlhqI4ZD1QYBl8aBusM0BK', 'Raditya Ramadhan', 'Laki-Laki', '2011-05-18', 'Teluk Betung', 'Islam', '081320099837', '-', 'Jl. T. PERAHU NO.32 LK II, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara	', 'Erwan Hikmat', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(70, '0098779943', '$2y$10$cJ0YJTqJZ3sAorBxiHAGneaNRRCXSAkQ.mgXBRmqtzQC1.bY/AOze', 'RADO MAULANA', 'Laki-Laki', '2009-05-02', 'Teluk Betung', 'Islam', '-', '-', 'JL. IKAN KITER GG. HIU 2 LK II, Kangkung, Kec. Bumi Waras', 'Arohman', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(71, '3113958342', '$2y$10$tg3TexvY1SxYi.rDePRSKuu4qS3qyRjkDs2meK2ltCktaCwpaHEfq', 'RAEHAN HABIB', 'Laki-Laki', '2011-09-19', 'BandarÂ Lampung', 'Islam', '0895609808808', '-', 'JL RW MONGONSIDI GG PERMAI 3 LK II, Desa/Kel. Talang, Kec. Teluk Betung Selatan	', 'ARIFUDIN', '-', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(72, '0085456340', '$2y$10$VAwGvVoUCFpV7cR3OGDHGe6Hhvpby8ur95rlxQ8mhZAZxcNwvuNBS', 'RAFA ANDHIKA PRATAMA', 'Laki-Laki', '2008-04-10', 'TELUK BETUNG', 'Islam', '-', '-', 'JL. YOS SUDARSO Gg M. AGUS LK I, BUMI WARAS, Kec. Bumi Waras', 'RIDWAN', '-', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(73, '0112346755', '$2y$10$Tf8LiN/VmLulnNKgi8xJJ.RfKibCTvAIifBcDLcSw1aFi7SlAvUzy', 'RAFA ANDIKA', 'Laki-Laki', '2011-05-12', 'TANGERANG', 'Islam', '082246219475', '-', 'Jl. Tangkuban Perahu No. 18 LK I, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara	', 'WIRA HADI KUSUMA', '-', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(74, '0098318419', '$2y$10$lCeyLgD4Z1Mxqx7FknZ6keX0XvpFpcLs9AKaImXtmwY0vgpUH23kO', 'RAFFA ERNANDA PRATAMA', 'Laki-Laki', '2009-10-14', 'TELUK BETUNG', 'Islam', '082289699187', '-', 'JL. WR. MONGOSIDI GG WILIS NO 2, KUPANG KOTA, Kec. Teluk Betung Utara	', 'EDI WAHYUDI SAPUTRO', '-', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(75, '0108740332', '$2y$10$itII5fdJQFRD0DW/vv8KEObV85lrK7t8c2ve0Uhx32NtVW3HZlZlu', 'Rafi Ramadan', 'Laki-Laki', '2010-09-04', 'Teluk Betung', 'Islam', '081273270505', '-', 'Jl. Tangkuban Perahu Gg. Mukti NO.9 Lk. II, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara	', 'Joko Lelono', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(76, '0094808983', '$2y$10$pWAKPy4G9mwQTtktqJJAdOCCRi6aIZbbqEPNeVqma.rcl0uKoNkhe', 'Rafif Fadil Saputra', 'Laki-Laki', '2009-11-17', 'BandarÂ Lampung', 'Islam', '081373433413', '-', 'Hasanudin Gg. Kantor Pos 23, Gunung Mas, Kec. Teluk Betung Utara	', 'Basuki Sanyoto Putro', '-', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(77, '0101253966', '$2y$10$Rm9orem3/Zv/giZHkkE96eL5prT1HuozZyd2mdvj75QJPw9NEQ8Ii', 'RAFLI NUR HIDAYAT', 'Laki-Laki', '2010-09-28', 'BandarÂ Lampung', 'Islam', '085700283823', '-', 'JL. MAYOR SALIM BATUBARA GG. DAHLIA	KUPANG KOTA, Kec. Teluk Betung Utara	', 'WALUYO', '-', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(78, '0118883806', '$2y$10$B.jTqa5SpQi0DX2A4dZfxOLqZz0jOvXam5PkGS.qLBdx0ifrBudaa', 'Rahes Dwi Andika', 'Laki-Laki', '2011-07-23', 'BandarÂ Lampung', 'Islam', '0895320461004', '-', 'JL HASANUDIN GG LAMPHONG LK II, Desa/Kel. GUNUNG MAS, Kec. Teluk Betung Selatan	       ', 'Anto', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(79, '0085091370', '$2y$10$tl/174RCuU/CjDBz4y92g.vWGgG478rHRe8Uun6HumNZso7EjmrWu', 'RAHMA NOVIA LESTARI', 'Perempuan', '2008-11-24', 'BandarÂ Lampung', 'Islam', '0895806145060', '-', 'WADAS, WADAS, Kec. Teluk Jambe Timur	', 'ROBET', '-', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(80, '0116053851', '$2y$10$zOWcyYXwmtdtLJGPWkxMxun1SHry7/uME/44KWUU2kS32BXGj3vye', 'RAMA ADRIANSYAH', 'Laki-Laki', '2011-04-23', 'TELUK BETUNG', 'Islam', '089617600990', '-', 'JL IKAN KITER LK II BLOK D, Desa/Kel. Kangkung, Kec. Bumi Waras	', 'RUDI JAYA PUTRA', '-', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(81, '0082510328', '$2y$10$p47lUfW7A/gc7YQbF2AHOO37x9ilbFQdlP5eRFDaMtAe.irZDiJzC', 'Randu Raja Mahesta', 'Laki-Laki', '2008-07-16', 'Teluk Betung', 'Islam', '089630653212', '-', 'Pusri Baru, Sumurbatu, Kec. Teluk Betung Utara	', 'M.Thabrani', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(82, '0111421909', '$2y$10$EIVy8LjKW5gwgLTpauzhh.Ge1r49huM.9PEIHmR8sKGcAqLTmSUFW', 'Rangga Dito', 'Laki-Laki', '2011-05-15', 'Teluk Betung', 'Islam', '089507980283', '-', 'Jl. Rw. Monginsidi Gg. Wilis No. 16, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara	', 'Eko Domowilopo', '-', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(83, '0095361959', '$2y$10$2me2s44I5c./KDHw1r.ECuftREU.mEIdjbuIadv/H6VhUxLaDuQtS', 'Rani Gusnelita Sari', 'Perempuan', '2009-07-10', 'Teluk Betung', 'Islam', '089604092444', '-', 'Drs. Warsito GG. Tanggamus/28 Lk. II, Kupang Kota, Kec. Teluk Betung Utara	', 'Agus Bakri', '-', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(84, '0114174740', '$2y$10$7Z4xcU40vHJ6hz6.t5SOe.1SZqRVhslNCl9LxdMbVBM2CTEGWUzey', 'RASTI ADITIA PUTRI', 'Perempuan', '2011-10-25', 'Teluk Betung', 'Islam', '085763309885', '-', 'Jl. Gunung Krakatau NO.20, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara	', 'M. Suryana', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(85, '0113808006', '$2y$10$UlbxHsmKZMpdzzrARmX/beJ7Y.5BS2nt2U0bftrqVkCAR5v.nQ3Ie', 'RATU BALQIS MAHARDIKA SALSABILA', 'Perempuan', '2011-01-08', 'BandarÂ Lampung', 'Islam', '081271864114', '-', 'JL. Hasanudin Gg. K.Pos NO.2 LK II, Desa/Kel. GUNUNG MAS, Kec. Teluk Betung Selatan	', 'YANDIKA SAPUTRA', '-', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(86, '0093577570', '$2y$10$tPByVmA0.Y9bm1wYkN.giuegYm3KX2E9a8hSqNOPdXU.2wL3eKGiO', 'Ratyo Mitra Abadi', 'Laki-Laki', '2009-09-30', 'Pringsewu', 'Islam', '083168410882', '-', 'jl. ikan gurita no.14 lk.I, kangkung, Kec. Bumi Waras	', 'Desta Abadi', '-', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(87, '0099956691', '$2y$10$SXFpHsv.tQWM/zhR/Le2c.CTjowqL6cLRutUjnkUVGePkl1pdfvli', 'Rayhan Erik Maulana', 'Laki-Laki', '2009-04-08', 'BandarÂ Lampung', 'Islam', '085384836555', '-', 'Hasanudin Gg. Nangka No.10, Kupang Teba, Kec. Teluk Betung Utara	', 'Asep Pransitia', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(88, '0098238783', '$2y$10$SRGVEHVYLuWEF3i1ICzQ4OV7DJEjy0oslZ1/LuaVr4y3OoPkX.3H6', 'Recky Aditya Sutomo', 'Laki-Laki', '2009-08-22', 'Teluk betung', 'Islam', '089669232700', '-', 'JL. Patimura Gg. agung / 35 Lk.II, kupang kota, Kec. Teluk Betung Utara	', 'Agus Sutomo', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(89, '3116393065', '$2y$10$RuMBDWjlIfoQiMXS9V9jGe7uDm7DzKzjRM3PYzxeXBilcc7OWq9PC', 'REGINA RAHMADANTI', 'Perempuan', '2011-08-07', 'BandarÂ Lampung', 'Islam', '085266554795', '-', 'JL GUNUNG KRAKATAU NO.17A LK II, Desa/Kel. Talang, Kec. Teluk Betung Selatan	', 'SUGITO', '-', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(90, '0088801403', '$2y$10$ZuoGdntob7pW4RzMFmARk.uSkHWCF.ZKBCUaN0ZEA32o6ZPi/WBXm', 'REIHAN SAEPUTRA', 'Laki-Laki', '2008-11-30', 'BandarÂ Lampung', 'Islam', '083140407406', '-', 'JL. PATTIMURA GG. GUNTUR NO. 22, KUPANG KOTA, Kec. Teluk Betung Utara	', '083140407406', '-', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(91, '0094621180', '$2y$10$5/p4rVpY1IeheUs6dh2pu.Z5i1L/iaFDlMqMIWzNounRn46OuwBym', 'Reva Febiola', 'Perempuan', '2009-08-08', 'teluk betung', 'Islam', '089631062546', '-', 'jl. wr. supratman gg. r. danial no.15 lk.I, gunung mas, Kec. Teluk Betung Selatan	', 'suprapto', '-', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(92, '3095699789', '$2y$10$ZOCTX2R1QOOvaEKpy2t52uh94a93tPh0XImHQ05IWIk.d84umBDRm', 'REVA OKTAVIONA', 'Perempuan', '2009-10-07', 'Teluk Betung', 'Islam', '087878872000', '-', 'Jl. Gunung Krakatau No.76, Kupang Kota, Kec. Teluk Betung Utara	', 'ARI IRAWAN', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(93, '0108303036', '$2y$10$PXtQCs/H4XghEMnhjns1aexjvI7nIGEIQgeRjvPaXgyH.oNxVCFXy', 'REVALINA PUTRI FEBRIYANI', 'Perempuan', '2010-02-11', 'TELUK BETUNG', 'Islam', '083105093331', '-', 'JL.MS.BATU BARA GG.MELATI NO.28, KUPANG TEBA, Kec. Teluk Betung Utara	', 'IBNU WARSITO', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(94, '0099496114', '$2y$10$OzWggBr9z5dvMoYvLrvwc.iSu4rNQs9BcYydizcRFHdokitncC4wO', 'Revallian Syahputra', 'Laki-Laki', '2009-11-15', 'Teluk Betung', 'Islam', '083168864352', '-', 'Jl. Beringin No. 9 Lk II, Talang, Kec. Teluk Betung Selatan	', 'Ranto', '-', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(95, '0081904732', '$2y$10$ItTfeU3/O9dV4lwS9cldeONqAQFEo/KdgQah6fG3maTIa/VWs1LL6', 'Revita Anggraini', 'Perempuan', '2008-12-10', 'BandarÂ Lampung', 'Islam', '08129485312', '-', 'jl. ikan kerisi no. 28, teluk betung, Kec. Teluk Betung Selatan	', 'rohmat', '-', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(96, '0106454738', '$2y$10$kE6rs0nK9RwXg7LFZ7VPGeLgFr2BW2sIIVLYn2gc7XDBihgHet7SS', 'RHENATA OKTAVIA', 'Perempuan', '2010-01-10', 'BandarÂ Lampung', 'Islam', '081271488768', '-', 'WR. SUPRATMAN GG ASLIM NO 28 LK 2, Desa/Kel. Talang, Kec. Teluk Betung Selatan	', 'Muhammad Alex', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(97, '0094149317', '$2y$10$uIauWEU0V6zWnktImsUV4e02iOkGacvM4pWCKakiiykLVeouOOmaa', 'RIDHO MAYSAN JAYA', 'Laki-Laki', '2009-07-03', 'BandarÂ Lampung', 'Islam', '085368462445', '-', 'JL. WR. MONGINSIDI GG. WILIS NO. 22, KUPANG KOTA, Kec. Teluk Betung Utara	', 'SANTOSO', '-', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(98, '0106067210', '$2y$10$bUU21wl.aZRG7HQBGBLnhea60MhZz8bXPgwefXzQ5PNCtiHyNbWgm', 'Rifa Ailla', 'Perempuan', '2010-01-25', 'Wates Way Ratai', 'Islam', '083125019895', '-', 'Sidomulyo, Wates Way Ratai, Kec. Way Ratai	', 'Yuliusri', '-', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(99, '0105786694', '$2y$10$JooAHTTGIaEcX75XMRaOAuqXDTFNfKK5qIUh66LUP5o.lATooJ3Vi', 'RIFKI SATRIA PRATAMA', 'Laki-Laki', '2010-09-11', 'WONOGIRI', 'Islam', '085831521697', '-', 'JL. TANGKUBAN PERAHU, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara	', 'KARINO', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(100, '3112900139', '$2y$10$aba5YxV8.l/zDIV5223aVe8KMJpLA2eTSmAo/qmx/IPT84BlqBYR6', 'RILIVANY NARAISYA', 'Perempuan', '2011-07-02', 'BandarÂ Lampung', 'Islam', '081536069077', '-', 'JL. IKAN KITER, Desa/Kel. Kangkung, Kec. Bumi Waras	', 'MUHAMMAD DENI SYARIF', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(101, '0086708707', '$2y$10$TalbjOozexD7ogLuPdnX5ePSE17rkyXYBXLSe/U06pifeQhhFiPLm', 'RINJANI JINGGA DWI MAHARANI', 'Perempuan', '2008-12-15', 'BandarÂ Lampung', 'Islam', '085609325068', '-', 'JL. GN. KRAKATAU GG. WILIS/ 07 LK. I, KUPANG KOTA, Kec. Teluk Betung Utara	', 'ROBY ARIANTO', '-', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(102, '0082771104', '$2y$10$wgt7xd5vn2h0Smq5rIDNheVFbOHwv1jusL9yUR8PApt23tgAtQDnK', 'RISKA NAURA PUTRI', 'Perempuan', '2008-03-08', 'TELUK BETUNG', 'Islam', '082279596944', '-', 'JL. TANGKUBAN PERAHU NO. 12 LK. I, KUPANG KOTA, Kec. Teluk Betung Selatan	', 'MA\\\'RUF KURNIAWAN', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(103, '0119566493', '$2y$10$23DyFBbFGEIMmC4ynkkSPOWxBHTkUuxV2Mr8/o3JvV6x2d2lkEsky', 'RISKA URMILA PUTRI', 'Perempuan', '2011-04-15', 'TELUK BETUNG', 'Islam', '089527049134', '-', 'JL.YOS SUDARSO, BUMI WARAS, Kec. Bumi Waras	', 'URI MASHURI', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(104, '0091279069', '$2y$10$AS7kTcZIPxawe32wGkN4qu2lDk1CnyMbFJC8zzY8RI.xm7Y.4pJNW', 'Riski Ramadhan', 'Laki-Laki', '2009-09-04', 'BandarÂ Lampung', 'Islam', '089671785016', '-', 'jl. wr. supratman Lk.I, gunung mas, Kec. Teluk Betung Selatan	', 'Sutanto', '-', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(105, '0106055110', '$2y$10$cJApJMbwp24Qp93MwVD8Wulh40Wuk9VG6N0Qx/eZJO.UGGDUmKCjm', 'RISKI TRI PUTRA', 'Laki-Laki', '2010-12-14', 'BandarÂ Lampung', 'Islam', '083802787302', '-', 'JL. WR. SUPRATMAN GG R. DANIAL NO.15 LK II,Desa/Kel. GUNUNG MAS,Kec. Teluk Betung Selatan	', 'SUWARNO', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(106, '0089159141', '$2y$10$dpkBbf50lQKrSVF3fod38.IEBEOS5mj6MBMyUYf5ow6ZelMGJ8V1C', 'Rivaldo', 'Laki-Laki', '2008-12-26', 'Cirebon', 'Islam', '089636651212', '-', 'Jl. WR. Supratman Gg. Beringin II No. 15	Talang, Kec. Teluk Betung Selatan	', 'Joni. AR', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(107, '0093404107', '$2y$10$Z2tLwkCbMjUTwnJt0Ot9i..iLuSE6mM0at6dHV//wpFS5SoeOI96C', 'RIYANTI DWI RAHAYU', 'Laki-Laki', '2009-03-26', 'BandarÂ Lampung', 'Islam', '083169803177', '-', 'JL.IKAN MAS LK.III, KANGKUNG, Kec. Bumi Waras	', 'SUPRIYANTO', '-', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(108, '0109281890', '$2y$10$jZgAZOvv321.dLO0/kpWluQuYvCVOZi6qd9GsAp6nF3iwJLX/pNt6', 'Rizka Ramadhani', 'Perempuan', '2010-08-19', 'BandarÂ Lampung', 'Islam', '085380318771', '-', 'Jl. Rw. Monginsidi G. Merbabu No. 10 Lk. I, Kupang Kota, Kec. Teluk Betung Utara	', 'Zainal Arifin', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(109, '0109481203', '$2y$10$eFHtqxGlp.b.yAj4SnPEauJmPP/AVIEcdzS9g..8CnwnCCyh4XfGS', 'Rizqi Agustyan Ramadhan', 'Laki-Laki', '2010-08-23', 'Teluk Betung', 'Islam', '', '-', '', 'Budy Haryanto', '-', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(110, '3094388889', '$2y$10$Xs37s0XSQR6.uDeO8r.Ccu2pyP6K030Li/187fO9aJ0RO/n/LW/06', 'JIHAN SALSABILA', 'Perempuan', '2009-03-30', 'BandarÂ Lampung', 'Islam', '-', '-', 'JL YOS SUDARSO GG CENDANA 7, Kelurahan Bumi Waras, Kec. Bumi Waras', 'YUSTI ANGGRAINI', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(111, '0104328741', '$2y$10$Dt/VREjnS/8Lu1MGbTgMBeHyeR315oA7MrKqXbro35aKHsVTeM2Q6', 'Jodiansah Dwi Permana', 'Laki-Laki', '2010-01-05', 'BandarÂ Lampung', 'Islam', '081377777743', '-', 'jl. ms batubara gg. kenangan 19, Kelurahan kupang kota, Kec. Teluk Betung Timur', 'Yusman Sahar', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(112, '0084059383', '$2y$10$38mXJRIqqhYQKuCsqkIVc.y/8JGHkfwLnGVWxBcxPaOod3EuBJyji', 'JODIE NATANAEL', 'Laki-Laki', '2008-01-25', 'Karang Anyar', 'Islam', '082180249615', '-', 'Jl. Pantai Trikora Kp. Sei Kelubi, Kelurahan Desa Teluk Bakau, Kec. Gunung Kijang', 'RIKKY SUSILO', '-', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(113, '0083417885', '$2y$10$RnPMTge37em4xfN80QnumeA8mR0J/C2TcwcrHK55nnRtmPXUr/shC', 'Juliansah', 'Laki-Laki', '2008-07-09', 'Teluk Betung', 'Islam', '-', '-', 'Jl Yos Sudarso GG Ketapang Lk I, Kelurahan Sukaraja, Kec. Bumi Waras', 'Zaenal HS', '-', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(114, '0084748256', '$2y$10$/ugN7ZXMnpTXYmBEAcp6/.ULRJXAKnS21wND8MNfI57uAMHH13c9K', 'Kaila Aurellya Wijaya', 'Perempuan', '2008-11-16', 'Bratasena Adiwarna', 'Islam', '089628704128', '-', 'Beringin Gg. Beringin I, Kelurahan Talang, Kec. Teluk Betung Selatan', 'Jaya Wijaya', '-', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(115, '0091748254', '$2y$10$z0hz1TQLnLiw8G9b8WVaCOWUHcjfCVPgOQWt1YIvDc5PQwDcBdk56', 'Kaka Setiawan', 'Laki-Laki', '2009-01-18', 'BandarÂ Lampung', 'Islam', '083168045372', '-', 'Jl. Gn. Krakatau No. 9, Kelurahan Kupang Kota, Kec. Teluk Betung Utara', 'Jumadi', '-', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(116, '0109224872', '$2y$10$f3VoF.jdhDdpHzkPGO3elurDagUKRfd9KTeFdNP55Co9KXHuMVumm', 'Karel dwi saputra', 'Laki-Laki', '2010-01-04', 'teluk betung', 'Islam', '082376761007', '-', 'jl. ms. batubara gg. delima no. 23, Kelurahan kupang teba, Kec. Teluk Betung Utara', 'rohman azis', '-', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(117, '0094522562', '$2y$10$iBipYF4Xe0yQDWz2pOWvJutJ0iQMMu77XhTPU6Y6yqT7q5ySt5LYK', 'Keisya Myckeyla', 'Perempuan', '2009-08-05', 'Teluk Betung', 'Islam', '08994260356', '-', 'Jl. Wr. Supratman Gg. Rd Danial Lk.I, Kelurahan Gunung Mas, Kec. Teluk Betung Selatan', 'Rahmat', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(118, '0105046823', '$2y$10$AoHFi9gfOdgnP.XVa0kXkeiYDQlGBrhaQkPHeRGj3Lv6FzdQBhIly', 'Kevin Pratama', 'Laki-Laki', '2010-07-10', 'BandarÂ Lampung', 'Islam', '083168611703', '-', 'Jl. Gn. Krakatau, Kelurahan Kupang Kota, Kec. Teluk Betung Utara', 'Tukiman', '-', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(119, '0095283618', '$2y$10$QOLP7zcoVQJdAM5bM32o6u5QtCGU756lV.Jpals5dzFAExTgSF/iW', 'Keysa Aqila Zahra', 'Perempuan', '2009-12-10', 'BandarÂ Lampung', 'Islam', '081287896796', '-', 'Jl. Hasanudin Gg. Lamphong Lk II, Kelurahan Gunung Mas, Kec. Teluk Betung Utara', 'Sutrisno', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(120, '0117090237', '$2y$10$H.DuMl.q.bKc6jscTMyhze7uYNN8hIWdQnIkBlZBdJ8w3a7Rg9QgW', 'KEYSA PURNAMA SARI', 'Perempuan', '2011-05-28', 'BandarÂ Lampung', 'Islam', '088286498470', '-', 'JL.KANGKUNG DALAM LK.II NO.44, Kelurahan Desa/Kel. Kangkung, Kec. Bumi Waras', 'SUKARJA', '-', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(121, '0099651875', '$2y$10$UnksLn59sifdEXMZuwmFQ.KNNCFVMU1kVOTCyj/k.h6kdV84hVeCS', 'KEZIA NAYLA KERENPUKH PAKPAHAN', 'Perempuan', '2009-10-14', 'TELUK BETUNG', 'Kristen', '081279940257', '-', 'DRS.WARSITO GANG MALABAR KUPANG KOTA, Kelurahan KUPANG KOTA, Kec. Teluk Betung Barat', 'HENDRIK PAKPAHAN', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(122, '0096331182', '$2y$10$xhINAtuhf8kxwr3tugte8e4el2M.5/U5YQ0yetJ567pPC9Vmgrqu6', 'KHAIRUNNISA MASAYU', 'Perempuan', '2009-12-25', 'BandarÂ Lampung', 'Islam', '089516229905', '-', 'Jl. YOS SUDARSO, Kelurahan BUMI WARAS, Kec. Bumi Waras', 'TRIONO', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(123, '0082918403', '$2y$10$Umm8vLVD3kGaXEIVkg0louO91DGHRifkmWW/At84/6Iz9Ntb8c/ue', 'Khalista Agustina', 'Perempuan', '2008-08-08', 'BandarÂ Lampung', 'Islam', '089606019563', '-', 'WR. Monginsidi Gg. Arsad No. 50, Kelurahan Talang, Kec. Teluk Betung Selatan', 'Suroso', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(124, '0096067324', '$2y$10$cOX4R/sEucf2d3i.oGFL0ODxkdq7BTi7b7P5iQGBPGm2VChKsLJvC', 'Kheylla Aura Ramadhani', 'Perempuan', '2009-06-25', 'Teluk Betung', 'Islam', '089516242257', '-', 'Jl. Drs. Warsito Gg. Tanggamus, Kelurahan Kupang Kota, Kec. Teluk Betung Utara', 'Rika Saputra', '-', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(125, '0099257164', '$2y$10$p9mkkel632VvUMKC6dGr.eljGxoM9GzNvXPrxz55N1OX49F82OT8K', 'KIARA', 'Laki-Laki', '2009-01-16', 'TELUK BETUNG', 'Islam', '0895608030205', '-', 'Jl. Ikan Kiter Gg. Masjid, Kelurahan Bumi Waras, Kec. Kedamaian', 'HABIB', '-', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(126, '0103624404', '$2y$10$6q4ENMF/Baip2lnpMwbAcu32uid02y1oxontlSkvghBGnnckHpg.O', 'Kirana Agustina Ramadani', 'Perempuan', '2010-08-23', 'BandarÂ Lampung', 'Islam', '-', '-', 'ikan julung, kelurahan skip rahayu, Kec. Bumi Waras', 'Sugiarto', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(127, '0102202211', '$2y$10$35.LWo8PZNXY2KzjOSfJLOdiWFNiZTKHALTF2pn/dW3H/bCWNEa3y', 'Kusri Yanti', 'Perempuan', '2010-06-20', 'Teluk Betung', 'Islam', '089637557626', '-', 'Jl. Drs. Warsito Gg. Semeru No. 36 LK II, Kelurahan Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'Abdul Gafur', '-', 2022, '7B', 'default-profile-picture.jpg', 'Aktif'),
(128, '0097362059', '$2y$10$OTnGa5M5Slf4pUCOh.Q1fOsezHv9NGUZETgz9ztVuzJo9OHWkEuOy', 'Lailatul Hoiriyah', 'Perempuan', '2009-10-17', 'BandarÂ Lampung', 'Islam', '0895620367310', '-', 'jL. WR. Supratman Gg. Pancurmas LK.I, Kelurahan Gunung Mas, Kec. Teluk Betung Utara', 'Sanali', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(129, '0107570717', '$2y$10$TAAPPjAGNeU/hnAQpSJo1.KFfGwcZagW7qgIRDNKikjFks8cll2Fq', 'Laili Rahmawati', 'Perempuan', '2010-06-18', 'BandarÂ Lampung', 'Islam', '0895705230659', '-', 'jl. wr. supratman gg. gunung kelud lk.II, Kelurahan Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'Ahmad Rojikin', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(130, '0099382712', '$2y$10$i.oXsl49dswZPAeAbKvHSeIcksGUKLKptl7pZP8o2zlt0fQozNIAe', 'Lia Anggraini', 'Perempuan', '2009-07-30', 'Jakarta', 'Islam', '088210129711', '-', 'Hasanudin Gg. Kantor Pos No.30 LK.II, Kelurahan Gunung Mas, Kec. Teluk Betung Selatan', 'Sakir', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(131, '0111391985', '$2y$10$C6NBEgG4TVogNCr0Lr/QRe8bA6dItzWLv/dBpojffRHAHdpB/nkZy', 'LUTHFIA ALISIA PUTRI', 'Perempuan', '2011-05-22', 'BandarÂ Lampung', 'Islam', '089630430126', '-', 'JL MS BATU BARA GG MELATI NO.26, Kelurahan Desa/Kel. Kupang Teba, Kec. Teluk Betung Utara', 'SUROTO', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(132, '3116121709', '$2y$10$MUz16FBI0wcjItqvB4jOJOceeP8FQ9NT7PpqWSS0JKmWCd.4gSeBi', 'M FATIH AL HAITAMI', 'Laki-Laki', '2011-08-30', 'BandarÂ Lampung', 'Islam', '082195577212', '-', 'JL. YOS SUDARSO GG CENDANA VI LK I, Kelurahan Desa/Kel. Bumiwaras, Kec. Bumi Waras', 'KOMARUZZAMAN', '-', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(133, '3101407703', '$2y$10$JtDwKK7mlV3fzrydxKHIQOYX4Px9gQLuGsCihtbnUJHJZL5mAjl26', 'M TAUFAN PRATAMA', 'Laki-Laki', '2010-07-10', 'BandarÂ Lampung', 'Islam', '089523115195', '-', 'JL. GUNUNG KRAKATAU LK I, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'M JEFRI JULIANTO', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(134, '3097157875', '$2y$10$5jxQcWwG0o0A/vBZFsy33uX9GKNBM/Xi55jLdUCmLzH59e1/YmyXC', 'M ZAKI RIZKI PRATAMA', 'Laki-Laki', '2009-04-20', 'BandarÂ Lampung', 'Islam', '-', '-', 'Jl Tangkuban Perahu Lk. I RT 014/-, Kelurahan Kupang Kota, Kec. Teluk Betung Utara', 'Sri Anjani', '-', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(135, '0083188718', '$2y$10$rF/NDuHWG4GuPkSfeSUu5.GnD2x4r8DgbInoR5aImmEFF9R085ik2', 'M. ABDUL DZAKI', 'Laki-Laki', '2008-07-31', 'BandarÂ Lampung', 'Islam', '083179926151', '-', 'JL. TANGKUBAN PERAHU/ 24 LK. I, Kelurahan KUPANG KOTA, Kec. Teluk Betung Utara', 'ZAINAL ARIFIN', '-', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(136, '0107075892', '$2y$10$IW/s5C4.wmwoqiTZ.dUBlu1Zc8ZP.6zjCRWLvAR.At1OjP7RtjPQm', 'M. Alfa Rizki Saputra', 'Laki-Laki', '2010-09-07', 'BandarÂ Lampung', 'Islam', '0895605936003', '-', 'Jl. Drs. Warsito, Kelurahan Kupang Kota, Kec. Teluk Betung Utara', 'Suhendri', '-', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(137, '0084924253', '$2y$10$Z0e153NX3sxinQlZmlLU0OVsshwsPmfrfiyMYtJLWWR.6rjGzBV6.', 'M. ARIF SAPUTRA', 'Laki-Laki', '2008-06-27', 'TELUK BETUNG', 'Islam', '089630602281', '-', 'JL. WR. MONGINSIDI NO. 38 LK. II, Kelurahan TALANG, Kec. Teluk Betung Selatan', 'RUSDI APRIYANTO', '-', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(138, '0111913598', '$2y$10$oL9/esKPbZb50unZEB8eXe49Fih.BsM53azcvTeQ1AP20JBsnZ7PS', 'M. DAFFA PRATAMA', 'Laki-Laki', '2011-03-23', 'BandarÂ Lampung', 'Islam', '083150316108', '-', 'JL IKAN MAS GG MANSUR LK III, Desa/Kel. Kangkung, Kec. Bumi Waras', 'AGUS MARDIANTO', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(139, '0105953481', '$2y$10$RMUGlDRdEHsJIxOfHhZbr.7Q.ycrA7uzYA.4bRUs57F1ZVwptx/HC', 'M. Danang Rifaldi', 'Laki-Laki', '2010-12-14', 'BandarÂ Lampung', 'Islam', '085658790020', '-', 'Jl. Tangkuban Perahu N0.7 Lk. I, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'Rustam. S. Makki', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(140, '0103913191', '$2y$10$XnZHGb6yIdsSRB99jTjw1OqYfDmZFDL4E0/4kIdf.ypOVPituGH42', 'M. Danang Rifaldo', 'Laki-Laki', '2010-12-14', 'BandarÂ Lampung', 'Islam', '085658790020', '-', 'Jl. Tangkuban Perahu No. 7 Lk. I, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'Rustam S. Makki', '-', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(141, '0103360760', '$2y$10$UTOvLrStV0U2Z9oq3rNzz.4I8F76JFNSB5KWwkgohtA7eGYnGDb8G', 'M. Daniel', 'Laki-Laki', '2010-07-22', 'BandarÂ Lampung', 'Islam', '081540862710', '-', 'Jl. RW. Monginsidi Gg Batas Lk II, Kelurahan Talang, Kec. Teluk Betung Selatan', 'Ahmad Maimun Khairudin', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(142, '0105803892', '$2y$10$/iEssJbc7QrppCfCyKvIKuOyDz54TrJaFQuhsHsL9.F/FTWmVyIwm', 'Abdi Negara', 'Laki-Laki', '2010-07-06', 'Teluk Betung', 'Islam', '085832208158', '-', 'Jl. KRAKATAU NO. 40, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'Subandi', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(143, '0113701227', '$2y$10$Lut6O.jlZlAjaQ.q.mSF/OX.bMvlxDWZg2fK/q42giUgnVCvTGjJC', 'Abdilah Rosyid', 'Laki-Laki', '2011-03-18', 'Bandar Lampung', 'Islam', '082278292924', '-', 'jl. ms. batubara gg delima 22, Desa/Kel. Kupang Teba, Kec. Teluk Betung Utara', 'Subandi', '-', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(144, '0113395006', '$2y$10$HOn/T5TARoiLdGthD19FdOI.oy4cYGiBDpquW1jQ6XPnPTjNMMSre', 'Abdul Taqib Al Ilsan', 'Laki-Laki', '2011-02-08', 'Bandar Lampung', 'Islam', '082280593599', '-', 'jl. Hasanudin gg.Lampong LK II, Desa/Kel. GUNUNG MAS, Kec. Teluk Betung Selatan', 'Muhammad Yusup', '-', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(145, '0101591502', '$2y$10$ED5Hgw9jNv8DwIrAb2jAn.K93XDyfxcIARsFT5gvVL3AfSWYnOepm', 'ABIENAYA KARUNIA YUSUF', 'Laki-Laki', '2010-11-07', 'Bandar Lampung', 'Islam', '089650228278', '-', 'Jl. Tangkuban Perahu No.36 Lk.1', 'RIAN DANO', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(146, '0089719331', '$2y$10$lfRk/2XYoegWRJmFCNmhn.r1ix.9JZpoR0H5LgLBnS08ozvEtHGhq', 'ABIGAEL LANGIT RAMADHAN', 'Laki-Laki', '2008-09-20', 'Bandar Lampung', 'Islam', '089518253620', '-', 'TANGKUBAN PERAHU 36, KUPANG KOTA, Kec. Teluk Betung Utara', 'Sumor', '-', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(147, '0083423893', '$2y$10$tJZdPVRjMf7s1wbHAMJGh.rgaNqNy0QKwsUuCodl7MqlWjj5EDg9S', 'ABIL', 'Laki-Laki', '2008-09-26', 'SERANG', 'Islam', '085266548443', '-', 'JL. GN. KRAKATAU GG. MUSHOLA NO.31, KUPANG KOTA, Kec. Teluk Betung Utara', 'MULYADI', '-', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(148, '0093316801', '$2y$10$RnjZSYtbmbRlFvUbeI4IGunrWkjUr2LTMOkeCjbkmWIInvEhQqU0e', 'Abim Ramadan Pratama', 'Laki-Laki', '2009-09-14', 'Teluk Betung', 'Islam', '-', '-', 'Jl. Ikan Julung, Skip Rahayu, Kec. Bumi Waras', 'Samsul', '-', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(149, '0106369418', '$2y$10$ebHiwIVa1aKdb3E4LkAkRuwrhyVISrBuogDOzRiJaxP1GPMf8zHki', 'ABIYA RISKY RAMADHAN', 'Laki-Laki', '2010-08-27', 'JAMBI', 'Islam', '082269380899', '-', 'Jln.Ir.H.Juanda', 'M SYARIF', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(150, '0083709589', '$2y$10$9KDWLeLPtl6ADbWNPeIOteEsVDwQklShFVxYKp/NbeP/qEdgDaS92', 'Achmad Reza Fatoni', 'Laki-Laki', '2008-10-16', 'Bandar Lampung', 'Islam', '0895609834881', '-', 'Jl. Wr. Supratman Gg Pancur Mas, Gunung Mas, Kec. Teluk Betung Selatan', 'SUYANTO', '-', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(151, '0095544544', '$2y$10$.6D0PpAW1JgkSEal4/6Rf.3bQJJFsd/qlptBnN/if3HiYGPKhOeC2', 'Adelia Chintya Putri', 'Perempuan', '2009-12-13', 'Teluk Betung', 'Islam', '0895600557171', '-', 'Jl. Tangkuban Perahu No. 50, Kupang Kota, Kec. Teluk Betung Utara', 'Paryono', '-', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(152, '0109109864', '$2y$10$WQ1cY5MSB4S6BMwGJQDy1e3JssKwqHuNnuMekHOR2Mikr4syDcXOK', 'Adiestia Arvina Dewayani', 'Perempuan', '2010-12-24', 'Bandar Lampung', 'Islam', '083153642214', '-', 'jl. wr. supratman gg. pancur mas lk.I, gunung mas, Kec. Teluk Betung Selatan', 'mukti zailani', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(153, '0114993031', '$2y$10$S1liy/btL31UKiWjh64WX.G/k5RfJhaSCGtJFxwlrXnzU5d9WIeXu', 'ADINDA NAYSILA AURA', 'Perempuan', '2011-04-11', 'Bandar Lampung', 'Islam', '089648855546', '-', 'JL.IKAN MAS GG.MANSYUR, BUMIWARAS, Kec. Bumi Waras', 'RAWUD', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(154, '0081845841', '$2y$10$4DujNClj7RihTSgIeKUT6eLGJPpmrYJ8BFPG/lvUnWwSZUPSUWdd2', 'Adinda Raisya Arimbi', 'Perempuan', '2008-05-30', 'Bandar Lampung', 'Islam', '089601399138', '-', 'jl.purnawirawan II, gunung terang, Kec. Tanjung Karang Barat', 'Amin Adi', '-', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(155, '0092734634', '$2y$10$MdvQYJXR95n1IbC4JWA1luX4S9qnrnwx8CiYtd/sovlbec6be6hk.', 'Aditya Hamzah Ilhami', 'Laki-Laki', '2009-04-05', 'Pringsewu', 'Islam', '-', '-', 'Jl. WR. Monginsidi No.1 RT/RW:011, Talang, Kec. Teluk Betung Selatan', 'Suratmi', '-', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(156, '0086793474', '$2y$10$xktEFgTri8ymO8M8Y.uj1uw5F1B/luAXCX3lfVLfTfLNgAGMjnp1.', 'Aditya Maulana Pratama', 'Laki-Laki', '2008-06-19', 'Teluk Betung', 'Islam', '085266548470', '-', 'Jl. Drs. Warsito Gg. Rajabasa, Kupang Kota, Kec. Teluk Betung Utara', 'Hamami', '-', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(157, '0081515377', '$2y$10$nVUaRpanG/TkVaVtc544zujsSBbTG4v0cCMvHFkHDs9D2uqJ1Lc6i', 'Aditya Surya Prakasa', 'Laki-Laki', '2008-03-10', 'Teluk Betung', 'Islam', '085273087743', '-', 'kp.kebun jeruk, panjang utara, Kec. Teluk Betung Selatan', 'Topik', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(158, '0091916680', '$2y$10$/gZrcTVJiIhqAkquDXdJWO2ayaChLSQHcgtj9zs04z8WajdmqIT.e', 'Afif Madani', 'Laki-Laki', '2009-07-30', 'Bandar Lampung', 'Islam', '089679531999', '-', 'Jl. Wr. Supratman Gg.Pegadaian 2 Lk.II, Kupang Kota, Kec. Teluk Betung Utara', 'Ruwadi', '-', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(159, '0121275529', '$2y$10$bsPnVcxh8lrhHwFIfhAUSeiDQMKnxiYgmEMSeNAPsxOp3S2tmkrbi', 'Afika Najla Angellica', 'Perempuan', '2011-10-03', 'Bandar Lampung', 'Islam', '083193238602', '-', 'Jl. Hasanudin Gg Kantor Pos No. 7 LK II, Desa/Kel. GUNUNG MAS, Kec. Teluk Betung Selatan', 'Johan Pranata', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(160, '0085123897', '$2y$10$PJCwZESnm1GZ38YmtO4n.OY9M2syfJF2wP97ikoIw4oCmLcJYaamy', 'Agusti Rangga', 'Laki-Laki', '2008-08-16', 'Bandar Lampung', 'Islam', '085382512609', '-', 'Jl.Marga S Banten No 17 LK I, Sumber rejo, Kec. Kemiling', 'Erlangga Endang', '-', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(161, '0098378895', '$2y$10$SPNot/j3a60vmkbxHoqvD..bdEmKwhaHydu4VDtJ/o7z.Y0wcjaf2', 'Agustina Ramadhani', 'Perempuan', '2009-08-28', 'Tanjung Karang', 'Islam', '082280731077', '-', 'Jl. Wr. Supratman Gg. Pancur Mas, Teluk Betung, Kec. Teluk Betung Selatan', 'Slamet Wibowo', '-', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(162, '0091232565', '$2y$10$1AhOSn7G.LtKdnY9N6TOOuAw3XtWC3InRHoyRt7TfAzQSexuKMy5W', 'AHMAD ALFARIQI ARIF', 'Laki-Laki', '2009-09-30', 'Teluk Betung', 'Islam', '-', '-', 'jl. laks malahayati no.33 e, teluk betung, Kec. Teluk Betung Selatan', 'junaidi', '-', 2022, '8D', 'default-profile-picture.jpg', 'Aktif');
INSERT INTO `siswa` (`id_siswa`, `nisn`, `password`, `nama`, `jenis_kelamin`, `tanggal_lahir`, `tempat_lahir`, `agama`, `no_hp`, `email`, `alamat`, `nama_wali`, `no_telepon_wali`, `angkatan`, `kode_kelas`, `foto`, `status_siswa`) VALUES
(163, '0097486309', '$2y$10$pB5ScnBv9X0eqBGtzhokG.09Ntda3sxE/73iOFxlkLjINU6nxU6aS', 'Ahmad Badarudin', 'Laki-Laki', '2009-06-06', 'Bandar Lampung', 'Islam', '08993040335', '-', 'jl. Wr. Supratman Gg. Pancurmas Lk.1, gunung mas, Kec. Teluk Betung Selatan', 'Zabar', '-', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(164, '0105016012', '$2y$10$z03HPNJo2qiR0YSpqWbWNOcPWMlRBil30Ex.iV84WjASRg7QxJIbu', 'Ahmad Fadhil Asshabierin', 'Laki-Laki', '2010-03-12', 'Bandar Lampung', 'Islam', '083169572762', '-', 'Jl. Drs. Warsito No. 44/42 Lk. II, Kupang Kota, Kec. Teluk Betung Utara', 'Muhammad Naza Alpha Putra', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(165, '3097187557', '$2y$10$kHzC/i42ZXY4YxW21iKoYeNf8ms9wck40fjrWUEuaI4orfDIxMAK6', 'Ahmad Faiz Zulkarnain', 'Laki-Laki', '2009-10-03', 'Bandar Lampung', 'Islam', '-', '-', 'JL. Drs. Warsito Gg. Rajabasa I No. 31, Kupang Kota, Kec. Teluk Betung Utara', 'Dede Marlia', '-', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(166, '3091612669', '$2y$10$XczTaYJXjGQgYhKRffnkBOaXkKh.vKOGoRWt7m2QpG0zJAL4yST86', 'AHMAD GHIYATS NAJI FAWWA', 'Laki-Laki', '2009-12-12', 'Bandar Lampung', 'Islam', '085368115581', '-', 'JL. HAYAM WURUK NO 27 GG DARUL ANSOR, Kebon Jeruk, Kec. Tanjung Karang Timur', 'M Aminuddin AR', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(167, '0106840313', '$2y$10$it/MbI2xsdUVF95QMJq.L.UjUrFOYq7aWjHm0AOTwNj6CXnnltyzK', 'AHMAD RAFFA SETIAWAN', 'Laki-Laki', '2010-09-28', 'Bandar Lampung', 'Islam', '085268582926', '-', 'JL. DRS. WARSITO NO. 6, KUPANG KOTA, Kec. Teluk Betung Utara', 'AGUS SETIAWAN', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(168, '0112051781', '$2y$10$muqZlY9vpJ1x2UGU/9CTJeV5Cd7fHUmsOhahmP0zUvgZ62aUSvu0e', 'AHMAD RAFFI FIRDAUS', 'Laki-Laki', '2011-02-21', 'Bandar Lampung', 'Islam', '088268311487', '-', 'KANGKUNG DAKAM NO.44, KANGKUNG, Kec. Bumi Waras', 'FAREL LATIP EVAN', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(169, '3124948771', '$2y$10$KgVvOJIwpxZsEPCM85QUV.lBFkVWZJqlfqcRas0RMV8YjZxN4gyZG', 'AHMAD SAIFULLOH', 'Laki-Laki', '2012-02-02', 'Bandar Lampung', 'Islam', '089504011311', '-', 'Jl. Ikan Kiter Blok C No. 57 LK II ,Desa/Kel. Kangkung, Kec. Bumi Waras', 'Muin', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(170, '0105657883', '$2y$10$CAJzx2en2UTPPOz4P0xiw.fEAJbEk3s/092zCodW0TFdVP5wzckw.', 'AINI SARI', 'Perempuan', '2010-06-25', 'Bandar Lampung', 'Islam', '08975875533', '-', 'JL. RW MONGINSIDI GG SWADAYA NO 23 LK II, Desa/Kel. Talang, Kec. Teluk Betung Selatan', 'NAZARUDIN', '-', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(171, '0099084198', '$2y$10$9kvBfVfVWxD8DLeujapePOCHWCBFVhw.nQI0Kab.p67jP8RLGQZhm', 'AIRA FITRIA VALENTINO', 'Perempuan', '2009-09-22', 'Bandar Lampung', 'Islam', '-', '-', 'JL. IKAN KITER NO. 86 BLOK C LK II, Kangkung, Kec. Bumi Waras', 'REZA VALENTINO', '-', 2023, '9D', 'default-profile-picture.jpg', 'Aktif'),
(172, '0115621542', '$2y$10$gTqSbwbOyXXRy/4nVB4NVOWC6nGJL/ufErYTAis8kaDNNtskv/9W.', 'AISYAH BELFA MAULIDIA', 'Perempuan', '2011-02-16', 'Bandar Lampung', 'Islam', '089502415962', '-', 'JL. IKAN KAKAP DALAM NO 11, Desa/Kel. Pesawahan, Kec. Teluk Betung Selatan', 'M.HARIS B', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(173, '0094471797', '$2y$10$g7e9HoP6iTgHOLUsvXKRB.EgIRaT2kCgUNqZJZ86xjaYsHEaPWIxG', 'Akbar Kurniawan', 'Laki-Laki', '2009-04-14', 'Teluk Betung', 'Islam', '089505125665', '-', 'Jl. Drs. Warsito Gg. Tanggamus No. 27 B Lk. II, Kupang Kota, Kec. Teluk Betung Utara', 'Zulkifli', '-', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(174, '3105325514', '$2y$10$9ps8X.zm4wVgvjaCyNGe6uQdg.3xUNo/ra0G7sMRTsDXI4E4UaToi', 'AKHBAR MULIYA DHARMAWAN', 'Laki-Laki', '2010-10-03', 'Bandar Lampung', 'Islam', '-', '-', 'Jl. Drs. Warsito Gg. Semeru No.32 LK. II, Kupang Kota, Kec. Teluk Betung Utara', 'Anwar', '-', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(175, '0117277818', '$2y$10$J6oifZ6pUPSVyGvXCDuNg.F9gwgmTUJhw2/nDgmrNwLAprXocbi7K', 'Akmal Rapi', 'Laki-Laki', '2011-04-12', 'Bandar Lampung', 'Islam', '085832664944', '-', 'Jl. Gn. Krakatau Gg. Lapangan Miring No. 18 Lk. I, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'Fajar Afrianto', '-', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(176, '0083973454', '$2y$10$D2CYiAQ/dg.jqPOczLoBheVRF3Cf20OZsCg4bo2CSjqUFjX48H2TS', 'Al Zaki Habibi', 'Laki-Laki', '2008-06-29', 'Bandar Lampung', 'Islam', '085279011059', '-', 'WR. Monginsidi Lk. II, Talang, Kec. Teluk Betung Selatan', 'Romi Aprilian', '-', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(177, '0113027587', '$2y$10$7LjEFL00ItkWEYt/ygeqYOTPeYLJh9ESF9OH9sDtsDQ.uuH0M3HlC', 'Aldyindra Arsy Rayyan', 'Laki-Laki', '2011-03-23', 'Metro', 'Islam', '082177951585', '-', 'Asrama Polda Lampung Blok E-1, Kupang Kota, Kec. Teluk Betung Utara', 'Novi Andalan', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(178, '0096513185', '$2y$10$Pja4pPT.xsGHkK8vk3dLaO8zw8cxX2FlyBp8XkP0mE1a4KPOhy3NS', 'ALEA CAHYA RAHMADHANI', 'Perempuan', '2009-09-01', 'Bandar Lampung', 'Islam', '08973391671', '-', 'Jl. MS. BATUBARA No. 28, KUPANG TEBA, Kec. Teluk Betung Utara', 'ARI KODRI', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(179, '0109693921', '$2y$10$cA/u9zTZtkZwUMYuGOrfNuVfJFnd4y/..EkTne145djM.3pSHP3ki', 'Alfandi Faisal', 'Laki-Laki', '2010-09-15', 'Bandar Lampung', 'Islam', '083171551353', '-', 'jl. Hasanudin Gg. Nangka No. 18, Desa/Kel. Kupang Teba, Kec. Teluk Betung Utara', 'Agus Faisal', '-', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(180, '0096133854', '$2y$10$5eszvSaeOMogt5h9mD96xeuSp0bgw4sIJRSdklD6bGPjFHjdhFHFC', 'Alief Alham Alfadla', 'Laki-Laki', '2009-03-10', 'Bandar Lampung', 'Islam', '0895601671030', '-', 'Jl. Drs. Warsito Gg. Semeru No. 4, Kupang Kota, Kec. Teluk Betung Utara', 'Rico Adi Saputra', '-', 2023, '9B', 'default-profile-picture.jpg', 'Aktif'),
(181, '3108207315', '$2y$10$VfepfSOlFiUMhUcwTLk8IuRfZG5o4S.GKe0GmA5uodj1UjNrGEhwy', 'ALIF REZKY PRATAMA', 'Laki-Laki', '2010-05-14', 'Bandar Lampung', 'Islam', '082179224947', '-', 'Jl. Tangkuban Perahu LK.I, Kupang Kota, Kec. Teluk Betung Utara', 'Hasannudin', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(182, '0105980833', '$2y$10$riBJD5BP/K.aNgAlzPut0.rJAAxh2f.wfNkwBFCnv7s7qZd6UzXPW', 'ALIF SANDY SAPUTRA', 'Laki-Laki', '2010-06-03', 'Bandar Lampung', 'Islam', '0895391339876', '-', 'Jl, Gunung Krakatau No. 36 LK.I, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'M.SUUD', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(183, '3087726793', '$2y$10$h0eoFBiTdHO.S5A93MCsS.6ihFMfQe/KnF0iynB66TDT.SLOYIr/S', 'ALITA SARI', 'Perempuan', '2008-05-27', 'Bandar Lampung', 'Islam', '-', '-', 'JL GUNUNG KRAKATAU NO 32, Kupang Kota, Kec. Teluk Betung Utara', 'Mulyadi', '-', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(184, '0102837458', '$2y$10$5tbRoNKSSPr.W./7aM57LOVLdUv89EueYcJXhekc4YNsBEJ5TSlD.', 'ALMAIDA GILSHERIN', 'Perempuan', '2010-02-06', 'Bandar Lampung', 'Islam', '-', '-', 'JL. YOS SUDARSO GG. M. AGUS, BUMI WARAS, Kec. Bumi Waras', 'ALEX CHANDRA', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(185, '0085327756', '$2y$10$EpKQLev2TmieTl9n5x4.TOdV/zpPIh6Oa8Z/4p1.0NGB6PAwKaxPK', 'Alvin Anan Romadon', 'Laki-Laki', '2008-09-18', 'Teluk Betung', 'Islam', '085841717442', '-', 'Jl. Drs. Warsito gg. Tanggamus No. 31, Kupang Kota, Kec. Teluk Betung Utara', 'Yogi Anansri', '-', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(186, '0115757157', '$2y$10$FD6Xe.heTQpUpKj0GfSUVeisRlFIFW9ClPgaOk.TXf79vlsgd2LEy', 'ALYA KHOIRUN NISA', 'Perempuan', '2011-05-22', 'Bandar Lampung', 'Islam', '082177644315', '-', 'JL WR MONGINSIDI NO. 28, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'HERMANSYAH HAMDANI', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(187, '0117720870', '$2y$10$LbZj9yDbcLpcbK0WHlYKS.C/Hu6Cfb.9NG0iV3jGQ.FjMfSpaeqMC', 'AMALIA ASYIFA PUTRI', 'Perempuan', '2011-04-24', 'Bandar Lampung', 'Islam', '089632549070', '-', 'JL.Martadinata Perum Waway No.2, Desa/Kel. Pesawahan, Kec. Teluk Betung Selatan', 'Arie Pragia', '-', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(188, '0098069525', '$2y$10$g0yq8f1ffin9gOOfw8KePuZThOu0Q3AuWD2FMOQ3vQ9TC2kCi3JMy', 'M. DIKNA KOSWARA', 'Laki-Laki', '2009-02-17', 'Teluk Betung', 'Islam', '081271785909', '-', 'JL. IKAN SELAR LK I, SUKARAJA, Kec. Bumi Waras', 'DEDI KOSWARA', '081271785909', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(189, '0109607654', '$2y$10$/klHCCqmmKXrOJpBqaB.IO25k9u.3TCNhqFklDq9YARZVQN00jWyC', 'M. Ergiansyah', 'Laki-Laki', '2010-04-21', 'Teluk Betung', 'Islam', '081279140433', '-', 'jl. hasanudin gg. kantor pos, teluk betung, Kec. Teluk Betung Selatan', 'bajuri', '081279140433', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(190, '0099106848', '$2y$10$TovniSm2SewEew4mwaALRO..1GR2SyvLC7KjOSG7Vm8qnjRtEFp8a', 'M. Fahri Saputra', 'Laki-Laki', '2009-10-22', 'Tanjung Karang', 'Islam', '0895640017622', '-', 'Jl. R. Fatah Gang Hi. Masnin No 23, Kaliawi, Kec. Tanjung Karang Pusat', 'Suhemi', '0895640017622', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(191, '3116849934', '$2y$10$6ABFP7euiFQgv3mkYWDpWuENw1h2Bow6Jpl5QRVxAwGgrRPII7FGm', 'M. FAQIH MUBAROK', 'Laki-Laki', '2011-03-23', 'BandarÂ Lampung', 'Islam', '082126997180', '-', 'JL RW MONGINSIDI GG MANIS LK II NO 48, Desa/Kel. Talang, Kec. Teluk Betung Selatan', 'RUDI HARTONO', '082126997180', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(192, '0102040791', '$2y$10$RVbT0qj/DP2q.VTb7nZ96.WEtF7uV.ekIWHwDdSuer/J9KHuPT/.C', 'M. FARHAN', 'Laki-Laki', '2010-10-09', 'Teluk Betung', 'Islam', '088287143487', '-', 'JL. DRS. WARSITO GG. RAJABASA, KUPANG KOTA, Kec. Teluk Betung Utara', 'AHMAD YANI', '088287143487', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(193, '0084970854', '$2y$10$fJrySrjGvruBOAW0GhNQ5OKBueA4G66lar1xQnbVbR1PG7335lVMi', 'Amarullah', 'Laki-Laki', '2008-05-19', 'Bandar Lampung', 'Islam', '081994922777', '-', 'KH. Ahmad Dahlan Gg. Mawar, Kupang Teba, Kec. Teluk Betung Utara', 'Aman', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(194, '0093924821', '$2y$10$iAv176qcVfWu.98pSOv8Me15LxdnFLJ8WuE09bRFmIHhdSIBXQCOq', 'M. FARID BIL QALAM', 'Laki-Laki', '2009-08-05', 'Teluk Betung', 'Islam', '-', '-', 'JL MS BATUBARA GG DAHLIA NO 30, Kupang Teba, Kec. Teluk Betung Utara', 'MAI KARYANTI', '-', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(195, '0102036027', '$2y$10$b5bT0y8q1wq0FPcg.Dg9Y.Or7YU/Caj8AG7Quj2pXP3Fr6K52I04O', 'ANASTASYA SALMA ARZETY', 'Perempuan', '2010-09-26', 'RAJABASA', 'Islam', '085380211103', '-', 'Jl. Tangkuban Perahu No. 02, Kupang Kota, Kec. Teluk Betung Utara', 'ABDUL RAHMAN', '-', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(196, '0103325147', '$2y$10$TonNra7eI9vFsLN9l3TwDe2y9lO4BNYwZF50KwvlxIWIS5uig/DsO', 'Andre Julian Pratama', 'Laki-Laki', '2010-09-11', 'Bandar Lampung', 'Islam', '083871353275', '-', 'jl. hasanudin gg. kantor pos lk.II, Desa/Kel. GUNUNG MAS, Kec. Teluk Betung Selatan', 'boimin', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(197, '0095010681', '$2y$10$6pgr9jh1Tndp7c2q416lhO2T4Sos2x79DjdI8Pm3O8a6/dw5JhQ0C', 'M. FARIDZ HAKIM', 'Laki-Laki', '2009-02-06', 'BandarÂ Lampung', 'Islam', '089653397659', '-', 'Hanura, Hanura, Kec. Padang Cermin', 'AHMAD BASTIAN', '089653397659', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(198, '0108608889', '$2y$10$TES9dHEI2VFinzFlo9PGcOooMAjavagTncckeHycOGFIHvD1yD1F2', 'M. FASYA ALFIKRI', 'Laki-Laki', '2010-06-06', 'Teluk Betung', 'Islam', '085658311078', '-', 'JL. GN. KRAKATAU NO. 16 LK I, KUPANG KOTA, Kec. Teluk Betung Utara', 'DWI SUNARTO', '085658311078', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(199, '0096231971', '$2y$10$HvU.zgr.obCYmFqQJWBmteAJIxJ80cF9qHw.S9NHNgZ29Gd/j6.Qq', 'M. Febriansyah Maulana', 'Laki-Laki', '2009-02-14', 'BandarÂ Lampung', 'Islam', '089633506868', '-', 'Jl. Laksamana Malahayati, Pesawahan, Kec. Teluk Betung Selatan', 'Mansyur', '089633506868', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(200, '0093064039', '$2y$10$s8aGd7KkXfYLKFw.S6ERbOMqIxn4VQM3RtgV0H.kiuddvmTFItEHG', 'M. GALUNG PRATAMA', 'Laki-Laki', '2009-03-19', 'BandarÂ Lampung', 'Islam', '-', '-', 'Jl. MS BATUBARA Gg. DAHLIA No. 27, KUPANG TEBA, Kec. Teluk Betung Utara', 'RUDI IRAWAN', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(201, '0106299169', '$2y$10$Au0O.mkA5zMyx81/fwwoo.lMlhoRp1hNLQZ2gDxXLFOEexImzAxv6', 'M. GINDAH SAPUTRA', 'Laki-Laki', '2010-06-14', 'BandarÂ Lampung', 'Islam', '089508901442', '-', 'JL. RW. MONGINSIDI NO. 17 GG. PERMAI I, Talang, Kec. Teluk Betung Selatan', 'Andriano', '089508901442', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(202, '0104410984', '$2y$10$AMvJG6NVZpXAcvwaDpTvuupHmJU.hUQcXqOkmX2VDy5WksFj6uY3O', 'M. Habiburrahman Al Hakim', 'Laki-Laki', '2010-05-30', 'Teluk Betung', 'Islam', '0895600983080', '', 'Jl. Teluk Bone Sukabanjar Kota Karang, Kota Karang, Kec. Teluk Betung Timur', 'LUKMAN', '0895600983080', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(203, '0082048145', '$2y$10$WcLRH/kWHr.Sz8cVCCt5Keddn6Wq42cRfn0VWPkZ.5hZrrmrZiOCO', 'M. Ibnu Fadil', 'Laki-Laki', '2008-01-22', 'Teluk Betung', 'Islam', '083168257386', '-', 'jl. ikan pari blok A no.17 lk.I, teluk betung, Kec. Teluk Betung Selatan', 'Rozali', '083168257386', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(204, '0108703957', '$2y$10$ef.BUZ0OLdqsooV0L.O4zOfsi9mOV55JWYWSMEvZcteanqsFhjQXi', 'M. IBNUH', 'Laki-Laki', '2010-01-15', 'Merbau Ranji', 'Islam', '085788393766', '-', 'JL. DRS WARSITO GG TANGGAMUS, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'DARMAWANTO', '085788393766', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(205, '0099914539', '$2y$10$gisiEPayJvnk7I.qcWF.4O4Ww82/Az3RS8UAEiBjID7j6NAsQSm6G', 'M. Ilham', 'Laki-Laki', '2009-12-15', 'Teluk Betung', 'Islam', '-', '-', 'Jl. Wolter Monginsidi No. 268, Talang, Kec. Teluk Betung Selatan', 'Agusmansyah', '-', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(206, '0109832276', '$2y$10$BL.Am66yIrWkefzOxg4FEuxCb2Asekc3HhMFl14AMuGSHhLmtKDzC', 'M. MARCVELL ADITIA', 'Laki-Laki', '2010-05-31', 'BandarÂ Lampung', 'Islam', '089504338060', '-', 'JL. P. TIRTAYASA, CAMPANG RAYA, Kec. Tanjung Karang Timur', 'SETIO MURJOKO', '089504338060', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(207, '0105257641', '$2y$10$mXjxSC4nuI48MJNvfdzaQ.RbaKBPPniUCRMLT13NjTh5D3nBXcee6', 'M. RAFA ARJUNATAN PRATAMA', 'Laki-Laki', '2010-04-25', 'BandarÂ Lampung', 'Islam', '082289354822', '-', 'JL IKAN SEPAT GG. EKA JAYA LK. III, KUPANG KOTA, Kec. Teluk Betung Utara', 'DEDE HARIYANTO', '082289354822', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(208, '3080687905', '$2y$10$fOEnr8DxQQo9vHpZqLj6MuFgIKSndwC8J3D2XEeow/DkHwA99JOPK', 'M. RAKA', 'Laki-Laki', '2008-12-17', 'BandarÂ Lampung', 'Islam', '-', '-', 'JL. MS. BATU BARA GG. KENANGA NO. 38, Kupang Teba, Kec. Teluk Betung Utara', 'IIS BADRIAH', '-', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(209, '0098663936', '$2y$10$mHYPIIx7iek/w8RE1aKZqecuJpgrGJk4/AKTW9JYfVu/OuoPZpsoG', 'M. RIZQI BAHRUDIN', 'Laki-Laki', '2009-07-23', 'Teluk Betung', 'Islam', '083170620338', '-', 'JL. IKAN KITER GG. RAWA JAYA, KANGKUNG, Kec. Bumi Waras', 'BAHRUDIN', '083170620338', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(210, '0095597451', '$2y$10$rWZbzvrXw.9v85giGJt6.uzdqHqMf9ZyvTy1K9OJmEnEAvSskt0LO', 'M. SOBIRIN DEKO P', 'Laki-Laki', '2009-12-14', 'BandarÂ Lampung', 'Islam', '0895636204592', '-', 'JL. IKAN KAPASAN N0.19 LK I, Desa/Kel. Kupang Raya, Kec. Teluk Betung Utara', 'SABIN', '0895636204592', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(211, '0088724540', '$2y$10$Wx0ebU0NTLfPpjZsdwRVV.sDiVe5/s68mxt.twJ0k2CLYT6lcDIie', 'M. SYACRIEL PRATAMA', 'Laki-Laki', '2008-01-27', 'BandarÂ Lampung', 'Islam', '-', '-', 'JL. YOS SUDARSO GG. KETAPANG, SUKARAJA, Kec. Bumi Waras', 'SYAIFUDIN', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(212, '0108135616', '$2y$10$qHIDmJhDFtqNBX48PdZahesaBEDZ7Zj5qmwQCqJxjfJI2dtLJ/8Rm', 'M. Verdi Abdurrohman', 'Laki-Laki', '2010-12-21', 'Teluk Betung', 'Islam', '083147365274', '-', 'Jl. Drs. Warsito Gg. Rajabasa No. 18 Lk. I, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'Endang Supriyatna', '083147365274', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(213, '0088983854', '$2y$10$j5bEqo30maVYDkZJFd1V5eURMDkstOkNjC0Gr5Enjpx23TW3/9HXq', 'M.BAGAS FERIYANSYAH', 'Laki-Laki', '2008-12-11', 'Teluk Betung', 'Islam', '089632114148', '-', 'JL. IKAN LAYUR NO.2C LK II, Desa/Kel. Teluk Betung, Kec. Teluk Betung Selatan', 'FREDY HARYANTO', '089632114148', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(214, '0106358491', '$2y$10$tWtYtW//oncUuqjpnhf1/Oo1RFTlWOVz7lJPLVfbiYCNN8C4RSQ6K', 'M.IQBAL FIKRIANSYAH', 'Laki-Laki', '2010-05-20', 'Teluk Betung', 'Islam', '085736532487', '-', 'JL.GUNUNG KRAKATAU NO.02, KUPANG KOTA, Kec. Teluk Betung Utara', 'ERWIN NOVIANSYAH', '085736532487', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(215, '0106882781', '$2y$10$SRECTiPJnFtO4VocnO1LWeaGSbStQLvQYkIc7NrsDPlIRY1mQM/cW', 'MAHARAJA SURANTA K.', 'Laki-Laki', '2010-08-02', 'BandarÂ Lampung', 'Islam', '082376880166', '-', 'JL.T.PERAHU GG.GN.AGUNG NO.3 LK.II, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'MERU K.', '082376880166', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(216, '0093749450', '$2y$10$WuFitYU5QvcMZJxALguIOOE2HOWS2mPFe5lNNcSX1E1YCYpjo0.vO', 'Maharani Asri', 'Perempuan', '2009-12-27', 'BandarÂ Lampung', 'Islam', '0895609702477', '-', 'Jl. Hasanudin Gg Kantor Pos No. 26, Gunung Mas, Kec. Teluk Betung Utara', 'Fayumi', '0895609702477', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(217, '0091405566', '$2y$10$UiJ.IG0k0VAHXB463UG4bek4usuANXJQjZU75EdKLN2ERzHlnBNeO', 'MAIRANITA', 'Perempuan', '2009-05-25', 'SENDANG AYU', 'Islam', '089506018730', '-', 'JL. YOSSUDARSO GG. KETAPANG LK I, SUKARAJA, Kec. Bumi Waras', 'AGUS WALUYO', '089506018730', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(218, '0094034733', '$2y$10$EQRG3/zw94mR8LbBJbx74uo2NRFTS9Xnx1bbAAbnV1G9FS7kpJM4q', 'MALIK JALALUDIN', 'Laki-Laki', '2009-12-13', 'BandarÂ Lampung', 'Islam', '-', '-', 'JL. YOS SUDARSO GG. M. AGUS LK. I, BUMI WARAS, Kec. Bumi Waras', 'AHMAD ALI', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(219, '0097046299', '$2y$10$7oG2u7UblEjmxoK1jovGsOTzuSdMS0OGFAy6IlMhvoqCTIg3KMBMe', 'MALIK RIDWAN', 'Laki-Laki', '2009-08-21', 'BandarÂ Lampung', 'Islam', '088269336374', '-', 'JL.YOS SUDARSO KANGKUNG DALAM, Desa/Kel. Kangkung, Kec. Bumi Waras', 'SUKARJA', '088269336374', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(220, '0095527400', '$2y$10$/MlOvdB7PCB2o1oWpL2Bm.QW/ukgWXkl4Qmw92oV20c5/Jcuu/kTe', 'Marcellino', 'Laki-Laki', '2009-03-14', 'Teluk Betung', 'Islam', '-', '-', 'Jl Ikan Tembakang Lk II, Sukaraja, Kec. Bumi Waras', 'Fajar Santoso', '-', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(221, '0091011464', '$2y$10$vuHNK10q3nqYF.XlyUHFDuOLoFv4vAJSUt.54vsWUnOpHJ7slNTma', 'Marissa Anandiaz', 'Perempuan', '2009-02-05', 'Tanjung Karang', 'Islam', '089632790401', '-', 'Jl. Hasanudin No 42, Gunung Mas, Kec. Teluk Betung Utara', 'Adi Prasetyo', '089632790401', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(222, '0116090559', '$2y$10$HawuOSTXKvSd3a979ShWBuOfB2bx/YdsMjc5Y8QoPKDLrARsfPemW', 'MARTIAH', 'Perempuan', '2011-03-09', 'Teluk Betung', 'Islam', '0895601766166', '-', 'JL YOS SUDARSO ,M. AGUS LK I, Desa/Kel. Bumiwaras, Kec. Bumi Waras', 'JUNITUN', '0895601766166', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(223, '0096616582', '$2y$10$bxbqLeuVDXb2dFcFVawOy.itTslGGw/.7cdSgBI2mwzhP02en1knC', 'Marvel Catur Daloga', 'Laki-Laki', '2009-03-10', 'BandarÂ Lampung', 'Kristen', '085838202635', '-', 'Jl. Drs. Warsito Gg. Semeru No. 17, Kupang Kota, Kec. Teluk Betung Utara', 'WIDIONO', '085838202635', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(224, '0092807711', '$2y$10$ooh9R/hfLgSHqe9T2cakhepaUhL4lo6AfXBYXNmlRQFVVr8AVMDrq', 'Marvelino Ramadhan', 'Laki-Laki', '2009-08-26', 'BandarÂ Lampung', 'Islam', '082372629606', '-', 'Jl. Drs. Warsito Gg. Tanggamus No. 23, Sawah Lama, Kec. Tanjung Karang Timur', 'Moreno Afriandi', '082372629606', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(225, '0102217507', '$2y$10$lTYtx.Ui7zog/sBIh/03RuJFCs2CDUBWskwGORSbmsaKYshNalSAe', 'Mas Nabil Alwali', 'Laki-Laki', '2010-07-27', 'BandarÂ Lampung', 'Islam', '082183483946', '-', 'Jl. Drs. Warsito Gg. Tanggamus No. 24A, Desa/Kel. Kupang Teba, Kec. Teluk Betung Utara', 'M. Tubi Apriyandi', '082183483946', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(226, '0102246713', '$2y$10$Xnt8gONIqU24pMkHWjLc5O/Xogo1ec8iw0jsjaanHf292jF1STfjm', 'Mas Rafki Pratama', 'Laki-Laki', '2010-10-12', 'BandarÂ Lampung', 'Islam', '082175215218', '-', 'JL. IKAN SEPAT GG EKA JAYA LK III, Desa/Kel. Kangkung, Kec. Bumi Waras', 'Mastuhi', '082175215218', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(227, '0083182603', '$2y$10$E3zoUS.BPv/6tFfiNrmqDO51yyl0yVgbQaD4h3jP7Gb1x74VgVvRW', 'Mas Zaki Naufal', 'Laki-Laki', '2008-10-17', 'BandarÂ Lampung', 'Islam', '-', '-', 'Jl. Drs. Warsito Gg. Tanggamus No. 24A, Kupang Teba, Kec. Teluk Betung Utara', 'Mas Tubi Apriyandi', '-', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(228, '0074513701', '$2y$10$9Y8SU9H3xDa2yHfMvlUdlentWJ4Ou.U.Ywzi8.FNsCmP/SZkIeLri', 'MAULANA', 'Laki-Laki', '2007-03-27', 'BandarÂ Lampung', 'Islam', '085366099758', '-', 'JL.IKAN KITER, KANGKUNG, Kec. Bumi Waras', 'A.TARMIDI', '085366099758', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(229, '0084213751', '$2y$10$XX/S4/OFgM8SubJDPKPyOeVpdIjjslKK2MobsgX3UFCXvozOu1G66', 'Maulana Al Fazri', 'Laki-Laki', '2008-11-02', 'Sekampung', 'Islam', '089689025781', '-', 'Jl. Tangkuban Perahu No. 27 Lk. I, Kupang Kota, Kec. Teluk Betung Utara', 'Suyanto', '089689025781', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(230, '0091094318', '$2y$10$/j7rdD1qc/l0T/YnXnLKMuPplOVHnevpP2rVqGfNw/KcC4aSIlY9G', 'MAULANA FAJRI', 'Laki-Laki', '2009-05-24', 'BandarÂ Lampung', 'Islam', '-', '-', 'IKAN TERBANG LK I, BUMI WARAS, Kec. Teluk Betung Selatan', 'ZAINAL ABIDIN', '-', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(231, '0094081046', '$2y$10$LL65NWi0rRVmWqHn5TBpYOyD8RGWrkCgbUkyzvNKLy9QyXv02wItS', 'Maulidia Safitri', 'Perempuan', '2009-03-18', 'BandarÂ Lampung', 'Islam', '083179519780', '-', 'Jl Ikan Tembakang Lk II, Sukaraja, Kec. Bumi Waras', 'Ahmad Suwardi', '083179519780', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(232, '0116319254', '$2y$10$MNUXNggBFkfGf4b47E/0be3UxbuNJpFew6TYFewynlmPhnL5TOdn.', 'Mega Regita Cahyani', 'Laki-Laki', '2011-02-27', 'BandarÂ Lampung', 'Islam', '0883867843246', '-', 'Jl. Gn. Krakatau No. 9, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'Jumadi', '0883867843246', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(233, '3119760843', '$2y$10$ueqJsp9.K9EIYN4h8bA9luuAAAA2ZpXW2YdlauNVjwriIdvwEMl6u', 'Meisya Anggraini', 'Perempuan', '2011-05-11', 'BandarÂ Lampung', 'Islam', '089630058890', '-', 'Jl. Tangkuban Perahu No.10 LK I, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'YUSDI', '089630058890', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(234, '0089006339', '$2y$10$.Ai2oh5uvjnLFQZbg2opPOGtHKv6ZibRB/s5JzKp.bqcRaZAWaj76', 'Melinda Puji Lestari', 'Perempuan', '2008-05-30', 'Teluk Betung', 'Islam', '0895609933837', '-', 'Jl. Imam Bonjol, Langkapura, Kec. Langkapura', 'Yusmaidi', '0895609933837', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(235, '0091019875', '$2y$10$7W10d8fxWyF4dERYs3FR1.h.Cxfyb9GaKG/2HRclL1VmnDeg1ROzW', 'MELIYA SARI', 'Perempuan', '2009-05-08', 'BandarÂ Lampung', 'Islam', '-', '-', 'JL. M. AGUS NO. 10 LK I, BUMI WARAS, Kec. Bumi Waras', 'A. FASUNI JA', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(236, '0098189936', '$2y$10$nGpDg2KUx64njeplEp4WrOFHVDW3kE9.PBtycQz8VdZnA9uBkRuF6', 'METTA CITRA LESTARI', 'Perempuan', '2009-01-01', 'BandarÂ Lampung', 'Islam', '085769738676', '-', 'Jl. Ikan Tembakang, Sukaraja, Kec. Teluk Betung Selatan', 'TUGIONO', '085769738676', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(237, '3107595343', '$2y$10$OIblyzJC9Nf.PbuMW5xWYekBG//UVqSXhZ8kndjE3PU1FZx62RxUi', 'MITHA ANGGRAINI', 'Perempuan', '2010-05-29', 'BandarÂ Lampung', 'Islam', '085267907894', '-', 'JL WR MONGINSIDI GANG MADRASAH, Talang, Kec. Teluk Betung Selatan', 'Anwar Sahadat', '085267907894', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(238, '0107051724', '$2y$10$xH9ldXUrVNVso.N15lc0lOAD8bnZn8WvIxc82iqrzeleISQ5Hw1Ve', 'MUFADHAL HAFIZ HIDAYAH', 'Laki-Laki', '2010-06-29', 'BandarÂ Lampung', 'Islam', '089634264336', '-', 'JL. DRS. WARSITO GG. TANGGAMUS, KUPANG KOTA, Kec. Teluk Betung Utara', 'MULYONO', '089634264336', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(239, '0091996737', '$2y$10$.SvAYYj3Djkqp4v5mHQLaOrXWGcnvWt0S6KzkhnSy31jdMVFHP52y', 'MUGI PANGESTU', 'Laki-Laki', '2009-05-08', 'Teluk Betung', 'Islam', '089503264730', '-', 'Jl. RW. Supratman Gg. P Mas No. 18, Gunung Mas, Kec. Teluk Betung Selatan', 'M. Nasir', '089503264730', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(240, '0106227120', '$2y$10$2RWV0v8/V89rVDowPSk0uOjQisVmZNnUYQh0/UVYvUT7ONex1/z7O', 'Muhamad Abialdeva Farel', 'Laki-Laki', '2010-03-22', 'Teluk Betung', 'Islam', '08989210890', '-', 'MS. Batubara Gg. Melati No. 18, Kupang Teba, Kec. Teluk Betung Utara', 'Syaiful Rahman', '08989210890', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(241, '0105164041', '$2y$10$WUiO3bFK8ZhW00CRXhRTKebjzQniwH0NPQT7gd7U5koFd6nmhDWIm', 'Muhamad Afrizal', 'Laki-Laki', '2010-04-03', 'Tanggerang', 'Islam', '085267905623', '-', 'Jl. WR. Monginsidi Gg Manis No 44, Talang, Kec. Teluk Betung Selatan', 'Sutrisno', '085267905623', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(242, '0099846499', '$2y$10$XH9907kIIxNAYaGLxn5ZdOrrUUOPb6g/mc2irMxcFdu6LS4S5XvlC', 'MUHAMAD ALI FAKHRI', 'Laki-Laki', '2009-10-03', 'Teluk Betung', 'Islam', '-', '-', 'JL WR MONGINSIDI GG MURAI 08, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'DAPARI', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(243, '0084189741', '$2y$10$gm31N5TOKVqlvv/4ufQzje0MfeUqn5FrJD3uwXFAdKxHZtys850OW', 'Muhamad Bilal Altiano', 'Laki-Laki', '2008-07-27', 'BandarÂ Lampung', 'Islam', '081271713070', '-', 'Jl. Tangkuban Perahu No. 25, Kupang Kota, Kec. Teluk Betung Utara', 'Deno Juni Yadi', '081271713070', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(244, '0107930025', '$2y$10$Hgd7MSHhCQ8hUEWUUniBTOMmyxQh2ekgRP6CmTvQ2OMeAXJ21NQty', 'Muhamad Fadli Saputra', 'Laki-Laki', '2010-05-14', 'BandarÂ Lampung', 'Islam', '088269020148', '-', 'Jl. Wr. Monginsidi No. 10 Lk. II, Kupang Kota, Kec. Teluk Betung Utara', 'Saryani', '088269020148', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(245, '0095648133', '$2y$10$LfUelt2ey.pQe5qZdep1oOXKgx5pJjiiK3C.O8z7kw8njVXJLQ68a', 'MUHAMAD FAHRI', 'Laki-Laki', '2009-05-14', 'Teluk Betung', 'Islam', '088287143487', '-', 'JL. PATTIMURA Gg. Guntur No. 05, KUPANG KOTA, Kec. Teluk Betung Utara', 'ANDI YUSAK', '088287143487', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(246, '0117400387', '$2y$10$VyraclYvkohjhB9.7esq6OZZG8q5vG2omq2STpgBdCyc0o4ZD2iqe', 'Muhamad Fatir', 'Laki-Laki', '2011-07-01', 'BandarÂ Lampung', 'Islam', '0895383114873', '-', 'Jl. Wr. Monginsidi Lk. II, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'Sukirno', '0895383114873', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(247, '0095326393', '$2y$10$lP.KeZnLP4x3BF78VhcfyudkiObhAmrWNEifKRtPAjJch7NE1f9bS', 'Muhamad Haikal Davi', 'Laki-Laki', '2009-09-28', 'BandarÂ Lampung', 'Islam', '08990720040', '-', 'jl. tangkuban perahu gg. pepandaian no. 2/12, teluk betung, Kec. Teluk Betung Selatan', 'adi agus pribadi', '08990720040', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(248, '0107057275', '$2y$10$cRwqYgBmyDtJ/WtqB21oZuEwwMci3RYgzKKBVeKr5Z96bUFOJgr92', 'MUHAMAD RISKI AL FATIR', 'Laki-Laki', '2010-11-25', 'BandarÂ Lampung', 'Islam', '085273871011', '-', 'JL. YOS SUDARSO GG M. AGUS, Desa/Kel. Bumiwaras, Kec. Bumi Waras', 'SIGIT KAMSENO', '085273871011', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(249, '3108532683', '$2y$10$ZNn5sE4S3rttco51a4ujdOyKnBkOMukF5ZZCVpiveXWx7BnMj1ypW', 'MUHAMMAD AL HAFIZH', 'Laki-Laki', '2010-10-28', 'BandarÂ Lampung', 'Islam', '081369463671', '-', 'JL MS BATU BARA GANG MELATI NO 32, Kupang Kota, Kec. Teluk Betung Utara', 'Muhammad Ridwan', '081369463671', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(250, '0094733359', '$2y$10$A.7EllpUHX.WS0bOErypSenAKMc8gA5QTTXUbMIYntx5EVS0el/XK', 'Muhammad Aqil Affandi', 'Laki-Laki', '2009-11-03', 'BandarÂ Lampung', 'Islam', '0895411226948', '-', 'Jl. Hasanudin No.06 LK.II, Gunung Mas, Kec. Teluk Betung Utara', 'Irwanto', '0895411226948', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(251, '0115403964', '$2y$10$fB.ZSHXUOGQqdS/bPAEgc.FvqTNdjPli8Oq163uSjpukJnKyMfQUG', 'Muhammad Arda Ramadhan', 'Laki-Laki', '2011-08-08', 'BandarÂ Lampung', 'Islam', '083879805179', '-', 'JL. LAKS. MALAHAYATI GG PERMATA NO.08 LK I, Desa/Kel. Teluk Betung, Kec. Teluk Betung Selatan', 'Nurdeni', '083879805179', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(252, '0108109109', '$2y$10$07u2jXKX8.nP1wy7mM0lNeIwfOsFNgEJw4Ukczx4lpHJ3Ck9TYWzi', 'Muhammad Brama Lesmana', 'Laki-Laki', '2010-09-13', 'BandarÂ Lampung', 'Islam', '081271189743', '-', 'Raya Panjang-Suban, Merbau Mataram, Kec. Merbau Mataram', 'Banyu Purwanto', '081271189743', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(253, '0108797787', '$2y$10$F0uORDajBopkXw9PQPLuoulXurP37Z6jqpbXE6.AervsxqEbS8rU2', 'Muhammad Caesar', 'Laki-Laki', '2010-04-30', 'BandarÂ Lampung', 'Islam', '0895604266289', '-', 'Jl. Tangkuban Perahu Gg. Manggis 97 LK II, Kupang Kota, Kec. Teluk Betung Utara', 'Y. Irwansyah', '0895604266289', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(254, '0093584215', '$2y$10$9s/4Hu5ugPgsshzUNLWlxeiyLqSXAla5Wy6P7WznfdVGyy3DCd7GK', 'MUHAMMAD DAFFA IKHROM', 'Laki-Laki', '2009-06-02', 'Teluk Betung', 'Islam', '082285213566', '-', 'JL. IKAN KITER, KANGKUNG, Kec. Bumi Waras', 'QORAMULLAH', '082285213566', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(255, '0102446242', '$2y$10$dwmZZSnECzbAFVXpe82WDOxcADR1Lrysr5AeQKAXCbQnlXqcuPiW2', 'MUHAMMAD DECO SYAHPUTRA', 'Laki-Laki', '2010-05-10', 'BandarÂ Lampung', 'Islam', '085798025859', '-', 'JL. IKAN SELAR LK I, SUKARAJA, Kec. Bumi Waras', 'JOHANSYAH', '085798025859', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(256, '0108061847', '$2y$10$wqu4vSQxaE2RuIKwd3msz.cZwOAcPy5Nmz9rGWC/8RABcuSicIjki', 'Muhammad Dzaki', 'Laki-Laki', '2010-02-05', 'Teluk Betung', 'Islam', '083153257013', '-', 'Jl. Hasanudin Gg. Kantor Pos No.30, Gunung Mas, Kec. Teluk Betung Selatan', 'Sugiono', '083153257013', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(257, '0117480564', '$2y$10$C0BBjLnepC/VVmpE7b/1AOGbX8m7qJr.j8rKHelcuyOXXCtRMAVSC', 'ANGELA EKA KINARA LARASATI', 'Perempuan', '2011-01-15', 'SERANG', 'Katholik', '0895397122090', '-', 'JL. DRS. WARSITO GG SEMERU NO.9 LK II, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'PATRIKO TRI SUDARWANTO', '-', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(258, '0104579517', '$2y$10$AnjsjfnKAPoxb8V9tVHHD.eyR2t0JtxmAVYfAY.BH3H275RsFW3U2', 'ANGGA MANGGALA', 'Laki-Laki', '2010-01-09', 'Bandar Lampung', 'Islam', '083160137083', '-', 'Gg masjid No. 33-F Lk II, Teluk Betung, Kec. Teluk Betung Selatan', 'NIRWANSYAH', '-', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(259, '3092997434', '$2y$10$Kz9kMGiFIQCG6jFQoQMx2O6wDdAg8Yqf10D1/YHR1upCkggLUtvYO', 'ANNA VIVIA AL HUJA', 'Perempuan', '2009-11-28', 'Bandar Lampung', 'Islam', '-', '-', 'Jln. Ahmad yani no 3, PALAPA, Kec. Tanjung Karang Pusat', 'HUJATULLAH', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(260, '3107688533', '$2y$10$J2lwvrV1237zkFjvl8SJBO3mZEu.CDfPAprFg6eHpxCgxx1HwbM7a', 'ARFAHRI ADE CHANDRA', 'Laki-Laki', '2010-02-22', 'Bandar Lampung', 'Islam', '085840336591', '-', 'Jl Wr Supratman Aspol Polda Block G/3, Kupang Kota, Kec. Teluk Betung Utara', 'Heri Chandra', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(261, '0083435497', '$2y$10$UeTZcZbvE2LHF/Q67x5w9O1nRPLBsFNpbs83Y1GNZTzyKkm/wM3Kq', 'Aril Revan Setiawan', 'Laki-Laki', '2008-07-20', 'Bandar Lampung', 'Islam', '085695840818', '-', 'Jl. Gunung Krakatau No. 13, Kupang Kota, Kec. Teluk Betung Utara', 'Udin', '-', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(262, '3111236582', '$2y$10$8bgfgGTw.ppzCM4gW6kZYe.aL6KuxWcDT6JCcF5UA5p5WxNC/oIey', 'ARJUNA PUTRA WIJAYA', 'Laki-Laki', '2011-07-28', 'Bandar Lampung', 'Islam', '081368089365', '-', 'JL. RW MONGINSIDI GG. MADRASAH NO.87 LK1, Desa/Kel. Talang, Kec. Teluk Betung Selatan', 'VICTOR HADIWIJAYA', '-', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(263, '0117623442', '$2y$10$gs3KpnbqN4ZMf4SIoLicc.QPw1Git3UdZsBftID5TPgJ79wZaBsYq', 'Armansyah', 'Laki-Laki', '2011-01-03', 'Teluk Betung', 'Islam', '082246442150', '-', 'Jl. Drs. Warsito Gg. Semeru, Kupang Kota, Kec. Teluk Betung Utara', 'Alif Farid', '-', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(264, '0105884207', '$2y$10$.mZGdGHVEIJ8OzcycaUSV.2FOdmBxJMAPN88lc/SJ9KjtW36TwSXu', 'ARROKHIT AL-HABSYI', 'Laki-Laki', '2010-07-04', 'Bandar Lampung', 'Islam', '088276321157', '-', 'JL. MAGUS NO 35 LK I, Desa/Kel. Bumiwaras, Kec. Bumi Waras', 'LADEDI', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(265, '0112053938', '$2y$10$F2yYQyS.Y2zFhNWJAW9UkuqycaPYEAsPC38AGs4aZOfWwgO6jyxEe', 'ARSYAH DAFFAREL', 'Laki-Laki', '2011-01-23', 'TANJUNG KARANG', 'Islam', '089510672486', '-', 'JL. YOS SUDARSO GG. IKAN SELAR LK I, SUKARAJA, Kec. Bumi Waras', 'IRDIANSYAH', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(266, '0104693414', '$2y$10$sPtpdSzbPUJ83ba8zNlSkOwdGoTUNQrkEKoja6fKupmV/pJKZDs.K', 'Arya Dinata Sanjaya', 'Laki-Laki', '2010-05-09', 'Bandar Lampung', 'Islam', '081367742759', '-', 'WR. Monginsidi Gg Aslim No 18, Talang, Kec. Teluk Betung Selatan', 'Hendra Sanjaya', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(267, '0082220394', '$2y$10$z732LHrdHIXIr625PgmJu.PunUaXCrxMni5T8qFvCRurAgj9TK0Ni', 'ARYA GHANI WIBOWO', 'Laki-Laki', '2008-12-15', 'Bandar Lampung', 'Islam', '089650969023', '-', 'JL.Teluk Ratai Perum Waway Blok A2, Lempasing, Kec. Padang Cermin', 'Arie Pragia', '-', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(268, '0117235789', '$2y$10$Xxtlot7BpmkD9vG4ywzt5ukI53GNeFEi9Oxm0/5nL2bvUdgbpVrZi', 'Asyifa Rama Aulia', 'Perempuan', '2011-06-24', 'Teluk Betung', 'Islam', '085266863331', '-', 'Jl. Gn. Krakatau No. 8 Lk. I, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'Ahmad Kodri', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(269, '0092962087', '$2y$10$R5jaiLFEDyjlUwFj0oC8oe4TKdPw..LHvLz6mMgdcVpKv76.Nj5JW', 'ATA NAUFAL RADENA', 'Laki-Laki', '2009-07-20', 'Bandar Lampung', 'Islam', '081369261821', '-', 'JL. WR. SUPRATMAN GG. SETIA BUDI N0.12 LKI, KANGKUNG, Kec. Teluk Betung Selatan', 'SUDJANA', '-', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(270, '0103512494', '$2y$10$UA3Eql7YOQEdeuto5EZU3OytaQVXKo9nj3rjO90R/YcpNmc1ji7Vu', 'Aulia Syafitri', 'Perempuan', '2010-10-09', 'Bandar Lampung', 'Islam', '085664612440', '-', 'Jl. Drs. Warsito Gg. Rajabasa Lk. I, Kupang Kota, Kec. Teluk Betung Utara', 'Hambali', '-', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(271, '0101901766', '$2y$10$.NmQcSJt1jvM/ix617U3I.sCZRtf.dmBbpAFJ.qOUBQywKXVut9OW', 'AURA NABILA', 'Perempuan', '2010-05-02', 'BOGOR', 'Islam', '085838188168', '-', 'JL. WR SUPRATMAN N0.32 LK I, Desa/Kel. GUNUNG MAS, Kec. Teluk Betung Selatan', 'KEMAS ABDUL HAMID ADE FREY', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(272, '0092742856', '$2y$10$AS2/gsU7yx2eW0H7anRV7u8ACbeBb6OxfHlcdUg5.sXkFjaAeAtDW', 'Robbi\\\'ahtuladawiyah', 'Perempuan', '2009-03-30', 'BandarÂ Lampung', 'Islam', '', '-', '', 'Siti Latifah', '-', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(273, '0079054893', '$2y$10$G/Y.Ps.zYRSZJAXtLGzbpeGzRkUQJNxLvGKBLozuhg6HLNL6qw79i', 'ROBBY', 'Laki-Laki', '2007-07-31', 'BandarÂ Lampung', 'Islam', '', '-', '', 'SUKARDI', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(274, '0107513841', '$2y$10$YD0q4QRG1EYkCZZgwAiR2.lfu6wYeWUJGn8AY5.6pCOI9DOAjre4W', 'ROMEO ARTHAWIJAYA', 'Laki-Laki', '2010-09-17', 'BandarÂ Lampung', 'Islam', '', '-', '', 'DONI SURYANTO', '-', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(275, '0091347671', '$2y$10$uDJl0oDlrdf.qH8NCT3QuO2cF804Ddb3T3qMebKslLrliSYOwhOVa', 'Sahira Nur Ramadhani', 'Perempuan', '2009-09-09', 'BandarÂ Lampung', 'Islam', '', '-', '', 'Edwin Salfani', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(276, '0102154711', '$2y$10$FBqiab56mqxaFc8dAMYkjOx.zOZhabzcvH/yz6qnrzLDFa7IPxuM.', 'Sakil', 'Laki-Laki', '2010-07-18', 'Bandar Lapung', 'Islam', '', '-', '', 'Hariyanto .Alm', '-', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(277, '0081850381', '$2y$10$jFNWRrmVrH6SagXJhWBBK.f3E0dfac2CBGdYPSYrB93i9djahUKPm', 'SAKINAH ASTARI', 'Perempuan', '2008-12-18', 'TELUK BETUNG', 'Islam', '', '-', '', 'SYAFEI', '-', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(278, '0097456867', '$2y$10$wQ/H0M2svLilgjspzJB8S.JgmZbppSsFG8c0DNpNbNC0FjrjmL2PK', 'SALSA NAZWA AULIA', 'Perempuan', '2009-12-12', 'TELUK BETUNG', 'Islam', '', '-', '', 'YUSEP MUCHLIS', '-', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(279, '0092751235', '$2y$10$AtUqQalZWcRxvpBx3.xMF.vXq7Jq25J3KgE7mMwTcFym5lk9IVtcq', 'Salwa Gustiar ribi', 'Perempuan', '2009-08-24', 'BandarÂ Lampung', 'Islam', '', '-', '', 'Robi anwar', '-', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(280, '0108615739', '$2y$10$4KfjWVKWtgbSxl9qto5uiOdin30A8NnczFB64sgJq1tUOYdlfnPNy', 'Salwa Nailah', 'Perempuan', '2010-06-11', 'Bekasi', 'Islam', '', '-', '', 'Bambang Bundoro', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(281, '0087538505', '$2y$10$enR/Ry.Ksk6u41gLDyuncOfp1v.WhetZvPaLRw8.6TP9BpGbHw3GC', 'Sandi Yusup Septiansyah', 'Laki-Laki', '2008-09-05', 'Gunung Sugih', 'Islam', '', '-', '', 'antoni', '-', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(282, '0096765778', '$2y$10$pZyshpbF7x7V9Te645BZXOF0nM/yiB2d8cMNNAyYO2y4UFbcUXQhS', 'SASCIA FEBRIYANTI', 'Perempuan', '2009-02-03', 'BandarÂ Lampung', 'Islam', '', '-', '', 'FAHNI GUNAWAN', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(283, '0091517646', '$2y$10$RghHHjwfSTOtmsACkhW42uT1v0djuDzfKxS8yYhGbSb0O5hIihc1y', 'SATRIO BINTANG ADITIAN', 'Laki-Laki', '2009-01-13', 'TANJUNG KARANG', 'Islam', '', '-', '', 'SUPRIADI', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(284, '0117849499', '$2y$10$RdD5/aPX3M9nMBOIYfueQOitLaC2j9Q5JvUNeyGDtz2v.aiXBFuvi', 'ZASKIA APRILIA', 'Perempuan', '2011-04-18', 'BandarÂ Lampung', 'Islam', '', '-', '', 'NURMAN SHARONI', '-', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(285, '0087645170', '$2y$10$suuakZuFz7d7rDwPgUHITeacSMNWFZZvbicMm2n47JYKRkZmIpnVO', 'ZAKA DIMAS SADEWA', 'Laki-Laki', '2008-12-12', 'BandarÂ Lampung', 'Islam', '', '-', '', 'MUHAMAD LUTFI', '-', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(286, '0096940219', '$2y$10$gpErxZVXZxiGQ3b3j1oYZOR0FGSR7BwvPtKQlf5i/zA5I7IDJQ5ku', 'Zahra Saskia Putri', 'Perempuan', '2009-08-20', 'BandarÂ Lampung', 'Islam', '', '-', '', 'Majani', '-', 2021, '8D', 'default-profile-picture.jpg', 'Aktif'),
(287, '0096900725', '$2y$10$m/9cn4sa5Du/pOSoJTZHfejiiacRKkDXxztha9.PrRvMUn2vtrlKW', 'ZACKY WAHYU WAHIDIANSYAH', 'Laki-Laki', '2009-10-12', 'BANJAR NEGARA', 'Islam', '', '-', '', 'Hendry Surya Permana', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(288, '0108579492', '$2y$10$WLJSJ.99wwlQtHB4Cqg0T.MtUyeKNnbwErhqL8uCVHbamUSqN9ib2', 'Yulia Rahmawati Dewi', 'Perempuan', '2010-03-21', 'Teluk Betung', 'Islam', '', '-', '', 'Maridi', '-', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(289, '0119442608', '$2y$10$m4Ul04ei9XU8xrsxpANYcuQicaSBDTcRMShbNMwymH.5U4S5IW.wK', 'Yasmine Fachira Tsarwa', 'Perempuan', '2011-01-14', 'BandarÂ Lampung', 'Islam', '', '-', '', 'Ferry Zulfikar', '-', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(290, '0107820330', '$2y$10$h.D2xfcJYRySNLPd.7VjbeJCE.uoYYUA5/TWrgdkykhp8zhthYuau', 'YARIS KURNIAWAN', 'Laki-Laki', '2010-04-19', 'BandarÂ Lampung', 'Islam', '', '-', '', 'SUYATMAN', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(291, '0111740598', '$2y$10$JVUhyXgwEpiY3rf2YXkH4euTOLrg57ECbHTQUfjA0P7GFfD10p6R.', 'YAFI LUKMAN NUL HAKIM', 'Laki-Laki', '2011-07-18', 'TANJUNG KARANG', 'Islam', '', '-', '', 'SA\\\'IN', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(292, '0094483576', '$2y$10$nOwfj9jSAyYjlKjbvXL14u90PIsVaYxXqAmXJFfgdfRbku47wu.XG', 'WINDI PRICILIA PUTRI', 'Perempuan', '2009-11-04', 'BandarÂ Lampung', 'Islam', '', '-', '', 'DIDI SETIAWAN', '-', 2023, '9A', 'default-profile-picture.jpg', 'Aktif'),
(293, '0117960703', '$2y$10$h3I4Yo12to4vmfLiEmnR8e/RknAJwR/iZlVmhTaw8oQhB/TXJxeLu', 'Wika Aisya', 'Perempuan', '2011-03-25', 'BandarÂ Lampung', 'Islam', '0899912339491', '-', '', 'Fayumi', '-', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(294, '0118333786', '$2y$10$o7fDvdSlYcIWmAyVNe6rz.M5fxrMROxIiE0E.9yHgdCkQuWRiK3wO', 'WENING TYAS CAHYANING SANI', 'Perempuan', '2011-02-28', 'BandarÂ Lampung', 'Islam', '', '-', '', 'JEPRI SANI', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(295, '0094704899', '$2y$10$.oHeIPT84BkznkCIq/O3LOyjLtxdLnJJ42Rhn6umaDd2WbqeXkXiy', 'WAWAN CAHYA WIRA', 'Laki-Laki', '2009-02-20', 'TELUK BETUNG', 'Islam', '', '-', '', 'EFENDI', '-', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(296, '0106551039', '$2y$10$tlHWtficRQSXuIDyqoUzuO.eShOTV53A2L05IgWgyBojYynZRs3hS', 'Vira Cahyati', 'Perempuan', '2010-03-11', 'Majalengka', 'Islam', '', '-', '', 'M. Tatang', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(297, '0093908011', '$2y$10$RWOp.hWHt9t/8FHDD3aOmOS5gw6qZMH3m/n/SGNh2w0q2WHNpriAO', 'Viona Aulia Fajrina', 'Perempuan', '2009-04-02', 'Sidorejo', 'Islam', '', '-', '', 'Ainul Fajri', '-', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(298, '0113583792', '$2y$10$HxtrUi28U5pNT5u1NjgnVetV6Yj62facmV65HOfto04b51tqiKh2S', 'VINO AGUSTIAN', 'Laki-Laki', '2011-08-06', 'GROBOGAN', 'Islam', '', '-', '', 'AGUS WAHYUDI', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(299, '0096603561', '$2y$10$KkU5/UrPZdIZlpOTOHfz4enqiOCIpm3p8em5gR9PLuRiC8y23yqyW', 'Vidia Cantika', 'Laki-Laki', '2010-01-08', 'Teluk Betung', 'Islam', '', '-', '', 'Muhammad Rijal', '-', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(300, '0109354146', '$2y$10$eyJPLrlDwu7Kshun1xEJROVLtdcobF7rqKViOqdsU5JyPi62MDxxa', 'Varissa Nayshila Alviani', 'Perempuan', '2010-10-19', 'BandarÂ Lampung', 'Islam', '', '-', '', 'Jamaludin', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(301, '0084418583', '$2y$10$7SxTSR54A.PFIEBH5IpyAuGZSv0D7h0xrQdRtXU2xIPrP1soEdlFq', 'VALENTRI MARSALIA', 'Perempuan', '2008-02-13', 'TELUK BETUNG', 'Islam', '', '-', '', 'WARSITO', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(302, '0107810758', '$2y$10$sdwigbu0cdaT2rAm6E0AV.Sh/4GmPc64Kw/vNKHj4cvqtvsQ.Q55S', 'Triyawati', 'Perempuan', '2010-11-21', 'Sukototo', 'Islam', '', '-', '', 'Waluyo', '-', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(303, '0118699996', '$2y$10$fzJQTimxl1Hz73pOTWzsNe/Xiq/EjY5yh55tA4v6NaeQXmC/YlrZq', 'TRIYA QURRATA AYUNN', 'Perempuan', '2011-06-03', 'TELUK BETUNG', 'Islam', '', '-', '', 'UJANG HINDARMIN', '--', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(304, '0071306498', '$2y$10$xeDRI17w3ahOZWe6SIrQpO4K6mQrYb5CFxiwpuZli8w6w27ZqQFyq', 'TRI YANTI', 'Perempuan', '2007-06-14', 'BandarÂ Lampung', 'Islam', '', '-', '', 'KUSAENI', '-', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(305, '0094595587', '$2y$10$3M7bmvbqYbTrGnb09bICmu24fCn4fUVZgqsEXTZoCIx91x0voiHey', 'TIARA VIOLITA', 'Perempuan', '2009-10-20', 'TELUK BETUNG', 'Islam', '', '-', '', 'M. AZIZ SETIAWAN', '-', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(306, '0098744951', '$2y$10$.H9YnGZn6786VEXvU.2slux391xE1HUhGZ04jWM6ZQxdj.DMl.eUC', 'TIARA LESTARI', 'Perempuan', '2009-02-19', 'TELUK BETUNG', 'Islam', '', '-', '', 'AMAT SAIPI', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(307, '0077002816', '$2y$10$yjstyhhb/lNg1RsQ9Zdcj.ZDS082fZhMlPD7puSFm2wowog9WIjCa', 'TIARA DUWI ANANDA', 'Perempuan', '2008-09-22', 'TELUK BETUNG', 'Islam', '', '-', '', 'WIDODO', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(308, '0103727807', '$2y$10$vqjcfs6vlRrewy3G7NQ1kug9TyCp7dbZuKIRCacs4WZ6PyuFNJMy6', 'SYIFA MAULIDA SAFITRI', 'Perempuan', '2010-09-20', 'TELUK BETUNG', 'Islam', '', '-', '', 'TOPAN LESMANA MADYA', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(309, '0098055279', '$2y$10$yeahOma7iZsxt9XGbBSY9ur.iSffxeAIG.4xaaH.kVvhC08Pt750a', 'Syavina Zharani', 'Perempuan', '2009-09-05', 'BandarÂ Lampung', 'Islam', '', '-', '', 'Suiwan', '-', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(310, '0101774673', '$2y$10$dAC08FAlhS/JE7IIAgef9.SnTc06y0qxqxKIJgFw5rYS4JmDzxj/y', 'SYAKIRA ALISHA', 'Perempuan', '2010-04-23', 'TELUK BETUNG', 'Islam', '', '-', '', 'GUNTUR ADITYA MUDA', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(311, '0097229011', '$2y$10$8cAma9HegB/h13ymd7hGKeH9oodT5.ERt3AaYXbV2jgQU2IccvWou', 'Syafira', 'Perempuan', '2009-09-02', 'BandarÂ Lampung', 'Islam', '', '-', '', 'zuherman', '-', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(312, '0094657069', '$2y$10$isWZz9T.rMhgnhVc5Y8gFOb7sBdlg0A6OSn3GWGNKjWU2/FEOC9CK', 'Syafa Alya Safitri', 'Perempuan', '2009-07-19', 'BandarÂ Lampung', 'Islam', '', '-', '', 'Mugiono', '-', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(313, '3086721874', '$2y$10$5o66pshw8MzkGKWuH0ecZe/ihKImtm89BQcSChPYblqkVoPQSmjdi', 'SULTHON ATHOILLAH AKHOS', 'Laki-Laki', '2008-06-06', 'BandarÂ Lampung', 'Islam', '', '-', '', 'ANDY LEO SALEH', '-', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(314, '3086880708', '$2y$10$uUtij9dXdfWOyilXNDLM5OYmfY1BhNSRmRsIp2VbSZ6AoHUEpsRd2', 'Sultan Farrellangga Rasya', 'Laki-Laki', '2008-11-19', 'BandarÂ Lampung', 'Islam', '', '-', '', 'Lastri Anggraini', '-', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(315, '0096693515', '$2y$10$VoPD2jHxwOnuh9wjvYvoiuuOnEosFi.w9QlTnF5mrFJXDWS7VOusO', 'Sukma Larasati Wahyudi', 'Perempuan', '2009-05-30', 'Teluk Betung', 'Islam', '', '-', '', 'Wahyudi', '-', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(316, '0116836698', '$2y$10$wabVSoxw2WO15WGtOCgjAelwdiYStvVmS.z/d2COHQrJN5.skco2u', 'Suci Keyla Bastiar', 'Perempuan', '2011-05-06', 'BandarÂ Lampung', 'Islam', '', '-', '', 'Wahyu Bastiar', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(317, '0096717711', '$2y$10$sOvM3wE5OxJGtadQEZtU4uzktk5OE1zKb21DqdTeHqKr.SUoBKQXa', 'Suci Istiqomah', 'Perempuan', '2009-07-19', 'Teluk Betung', 'Islam', '', '-', '', 'Wasno', '-', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(318, '0116095804', '$2y$10$vBowT2d43Ofpbui5vh07N.vBY7LYio3A9418hQwC.ayzvZg1X5hcC', 'STEVANI FRANSISKA', 'Perempuan', '2011-07-04', 'PULAU PANGGUNG', 'Islam', '', '-', '', 'HERY YANTO', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(319, '3094383376', '$2y$10$A/fkoFauSkZmlh6Kkl5QauSCeQgtsFblq4IAx77HPHAFZKDwXMkfi', 'SITI RINA ASIH', 'Perempuan', '2009-08-07', 'TELUK BETUNG', 'Islam', '', '-', '', 'Samirin', '-', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(320, '0098003528', '$2y$10$DhJGOUuS9qvhvCFRG2jv0OX6ejJvj9rbuAkMtUMoe1cPaJ84grrvO', 'Siti Nauraningsih', 'Perempuan', '2009-05-06', 'Cilegon', 'Islam', '', '-', '', 'WIDYA NINGSIH', '-', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(321, '0108651591', '$2y$10$OumMueZc.WBhxm/5mi7tEez19F1QP/xo6DLqh8YctXTYx4p2Rb0Oq', 'Siti Nabila Assyfa', 'Laki-Laki', '2010-06-27', 'BandarÂ Lampung', 'Islam', '', '-', '', 'kurniawan santoso', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(322, '0106684763', '$2y$10$HUKR0UZepZO3DwSbzbI2Le2k8pfYo6KDkhXp8twQuYJn8pQgRpCum', 'Siti Alsyafa', 'Perempuan', '2010-04-17', 'BandarÂ Lampung', 'Islam', '', '-', '', 'deni yansyah', '-', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(323, '0102301468', '$2y$10$SQMmCEqXx3HIABjD7BQc..ZK6Ng9lK2BckZVO9KRipw9zWDzbR2/q', 'SITI AL KHAIRIYAH', 'Perempuan', '2010-02-19', 'BandarÂ Lampung', 'Islam', '', '-', '', 'ROMINAH', '-', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(324, '0109875018', '$2y$10$Yqf8e5RBaTKb.LRnJDKC.upgAksxeYWSysdR3680lec9JnAWjNh5O', 'Siti Aisah Kurnia Syifa', 'Perempuan', '2010-08-30', 'pandeglang', 'Islam', '', '-', '', 'muhammad yusuf', '-', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(325, '0105661078', '$2y$10$3vkaEKBnQzxO.ms4450hXucpHVI39cJAFJKov25O/EdXCJuy5YVUW', 'SINAR PUTRI RAMADHANI', 'Perempuan', '2010-08-31', 'BandarÂ Lampung', 'Islam', '', '-', '', 'EKO HARYANTO', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(326, '0107222900', '$2y$10$l8bg260g4uVxO9nm4cTwLOmwQP03TeiOMmuNYaUpi8sTtHHPBI8Va', 'SILVIA RESTU FADILLA', 'Perempuan', '2010-12-15', 'BandarÂ Lampung', 'Islam', '', '-', '', 'TONI SARYONO', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(327, '0095679776', '$2y$10$Hz5S9egJ.gV9bTlxvt/xrecHh7.LxDnibD1CJWBAcGTSJ1t48hGOK', 'Silma Oktavia', 'Perempuan', '2009-12-25', 'Bandarsari', 'Islam', '', '-', '', 'Paiman', '-', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(328, '3100496165', '$2y$10$.aJi2MCnvD82eZNMSm75C.Y3odfMhXjvgUBw2DSIfiNguIUeODSKq', 'SILA NAFISAH', 'Perempuan', '2010-03-08', 'Teluk Betung', 'Islam', '', '-', '', 'RIDWAN', '-', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(329, '0114715268', '$2y$10$aXBK1ZolgImNnTgezXzrReCoYaWXkVZmzIZLE5KS/uAqm8m1sGEMa', 'Shinta Herlia Putri', 'Perempuan', '2011-07-01', 'BandarÂ Lampung', 'Islam', '', '-', '', 'Hendra Sanjaya', '-', 2023, '7A', 'default-profile-picture.jpg', 'Aktif');
INSERT INTO `siswa` (`id_siswa`, `nisn`, `password`, `nama`, `jenis_kelamin`, `tanggal_lahir`, `tempat_lahir`, `agama`, `no_hp`, `email`, `alamat`, `nama_wali`, `no_telepon_wali`, `angkatan`, `kode_kelas`, `foto`, `status_siswa`) VALUES
(330, '0104118656', '$2y$10$Nnku31qMV1PG8e3LeYv83.je3AgNr3aL4VexeKTn8zIFnMWjHlxfm', 'Sherin Febrian Antoni', 'Perempuan', '2010-02-02', 'BandarÂ Lampung', 'Islam', '', '-', '', 'Suparsi', '-', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(331, '0116535572', '$2y$10$vjO8z7D3wegHLR1PWzjXP.z3XleUkdVirlB39Ph4hudUR2FKeVHGe', 'SHASA APDELIA PURI', 'Perempuan', '2011-04-09', 'BandarÂ Lampung', 'Islam', '', '-', '', 'Edi Susilo', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(332, '0096427398', '$2y$10$7uPPaFK8pgWx/.dOmNo/5.duFe1fij4lXIcGvVW8wVjB71sklMyGa', 'SETYO ANUGRAH', 'Laki-Laki', '2009-01-18', 'BandarÂ Lampung', 'Islam', '', '-', '', 'LUSIANTO', '-', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(333, '0095567342', '$2y$10$sZfj37FFhlUupd0l/ji/Fu5NqZmm5o.OMGdZOR8NBkaGPtsQcvGs2', 'Sazkia Putri Rhamadani', 'Perempuan', '2009-07-18', 'Teluk Betung', 'Islam', '', '-', '', 'Saifulloh', '-', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(334, '0109435796', '$2y$10$SshyAg.KNg8FDBW59hID5uV9aIdPZVrZl/p/LuQ.ufnlLgeX5krlO', 'SATYA ALIEF BASSALAMAH', 'Laki-Laki', '2010-12-13', 'BandarÂ Lampung', 'Islam', '', '-', '', 'RASMIZAL', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(335, '0105913038', '$2y$10$Z5AFCNAc/CnzcnyPVMzUAuc9IyhQxiW0LMgh47TzD6.jASUfFhaPi', 'Muhammad Fachri Akbar', 'Laki-Laki', '2010-05-11', 'BandarÂ Lampung', 'Islam', '-', '-', 'ikan julung, skip rahayu, Kec. Bumi Waras', 'Vikriyanto', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(336, '0102917025', '$2y$10$GIC5v8G6FD7bGzUznLokO.iCJVsWLEuLtlW/vEWgngaH1bwWuiVWO', 'Muhammad Fadil Aditiya', 'Laki-Laki', '2010-11-21', 'BandarÂ Lampung', 'Islam', '0895412741188', '-', 'Jl. Hasanudin Gg. Kantor Pos, Gunung Mas, Kec. Teluk Betung Utara ', 'm. juber', '-', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(337, '0086566405', '$2y$10$AiC9UiC9ZxRGivzzq6ndPeZQJXpnRvRXUrWV38TVy1DYATQoeGxAG', 'Muhammad Fahri', 'Laki-Laki', '2008-04-23', 'BandarÂ Lampung', 'Islam', '0895640523078', '-', 'Jl.Gn Krakatau No 14 LK I, Kupang Kota, Kec. Teluk Betung Utara', 'Andi Rohadi', '-', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(338, '0096458832', '$2y$10$Ta4Wd2rD4DC0NO0lg/5YCu7QoT0agObM3iCmKpD.7EM6E94LF5N46', 'MUHAMMAD FAHRINDRA', 'Laki-Laki', '2009-11-23', 'WAMENA', 'Islam', '085774543859', '-', 'JL. SEDAP MALAM 3, NUSA JAYA, Kec. Karawaci', 'INDRA NAZAR', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(339, '0117252398', '$2y$10$2vWL3IShZYS3FZCzhhkRBOsqjc.qcIjwPAlRnITy8YAZOOdA6JNzO', 'MUHAMMAD FAIRUL NIZAM', 'Laki-Laki', '2011-04-27', 'Cilegon', 'Islam', '08952097098', '-', 'JL. LAKS MALAHAYATI N0.08 LK II, Desa/Kel. Pesawahan, Kec. Teluk Betung Selatan', 'ZULFIKAR', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(340, '0083487816', '$2y$10$5kaZ8WpjmjvY1DcU9bq2EuBGzSQnt9wNXIn2uR1p5mh6ULT.lF1t6', 'Muhammad Faiz Bazri', 'Laki-Laki', '2008-10-05', 'Indramayu', 'Islam', '087805771663', '-', 'Dr. Cipto Mangunkusumo Gg. Cantik Manis, Kec. Teluk Betung Utara Kupang Teba, ', 'Gadafi Badjri', '-', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(341, '0086547689', '$2y$10$CQ1QKdIBbKlq.E0NmxPFV.SYlB4v9mblW7bGmS9Mnn4lz81mxaxCq', 'Muhammad Fakhri', 'Laki-Laki', '2008-12-27', 'Jakarta', 'Islam', '082178946225', '-', 'Jl. Rw Monginsidi Gg. Merbabu No. 27, Kupang Kota, Kec. Teluk Betung Utara', 'Fatruliabto, SE', '-', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(342, '0079103590', '$2y$10$mbe3qxfhLe.ajFHSl0.q/OWIVcF3fSpNaYD79VigrpGyYO9ko1BWO', 'Muhammad Farel', 'Laki-Laki', '2007-10-24', 'Teluk Betung', 'Islam', '-', '-', 'Jl. Tangkuban Perahu Gunung Agung Lk. II, Kupang Kota, Kec. Teluk Betung Utara', 'Adriansyah', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(343, '0095840245', '$2y$10$d765tvsRjuAjDG7hQ4mpou.UgGlhPjoLgjr/Ke6u3j5AE6Cshkj02', 'Muhammad Farel Pratama', 'Laki-Laki', '2009-06-15', 'BandarÂ Lampung', 'Islam', '083153642214', '-', 'Jl. Wr. supratman Gg. Pancur MAs Lk.I, Gunung Mas, Kec. Teluk Betung Selatan', 'Mukti Zailani', '-', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(344, '0116131129', '$2y$10$Nrj0RoIAk9BDwEaBq3Fil.C9wN8ttOd/7VeX1GQ/0AHpzIkYWnhfu', 'Muhammad Fikri Firmansyah', 'Laki-Laki', '2011-06-22', 'BandarÂ Lampung', 'Islam', '081272339612', '-', 'Jl. Tangkuban Perahu No. 15, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'Abdur Roni', '-', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(345, '0092565641', '$2y$10$aHO9ICSYuvgtoalhuavLrO0xIXHv5fz9E6PQ3BJjf0CLlkFhljVrC', 'Muhammad Hafiz Ramadhan', 'Laki-Laki', '2009-06-24', 'teluk betung', 'Islam', '081272173398', '-', 'jl. wr. supratman gg. pegadaian no.11, teluk betung, Kec. Teluk Betung Selatan', 'slamet riyadi', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(346, '0111129516', '$2y$10$PY55KnEPMsnll3whB1Ml9OUYI40Bq9SkgalTRv0L7Zh9GvUGn6S4q', 'Muhammad Ilyas Putra Darma', 'Laki-Laki', '2011-02-20', 'BandarÂ Lampung', 'Islam', '089633412339', '-', 'jl. wr. supratman gg. pancurmas no. 24 LK I, Desa/Kel. GUNUNG MAS, Kec. Teluk Betung Selatan', 'Ludi yudha setiawan', '-', 2022, '7B', 'default-profile-picture.jpg', 'Aktif'),
(347, '0114379930', '$2y$10$7ZafErnUIDP8yRlHWAerS.V8DuIpTiI.xB8qn2EPqB11q.GM0XdCe', 'MUHAMMAD MASYKUR ROMADHONI', 'Laki-Laki', '2011-08-28', 'PAHAWANG', 'Islam', '083168754416', '-', 'Jl. Teluk Ratai Sinar Laut LK II, Desa/Kel. Kota Karang, Kec. Teluk Betung Timur', 'Udin', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(348, '0086326391', '$2y$10$lhlxdR3T3OyBNqB4wEXxfuA/ZKhSKJ6ebiwoPDhEUuLwOsmJ165xu', 'MUHAMMAD RADI', 'Laki-Laki', '2008-11-03', 'BandarÂ Lampung', 'Islam', '089630599661', '-', 'JL. TANGKUBAN PERAHU NO. 7 GG. DARA, KUPANG KOTA, Kec. Teluk Betung Utara', 'M. AMIN', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(349, '0098975526', '$2y$10$HukAF499K75aB4V7/2SKo.pvtKn6gEH9lrgqk5ddzrSyj4IBKqq4O', 'MUHAMMAD RAFLI RAMADHANI', 'Laki-Laki', '2009-09-09', 'BandarÂ Lampung', 'Islam', '085268822274', '-', 'Jl. PR. Bilabong Jaya Blok g 5 No. 3 Lk. I, Desa/Kel. Langkapura, Kec. Langkapura', 'Muhammad Nurdin', '-', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(350, '0098544013', '$2y$10$NGCktCMMJSepKW7AYs1R4OWfrqwke7Re8m3oZ0rZjI.l1DfnGU1oq', 'Muhammad Rafli Santoso', 'Laki-Laki', '2009-07-09', 'BandarÂ Lampung', 'Islam', '081369644921', '-', 'Jl. Tangkuban Perahu No. 19 Lk. I, Kupang Kota, Kec. Teluk Betung Utara', 'Dadi Santoso', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(351, '0102574323', '$2y$10$BKQt5fURZNozNLwbewlSDOTooz.eecj7U5P63i8rUltpD0BpC5RGm', 'MUHAMMAD RAMADHAN', 'Laki-Laki', '2010-08-19', 'BandarÂ Lampung', 'Islam', '089687253444', '-', 'JL. DRS. WARSITO GG. TANGGAMUS/ 50, KUPANG KOTA, Kec. Teluk Betung Utara', 'SUWARTO', '-', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(352, '0107490879', '$2y$10$48b9lG/R.Qh3qkDoa82mN.Hl6dcIN4NmtoY677nWC0DY5D6ZTQ.3m', 'MUHAMMAD RIDHO PRATAMA', 'Laki-Laki', '2010-06-14', 'TELUK BETUNG', 'Islam', '083134110119', '-', 'JL.IKAN SEPAT, KANGKUNG, Kec. Bumi Waras', 'RIYANTO', '-', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(353, '0106109028', '$2y$10$CRAnVXZRwhgYMuYUnom0IeF8WUONKsHLYMFPLKNc.XQ9ApL1RXN92', 'Muhammad Sandi Banyu Asmoro Langit', 'Laki-Laki', '2010-12-14', 'BandarÂ Lampung', 'Islam', '082282322993', '-', 'Jl. Gn. Krakatau Gg. Wilis / 07 Lk. I, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'Roby Arianto', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(355, '0097543672', '$2y$10$ywFPKZlqW2vjJOwh6FuKmuaHCJQOAD3J4PBxmZzHpGKqLn0qMliU2', 'MUHAMMAD SYAHUDA PRATAMA', 'Laki-Laki', '2009-09-27', 'TELUK BETUNG', 'Islam', '088269028074', '-', 'JL.IKAN SEMADAR, BUMI WARAS, Kec. Bumi Waras', 'M.NURUL HUDA', '-', 2023, '9D', 'default-profile-picture.jpg', 'Aktif'),
(356, '0112174895', '$2y$10$buxC/LBPweUKICZuStHOsexnY8uDvDtYiaUZDOngGolUYpHf6fI/C', 'Muhammad Tegar Pratama', 'Laki-Laki', '2011-08-31', 'BandarÂ Lampung', 'Islam', '089521320092', '-', 'Jl. Wr. Supratman Gg. Pegadaian No. 18 LK II, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'M. Teguh Setiawan', '-', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(357, '3114641290', '$2y$10$Nh.IsCJq/Mrl9cVg9OgJEOilWkJP412ibH7yU.4GMqDWsB9aCyNzG', 'Muhammad Singa Prabu Amron', 'Laki-Laki', '2011-06-19', 'Batam', 'Islam', '085758994778', '-', 'Jl. Drs. Warsito Gg Tanggamus, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'AJENG S. BALQIS AMRON', '-', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(358, '0099545312', '$2y$10$E6lPuaU6ERaMRRhOY3OWpO3M2hEWrfQlmn4NYl.fCVgv4QZCxI9xS', 'Muhammad Viki', 'Laki-Laki', '2009-07-16', 'Brebes, Jawa  Tengah', 'Islam', '087786507054', '-', 'Jl. Drs.  Warsito Gg. Semeru No. 17 Lk. II, Kupang Kota, Kec. Teluk Betung Utara', 'Kuserin', '-', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(359, '0079773649', '$2y$10$aNAzwUG6PRui2W69UeQkoeqtOBEZzUzDxIEyhJT90hiVfv4bReXfu', 'MUHAMMAD YUSUF AL FAREL', 'Laki-Laki', '2007-05-30', 'TELUK BETUNG', 'Islam', '083170231786', '-', 'JL.IKAN MAS GG.MANSYUR NO.45, KANGKUNG, Kec. Bumi Waras', 'ANDRI JAYAKUB', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(360, '0094764740', '$2y$10$yryy8BiZ2fdbDz96q.PAAeTAdcKFYE87aB1LMo4FxKdxRPWKkrEyi', 'MUHAMMAD ZORA ADRIAN', 'Laki-Laki', '2009-03-29', 'TELUK BETUNG', 'Islam', '082282942993', '-', 'JL.YOS SUDARSO GG.CENDANA VII, BUMI WARAS, Kec. Bumi Waras', 'BAHRIANTO', '-', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(361, '0092091094', '$2y$10$SBrwJe.9atu5CzhaYaeJ1.4rHK4IAiFGQYkO6XOmJk7c0NtFTzzJ6', 'MUSLIM AHMADI SOLIHIDDIN', 'Laki-Laki', '2009-12-04', 'BandarÂ Lampung', 'Islam', '081387887974', '-', 'YOS SOEDARSO GG. M. AGUS LK I, BUMI WARAS, Kec. Bumi Waras', 'NUR QOSIM', '-', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(362, '0106774144', '$2y$10$7ek9XvJIXOqXHRhSYacZquErelQDxgrDurrpSX0ZgNzjPhbfArg/i', 'Mutiara Andini', 'Perempuan', '2010-09-22', '-', 'Islam', '089631961615', '-', 'jl. hasanudin gg, kantor pos no. 5, gunung mas, Kec. Teluk Betung Utara', 'Wardi Sandi', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(363, '3102441510', '$2y$10$zImYYtP5WiZ6D/t3xOrxfeXYfkBbT4Bj3U5qgDcvoSypbmyncOKPK', 'Mutiara Eka Pratiwi', 'Perempuan', '2010-01-25', 'BandarÂ Lampung', 'Islam', '085367070071', '-', 'Jl. T. Semangka Kp. Baru Lk. I, Kota Karang, Kec. Teluk Betung Timur', 'Mulkan', '-', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(364, '0096380547', '$2y$10$NiPEyAFPEIBf96WoQx2x.eypKUnhjOsc7kGMgRTn1d5ikMDosZcCO', 'NABILA DZAKIRA', 'Perempuan', '2009-07-30', 'Teluk Betung', 'Islam', '087828758913', '-', 'Jl. WR. Supratman Gg. R. Danial, Gunung Mas, Kec. Teluk Betung Utara', 'IMAWAN', '-', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(365, '0101937474', '$2y$10$W8UVmcRiWid/tnbjXWXlMeEbbQgRt2l8ntulW27aakGVbaj0LFA4u', 'Nabila Maysa Putri', 'Perempuan', '2010-05-21', 'Gunung Sugih', 'Islam', '081379275064', '-', 'Jl. WR. Supratman Gg. Pancur Mas No. 32 LK. I, Gunung Mas, Kec. Teluk Betung Selatan ', 'Antoni', '-', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(366, '3118333446', '$2y$10$fPfuQzrTNd.Ul8usA/CZEO6txvCvnzfI4ihGRwEJ.X45yUJxiOuF2', 'NABILA TAZKIA AMARA', 'Perempuan', '2011-03-10', 'TALANG PADANG', 'Islam', '082184673215', '-', 'JL MONGONSIDI GG MADRASAH LK II, Desa/Kel. Talang, Kec. Teluk Betung Selatan', 'AGUS ANSORI', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(367, '0112952276', '$2y$10$k4OBi7GEDb4U.lEScmULqufIeuK051HiGONt/odeeG3cm81hHri0K', 'Nadia Syahfirawati', 'Perempuan', '2011-04-20', 'Kotabumi', 'Islam', '085693469377', '-', 'Jl. Drs. Warsito Gg. Semeru LK II, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'Edwarsyah', '-', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(368, '0111318418', '$2y$10$wi73xdwvkXS40rtcfHsY5OllexE6BlX0.faKL/o2BAmfTfq1M9drW', 'Nadiera Kallea Shifa Almyra', 'Perempuan', '2011-07-30', 'BandarÂ Lampung', 'Islam', '083135302010', '-', 'Jl. Gn. Krakatau No. 36, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'Nazbudin', '-', 2022, '7B', 'default-profile-picture.jpg', 'Aktif'),
(369, '0104373313', '$2y$10$WTlgXLNnGA4s9hx1H8p2y.Phu6qc.5Q7pim3T1W2inpMepo2G80Oi', 'NADIN', 'Perempuan', '2010-08-22', 'BandarÂ Lampung', 'Islam', '-', '-', 'JL. MAYOR SALIM BATU BARA GG SUPRIL 26, KUPANG TEBA, Kec. Teluk Betung Utara ', 'JON KENEDI', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(370, '0115712769', '$2y$10$QilaE8UYEZUz8AVB69YUluaJyLzlqynrjnwbu2K.4ZTTBKpN8FAVS', 'Nadine Adelia', 'Perempuan', '2011-03-07', 'BandarÂ Lampung', 'Islam', '082280329680', '-', 'JL. DRS WARSITO GG TANGGAMUS, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'Safuan Erdi Yanto', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(371, '0107585269', '$2y$10$SKEdnm.zG3H3UABBOym97uKTLbKOXgz517cKAZFMA.kEBJDr4LtkK', 'NADIRA FAHRANI', 'Perempuan', '2010-09-10', 'TELUK BETUNG', 'Islam', '089503894617', '-', 'JL. Laks. Malahayati Gg. 25 E LK. II, Teluk Betung, Kec. Teluk Betung Selatan', 'RUSMAN EFENDI', '-', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(372, '0093864681', '$2y$10$JKxMuNMRURoNIKqBIhR1KOwdOUx6ccOipKjTE8sC/dden5ncxa6Cm', 'Nafiz Reyhan Abdillah', 'Laki-Laki', '2009-05-11', 'BandarÂ Lampung', 'Islam', '081271443084', '-', 'Jl. Abdi Negara Bawah, Gulak  Galik, Kec. Teluk Betung Utara', 'M. Syarif', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(373, '0094783964', '$2y$10$nO4RU.5YFNOZK6AKt//iruvKSKpf9GtOIENVg0WMuy1i2ok4jQBFO', 'Naila Ardelia Putri', 'Perempuan', '2009-01-09', 'teluk betung', 'Islam', '0895609833274', '-', 'Jl. Wr. Supratman Gg. Danial/13, gunung mas, Kec. Teluk Betung Utara', 'Eko wiranto', '-', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(374, '3119464057', '$2y$10$WVkvYWIpLD4.hsvrdQ/x7OlEuaubplW5ujGCs49jzVLy8zIeDlcGK', 'NAJUA', 'Perempuan', '2011-03-24', 'BandarÂ Lampung', 'Islam', '08951850907', '-', 'JL. GUNUNG KRAKATAU NO.36, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'FIQIH', '-', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(375, '3092863485', '$2y$10$dxjCQktLvSeJoFd0shIAqunr7Aj05vMVYBMiR.wXEoo5rh3quD0H6', 'NAMIRA LEONA', 'Perempuan', '2009-08-19', 'BandarÂ Lampung', 'Islam', '085764679566', '-', 'Jl GUNUNG KRAKATAU LK 1, Kupang Kota, Kec. Teluk Betung Utara', 'Aswandi', '-', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(376, '0118626063', '$2y$10$f0.HDisQGg8ZQTG9.k69gecmgPoojGd4cMOnSnM8xTeM.m9Erv34C', 'Natasya Dwi Bunga Rastika', 'Perempuan', '2011-06-15', 'BandarÂ Lampung', 'Islam', '081278120331', '-', 'Jl. Gn. Krakatau No. 66, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'Herdiyan', '-', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(377, '0103502139', '$2y$10$6OTW6wgFaVRhCoR.xhRZCO.5xcb3UaCTngXqYJpOEYT0hxrtClE/q', 'Naumira Shadrina Nur', 'Perempuan', '2010-11-05', 'BandarÂ Lampung', 'Islam', '08983994850', '-', 'Jl. Hasanudin LK.II, Gunung Mas, Kec. Teluk Betung Selatan', 'Untung Suhardi', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(378, '0091216811', '$2y$10$jwBdmh5BKN3IJu2gHPj6pegj8k0ysoIoy6NR65pDHzHXSzsXHMCEq', 'NAVARA INDAH ANDINI', 'Perempuan', '2009-12-10', 'JAKARTA', 'Islam', '089531079922', '-', 'SUNTER MUARA, SUNTER AGUNG, Kec. Tanjung Priok', 'SANDRA', '-', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(379, '0099351453', '$2y$10$RxSIAC3iA4t0GvE0kGaX5eGdjYSAu5Kpr8DGYSxLMrJbBoYyDzPDe', 'Nayla Nur Fatimah', 'Perempuan', '2009-02-06', 'Teluk Betung', 'Islam', '083164353531', '-', 'Jl. Gn. Agung Gg. Hasan M, Kupang Kota, Kec. Teluk Betung Utara', 'Feri Susanto', '-', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(380, '0118024186', '$2y$10$.te9ijhi4LBU/2UTis2lAeivmwK5fv0HqU7S1h0GZr5HYsePofFwq', 'Nayra', 'Perempuan', '2011-06-01', 'BandarÂ Lampung', 'Islam', '089606101554', '-', 'jl. wr. supratman gg. rd danial no. 20, gunung mas,  Kec. Teluk Betung Selatan', 'anwar', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(381, '0118062305', '$2y$10$NyF3nP4w489pLGI.2swZouxFIUh16GeQaFwP63yVdryMRM92bIxFa', 'Naysila', 'Perempuan', '2011-06-01', 'BandarÂ Lampung', 'Islam', '083135937839', '-', 'jl. wr. supratman gg. rd. danial no. 28 LK I, Desa/Kel. GUNUNG MAS, Kec. Teluk Betung Selatan', 'anwar', '-', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(382, '0096652132', '$2y$10$hsRsCwz9.Vpn5ZC94ERY9.rQHCaJfUw4qYqUHuqi5SYFINaiVvnku', 'Nazhifa Bulan Qarira', 'Perempuan', '2009-02-12', 'BandarÂ Lampung', 'Islam', '089642368668', '-', 'Jl. Tangkuban Perahu No. 1, Kupang Kota, Kec. Teluk Betung Utara', 'Edy Wiyono', '-', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(383, '0096475185', '$2y$10$DijShCpytMporaacrEXG7eHclvFG1DfT2MNtFF1NajLIb9RW5J1LK', 'NENDRA FEBRIANO', 'Laki-Laki', '2009-02-05', 'TELUK BETUNG', 'Islam', '085840628468', '-', 'JL.M.S Batu Bara No.39, KUPANG TEBA, Kec. Teluk Betung Utara', 'NURIMAN', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(384, '3112852721', '$2y$10$kEUHnY0L4LxSz61eJsSNGu3PW7KWzgF5XdaUELNAEU/6NZocIgaIK', 'NESSA SAPITRI', 'Perempuan', '2011-08-28', 'BandarÂ Lampung', 'Islam', '083863265782', '-', 'RW MONGINSIDI NO.289/4 LK II, Desa/Kel. Talang, Kec. Teluk Betung Selatan', 'MUHAMAD', '-', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(385, '0101481449', '$2y$10$aHAYJ3/Hp5e.VOWsXyRzlOZV83C8palTrJciOIz4VFBSH.i5x98Oq', 'Ni\\\'matul Arofa', 'Perempuan', '2010-05-07', 'Teluk Betung', 'Islam', '083197753559', '-', 'WR. Supratman Gg. Pancur Mas No. 1, Gunung Mas, Kec. Teluk Betung Selatan', 'Aminudin', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(386, '0101439042', '$2y$10$4GHIco.eSIl4ztjgJg2RtuXcZTDOR2D7DcgSQPmCeZ7wy1.//WtE.', 'Nia Handayah', 'Perempuan', '2011-11-23', 'Teluk Betung', 'Islam', '085764161905', '-', 'Jl. Drs. Warsito Gg, Tanggamus NO.19, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'ANDRIANTO', '-', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(387, '0093315217', '$2y$10$TyDb99RnH8eFJPGGzfRHcuHFYC8gMPjsgApIlcmIhVCvCT5P3FT2m', 'Nike Aprila', 'Perempuan', '2009-04-14', 'BandarÂ Lampung', 'Islam', '089634649177', '-', 'MS. Batubara Gg. Dahlia No. 35A, Kupang Teba, Kec. Teluk Betung Utara', 'Eko Andy Prianto', '-', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(388, '0109254363', '$2y$10$ukNFUDEf5wC.NzKjRXrAOeXL.npoJ0S.t5JZQnoGjSMYxx/8AHtFO', 'Nikita Kirana', 'Perempuan', '2010-05-07', 'BandarÂ Lampung', 'Islam', '082178948562', '-', 'Jl. Tangkuban Perahu Lk. I No. 19, Kupang Kota, Kec. Teluk Betung Utara', 'Budi Subagio', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(389, '0095867415', '$2y$10$7rIhWCW4/ktxqFlnKfgome39q09LG/gval/AWARfVKNzjBhYNvGNC', 'Nabila Azzahra', 'Laki-Laki', '2009-10-08', 'BandarÂ Lampung', 'Islam', '085895877630', '-', 'Jl. Rw.  Monginsidi Gg. Muria No. 08 Lk. I, Kupang Kota, Kec. Teluk Betung Utara', 'Ngadimun', '-', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(390, '0106964401', '$2y$10$crBrH2nO5HvGv08z8jZEFeQMZw30Waw1g8AGiwSPoMx8F83jVzZ/a', 'NABILA RAISYA PUTRI', 'Laki-Laki', '2010-05-27', 'BandarÂ Lampung', 'Islam', '082185060622', '-', 'Jl. Setia Budi, Sukarame II, Kec. Teluk Betung Barat', 'TIMBUL SANTOSO', '-', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(391, '0099061584', '$2y$10$j9f9RfNmUGWpyI38P1k7iup283KjiFRUjCng9wosI7OlB/ZZfhDaG', 'NASILA PUTRI', 'Perempuan', '2009-03-13', 'Teluk Betung', 'Islam', '-', '-', 'JALAN WR MONGINSIDI GG ASIM NO 54, Talang, Kec. Teluk Betung Selatan', 'MASKANAH', 'Tidak bekerja', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(392, '0109466658', '$2y$10$BvfMy1nYHMiCAXDgpPsaAeZnpu24iN6n763UmN9V9rYPNeyPwQLyi', 'NADIA LIVIA', 'Perempuan', '2010-01-28', 'Teluk Betung', 'Islam', '-', '-', 'Jl. Mayor Salim Batu Bara Gg. Anggrek No.37 RT/RW:001/-, Kupang Teba, Kec. Teluk Betung Utara', 'HERLINA', '-', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(393, '3108718017', '$2y$10$J.ftfKye7a1HYCWtwj6IleyvQx0XGQLDYmX9bV8x/JRJJ.i69SvTe', 'NAYLA AUDI YASMIN', 'Laki-Laki', '2010-01-02', 'Teluk Betung', 'Islam', '-', '-', 'JL YOS SUDARSO GG CENDANA 5, Bumi Waras, Kec. Bumi Waras', 'CATUR WIDIAWATI', '-', 2021, '9E', 'default-profile-picture.jpg', 'Aktif'),
(394, '0097429952', '$2y$10$HgGwEiiMJChEjDmUkEjvuuTX7SPMc4jyJmv1mnkCKari/jNNTG0mW', 'AURIEL GRACELLIA PAKPAHAN', 'Perempuan', '2008-02-21', 'BandarÂ Lampung', 'Kristen', '-', '-', 'DR.WARSITO GANG MALABAR', 'HENDRIK PAKPAHAN', '081990100580', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(395, '0095016539', '$2y$10$gL2OooJjodj7sRgAz6RRJ.43h.1.Q5Jxbr9nn.H2hvs50MmDN5sbS', 'Ayu Agustina', 'Perempuan', '2009-10-01', 'BandarÂ Lampung', 'Islam', '-', '-', 'Jl. Gn. Krakatau No. 26 Lk. I	Desa/Kel. Kupang Kota	Kec. Teluk Betung Utara', 'Mas ari', '0895384685224', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(396, '0107951307', '$2y$10$ovBP5/qoikiny0M0eWlvROvCOdMVw5rCUszdahBech7RRrT8LvImC', 'AYU MARDIANTI', 'Perempuan', '2010-10-14', 'SERANG', 'Islam', '-', '-', 'JL. GN. KRAKATAU GG. MUSHOLA NO. 31 LK. I	KUPANG KOTA	Kec. Teluk Betung Utara', 'Mulyadi', '085266548443', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(397, '0081705894', '$2y$10$wAVO73TAk5uGz3GkIPisKedJg5rEcsKFapuud6eOPkCL.43bM3Xmu', 'AZIZA SALSABILA', 'Perempuan', '2008-11-13', 'BandarÂ Lampung', 'Islam', '-', '-', 'Jl. Ikan Julung SKIP Rahayu LK.I RT/RW:017	Bumi Waras	Kec. Bumi Waras', 'ROMADHON', '-', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(398, '083153252436', '$2y$10$t9yyPQ.1WUXatcJLl/VAFutT4LSc5nwBMMAi5Uv065Tmdj5FHLadK', 'Azola Zikri', 'Laki-Laki', '2010-05-21', 'BandarÂ Lampung', 'Islam', '-', '-', 'Jl. WR. Supratman Gg Beringin No. 54 Lk II	Talang	Kec. Teluk Betung Selatan', 'Hamzah', '083153252436', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(399, '0104215197', '$2y$10$5s7ltmsQ6DFvOYifrQ5Rae4wdq6bCftlYokJJGUDYC1w1tQq/gQYa', 'AZRIEL REYZA HENDRAWAN', 'Laki-Laki', '2010-05-12', 'BEKASI', 'Islam', '-', '-', 'Gg. Swadaya 74	Kranji	Kec. Bekasi Barat', 'Suhendra', '089514090729', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(400, '0104468647', '$2y$10$F94PY0gMt.KThTnfLHqsT.YsJgWgWXhKbyU/7kr6ZqIctG/Mskk.q', 'Azzahra Annisa Nurli', 'Perempuan', '2010-05-08', 'METRO', 'Islam', '-', '-', 'JL MERAK GG BLUNTAS NO.263A LK II	Desa/Kel. Sawah Lama	Kec. Tanjung Karang Timur', 'Padli', '082267172714', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(401, '3128387670', '$2y$10$eEaSNz.CSXfXIqgtALdfmepTmxkgAEvQ1Rl7yQcnZmBLkMNnPhOxy', 'BAGAS PRATAMA SYAM', 'Laki-Laki', '2010-02-21', 'BandarÂ Lampung', 'Islam', '-', '-', 'JL WOLTER MONGINSIDI GANG MURIA NO 22	Kupang Teba	Kec. Teluk Betung Utara', 'Muchtaruddin', '081367377785', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(402, '0108295409', '$2y$10$p59JBR7mJH3qCHU059QW7uKg0uwOH4IyQJbtaiPEKP6pV.hLOe61u', 'Bagus Sanjaya', 'Laki-Laki', '2010-05-25', 'BandarÂ Lampung', 'Islam', '-', '-', 'Jl. Beringin Gg Beringin	Talang	Kec. Teluk Betung Selatan', 'Sardi', '085764679610', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(403, '0091045062', '$2y$10$LVArtaxW4mzjzB5zLTTqkumURYsDPKaqdyFd9Il.9gcQplGNQfLla', 'BALQIS ARSITA SOLEHA', 'Perempuan', '2009-08-16', 'BandarÂ Lampung', 'Islam', '-', '-', 'Kupang Raya	Kupang Raya	Kec. Teluk Betung Utara', 'TAUFIQ SHOLEH', '081271418451', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(404, '0094173692', '$2y$10$pPkSuCI4YLbUKeB08e7WmuJewhsQDGdo4aRDqgfAWOgEtCwy9Ye2e', 'BAMBANG PRAYOZI S.', 'Laki-Laki', '2009-02-17', 'BandarÂ Lampung', 'Islam', '-', '-', 'Jl.Ikan Baung	Bumi Waras	Kec. Bumi Waras', 'SUNARYO', '085788182709', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(405, '0087572892', '$2y$10$4vqnye4ZSc34eXROdnnJX.ByCXjSA2bbtOB7ZoFEHZfKugHmDNTVe', 'BAYU SEGORO', 'Laki-Laki', '2008-08-25', 'BandarÂ Lampung', 'Islam', '-', '-', 'JL. DRS. WARSITO 71	KUPANG KOTA	Kec. Teluk Betung Utara', 'HERI RUKIANTORO', '089514149063', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(406, '0107587183', '$2y$10$BMRZC8/AvUMrcYdZjJ9qpe14.Q/T.cnvLDw9tcTi7XlzbcGXZOGb6', 'Bella Rahmadani', 'Perempuan', '2010-09-01', 'BEKASI', 'Islam', '-', '-', 'Jl. Drs. Warsito Gg. Rajabasa No. 9 Lk. I	Kupang Kota	Kec. Teluk Betung Utara', 'Lala Rawila', '083168263684', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(407, '0094801907', '$2y$10$5bMtbaRl28wNzZvdS3XOOuVuIpHCtaIZjF1Vb7QkJHmekxgQNSmD6', 'Budi Adjie Mardianto', 'Laki-Laki', '2009-06-28', 'BandarÂ Lampung', 'Islam', '-', '-', 'WR. Supratman Gg. Beringin II	Desa/Kel. Talang	Kec. Teluk Betung Selatan', 'Marikun Hidayat', '0895804202300', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(408, '0096088624', '$2y$10$bPHmZexLNEdK.Fc6cjmGnOde1JtgZaB41enb8sr7ogJUv0kEZ/8oO', 'Bunga Aprilia', 'Perempuan', '2009-04-04', 'BandarÂ Lampung', 'Islam', '-', '-', 'Jl. Wr. Monginsidi Gg. Murai No. 04 LK. I	Kupang Kota	Kec. Teluk Betung Utara', 'Muhamad Buang', '089516649343', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(409, '0097118102', '$2y$10$4If4DW12T3png5cT92765.HmXzd93Ne/4.6a/MNk.kzfb79osgdl2', 'Cahaya Kirana Azhelya', 'Perempuan', '2009-09-16', 'BandarÂ Lampung', 'Islam', '-', '-', 'Jl Ikan Julung	Skip Rahayu	Kec. Bumi Waras', 'Kaswadi', '082269787243', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(410, '0117240225', '$2y$10$znn9hi0fmkkqIt.98neDaeB2qcqeXlPnXX25X0MKYs9zP.vS6ju46', 'Callysta Mutia Khairunisa', 'Perempuan', '2011-02-24', 'BandarÂ Lampung', 'Islam', '-', '-', 'Jl. Krakatau No. 5 Lk. I	Desa/Kel. Kupang Kota	Kec. Teluk Betung Utara', 'Dedi Irawan', '083838488606', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(411, '0096670034', '$2y$10$a2CbaIyp5PnPI0SubeubM.yIu./qPpJJZ65RKnIAEzry/qsBpYP.S', 'CANTIKA YULIANA SARI', 'Perempuan', '2009-07-17', 'BandarÂ Lampung', 'Islam', '-', '-', 'Jl. MS BATUBARA Gg. DAHLIA No. 47	KUPANG TEBA	Kec. Teluk Betung Utara', 'SARIWAN', '083169615097', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(412, '0109680083', '$2y$10$twfhOpGaxo2t88RbPkMXR..QXYdKdG1xb1xR.ciALncxpdYrQZ2Ku', 'Caroline Yovela Metana', 'Perempuan', '2010-04-17', 'BandarÂ Lampung', 'Islam', '-', '-', 'Jl. WR. Supratman No.17 LK I	Gunung Mas	Kec. Teluk Betung Selatan', 'Suhari', '089510791364', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(413, '0077873070', '$2y$10$MhGVGx1CCU.cji6gzY0QE.WdbDosJRW2h2XIBYtkw/PkgtLuHhsHu', 'CHANTIKA MERULISTA AGNESIA', 'Perempuan', '2007-05-27', 'BandarÂ Lampung', 'Islam', '-', '-', 'JL.Tangkuban Perahu Gg.Gn.Agung No.3 LK.II	KUPANG KOTA	Kec. Teluk Betung Utara', 'MAHA MERU', '089633486007', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(414, '0107708897', '$2y$10$HrQiiJipMQTG6uLjBRc4aeoQqzuNK8Qvk2OjpXeAhqmGmefKj8pZC', 'CHEILVIN ARDINO ALFA REZA', 'Laki-Laki', '2010-05-16', 'KOTABUMI', 'Islam', '-', '-', 'JL. KH. AHMAD DAHLAN GG. SELASIH NO. 30	Desa/Kel. Kupang Raya	Kec. Teluk Betung Utara', 'ALDI WALUYO', '082231815216', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(415, '0097912902', '$2y$10$g.1tIOMOiwgvtuK.B1akb.pAzOXwgE4GNEhdZcWQxxQXb1h5ZUa5i', 'CHITRA GUSTINA WULANDARI', 'Perempuan', '2009-08-01', 'BandarÂ Lampung', 'Islam', '-', '-', 'JL. DRS. WARSITO NO. 38/48 LK I	KUPANG KOTA	Kec. Teluk Betung Utara', 'HARRY SANTOSO', '083169666793', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(416, '0101547474', '$2y$10$qVeXxwQZAJffLKb9EaJfWO6BwiQGFoBKUrWvK0/06Prno1VUVv/B6', 'CHYNTIARA NABILA PUTRI', 'Perempuan', '2010-12-30', 'BandarÂ Lampung', 'Islam', '-', '-', 'JL. MS. Batubara Gg. Kenanga No.33	Kupang Teba	Kec. Teluk Betung Utara', 'JACK MAULANA', '0895344747625', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(417, '3103411262', '$2y$10$F2ixbcDP1pXBajhBKdRsZOwh/RmtJyoaLGB8Lni.h4v/lTjZQrsPG', 'CIKO PUTRA RAMADAN', 'Laki-Laki', '2010-07-31', 'BandarÂ Lampung', 'Islam', '-', '-', 'JL. WR MONGINSIDI GG. MADRASAH/14	Talang	Kec. Teluk Betung Selatan', 'AMILIYA', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(418, '0093460468', '$2y$10$4KKb9Xs18QDKPzxYWGgBe.F06VyCI1vOVAhXoYZU88HP7INaTc/MK', 'Cintia Rahma Agustina', 'Perempuan', '2009-08-02', 'BandarÂ Lampung', 'Islam', '-', '-', 'JL. Krakatau No.58 LK I	Desa/Kel. Kupang Kota	Kec. Teluk Betung Utara', 'Suyatno', '087726367302', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(419, '0091268750', '$2y$10$fvehuri9SVtzbrcqUob9Z.po2Ge4ubi3I1ASML35UOptxdcjUvxqO', 'DANIEL TRI SAPUTRA', 'Laki-Laki', '2010-02-12', 'BandarÂ Lampung', 'Islam', '-', '-', 'JL. WR. MONGINSIDI GG. SALIM LK II	Talang	Kec. Teluk Betung Selatan', 'LILI SURYANI', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(420, '0091425511', '$2y$10$WnzErOXM214EO5WGFd0E/O0jdZ2zJj1IBYySTDu1keRxqBuM8/vCy', 'DEA AURELIYA ZAHRA', 'Perempuan', '2009-12-10', 'BandarÂ Lampung', 'Islam', '-', '-', 'RAJABASA	RAJABASA	Kec. Rajabasa', 'SUGIANTO', '-', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(421, '0106184109', '$2y$10$jNXLNFi2Uj5x7wN31oKIoeFLDBxb7kVyaOwVwYtTFTKm1BX1pwJV.', 'DEARTHA ANGELIA PUGER', 'Perempuan', '2010-12-20', 'BandarÂ Lampung', 'Islam', '-', '-', 'Jl. Kelelawar Sidodadi	Sidodadi	Kec. Kedaton', 'Geger Dadang Nuryudho', '089697972497 ', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(422, '0076358995', '$2y$10$/WcEYDfUYdpp983PnJnQbu1FwCMGVKnU7TouAVXINFd7FLXTHav5C', 'Dela Indriani', 'Perempuan', '2007-12-07', 'BandarÂ Lampung', 'Islam', '-', '-', 'Jl. Gn.Krakatau No.26 LK I	Kupang Kota	Kec. Teluk Betung Utara', 'Masari', '088287156388', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(423, '0119455622', '$2y$10$NMJ9I6Y/QgkLFK7itzL6qO6JEg/1E0apf8Xl3B.v6tW.rxNXS3Xha', 'Denendra Aryasatya', 'Laki-Laki', '2011-01-01', 'BandarÂ Lampung', 'Islam', '-', '', 'jl. hasanudin gg. lamphong no 8 lk.II	Desa/Kel. GUNUNG MAS	Kec. Teluk Betung Selatan', 'sugianto', '089647362044', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(424, '3113191124', '$2y$10$g8.Lm4LSKUKs1YOB2duM2uUrSH4pvoxw46aRIWKIhyV0yHoRCj84K', 'DEVAN ARGA PRASETYA', 'Laki-Laki', '2011-03-31', 'BandarÂ Lampung', 'Islam', '-', '-', 'Jl RW Mongonsidi LK II	Desa/Kel. Talang	Kec. Teluk Betung Selatan', 'Murdiono', '088286853829', 2023, '7B', 'default-profile-picture.jpg', 'Aktif'),
(425, '0095934921', '$2y$10$JAoPoiQ3kR/3V2FY.58TzO5NmKiIv5XVgaOaWGjUlt9dWAOsvC5s6', 'Devina Aulia Meca', 'Perempuan', '2009-01-31', 'BandarÂ Lampung', 'Islam', '-', '-', 'jl ikan julung	skip Rahayu	Kec. Bumi Waras', 'Dedi Setiadi', '-', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(426, '0084211380', '$2y$10$6w8dzTql8Uo/1Bbl7cJjSeNxkQCsrydTm22TcNMoK7RwpFAzY38GK', 'DEWI LARASSATI', 'Perempuan', '2008-08-16', 'BandarÂ Lampung', 'Islam', '-', '-', 'MS BATU BARA GG MELATI	KUPANG TEBA	Kec. Teluk Betung Utara', 'RUSDI HARYANTO', '089507978319', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(427, '0105579330', '$2y$10$Xt6uUDN8GG14CjjZtZUDE.W.mam6qITAaB8FPohljs37jgfUR1xmq', 'DEWI SAVIRA AIRINE', 'Perempuan', '2010-06-25', 'BandarÂ Lampung', 'Islam', '-', '-', 'SLAMET RIYADI NO 3/17 LK I	SUKARAJA	Kec. Bumi Waras', 'DICKY ZULKARNAIN, SH', '089524320086', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(428, '0083966556', '$2y$10$ojdmdICpzKSzKVQNBqHwKOv9/8JhIlDhPryzZKD5ZItFXOLM3bXyO', 'Dhea Ayu Celica', 'Perempuan', '2008-03-27', 'BandarÂ Lampung', 'Islam', '-', '-', 'Jl. Tangkuban Perahu	Kupang Kota	Kec. Teluk Betung Utara', 'Prio haryono', '089523120435', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(429, '0092348593', '$2y$10$GEs15Zh9uE181ZObsCKgeu80a7Ke2XVRaL0Kr.ANNbAq7DjL05tTu', 'Enalisa', 'Perempuan', '2009-01-01', 'BandarÂ Lampung', 'Islam', '-', '-', 'Jl. Drs. Warsito Gg. Tanggamus Lk. II, Kupang Kota, Kec. Teluk Betung Utara', 'Saheri', '-', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(430, '0108662367', '$2y$10$qvULZGu0o0Hl4lDY.nKOoehHlJFvgNA4G1NKNtxvanAha/CGIOwqS', 'FADIA FAUZIATUN NISA', 'Perempuan', '2010-02-22', 'Panjang', 'Islam', '085382390871', '-', 'JL.YOS SUDARSO GG.CENDANA, BUMI WARAS, Kec. Bumi Waras', 'JUNAIDI ARSAD', '085382390871', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(431, '0105310633', '$2y$10$gldmD8JaCXKSC4LoFKY.DOrwlq18TVGvk0EClWDkU3Im/mWF1bMPa', 'FAHMI AL FARUQ', 'Laki-Laki', '2010-04-05', 'BandarÂ Lampung', 'Islam', '089666262912', '-', 'JL WR MONGINSIDI GG MASJID NURUL FATAH, Kupang Kota, Kec. Teluk Betung Utara', 'MUAMAR', '089666262912', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(432, '0108200079', '$2y$10$7DYbNGIOsD9rYOUUy2YnzeUz1Pv0b2lt9ScWQD7xXe6/kjPP62hi.', 'FAHMI ALFARIZI', 'Laki-Laki', '2010-04-14', 'BandarÂ Lampung', 'Islam', '-', '-', 'JL. YOS SUDARSO GG. M. AGUS LK.I, BUMI WARAS, Kec. Bumi Waras', 'ANSORI', '-', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(433, '0099989389', '$2y$10$/TiK/4C0mnFvv0bgniB5mOtVIv5o6/mtKPJEE8qz.wWmMO381Pbqa', 'Fahri Aditya', 'Laki-Laki', '2009-06-30', 'Teluk Betung', 'Islam', '0895351103636', '-', 'Jl. Hasanudin No. 33 Lk. II, Gunung Mas, Kec. Teluk Betung Utara', 'Doni Subari', '0895351103636', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(434, '0085728790', '$2y$10$JNJBQBjPf/ZFki8iiGUC7OD1mId2gNf1kC3YR6DCa7T2dTsyOgyBC', 'FAHRI RAMADHAN', 'Laki-Laki', '2008-09-21', 'Teluk Betung', 'Islam', '-', '-', 'JL. GN. KRAKATAU NO. 35 LK II, TALANG, Kec. Teluk Betung Selatan', 'Ardony Putra', '-', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(435, '0092645391', '$2y$10$ceDeXrft25WJaKzCw62Ho.n/Sj3YmDvpP7TDnrwLQ9qdNwRpWZAV.', 'Fajar Fitriyani', 'Perempuan', '2009-08-22', 'BandarÂ Lampung', 'Islam', '089514148819', '-', 'Patimura Gg. Tamtama Lk.II, Kupang Kota, Kec. Teluk Betung Utara', 'Paiman', '089514148819', 2021, '9D', 'default-profile-picture.jpg', 'Aktif'),
(436, '3098050828', '$2y$10$mDymGfPkSvwU1E9wr8fBKORxCQnFeLBhpsSs1U8c5MH9QC6Ph1EIK', 'FAJAR MARDIANCA', 'Laki-Laki', '2009-07-04', 'BandarÂ Lampung', 'Islam', '-', '-', 'JL. BERINGIN NO. 79 LK II, Talang, Kec. Teluk Betung Selatan', 'ICAH RAHAYU', '-', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(437, '0073722171', '$2y$10$.zR7uZAifhDycoAOJgKbbeQf7TnZVY1PFsGxbIzBazZqX.Pod4s6e', 'FANDI CHANIAGO MANURUNG', 'Laki-Laki', '2007-09-02', 'PangkalÂ Pinang', 'Islam', '08983166450', '-', 'Jl.Yos Sudarso, Sukaraja, Kec. Bumi Waras', 'RIDUAN MANURUNG', '08983166450', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(438, '0101003309', '$2y$10$NjgD2j9Y0dHgxveGCoiv9easAA/YG7xoTvzLPO6EP1Ss9VaSXpgSa', 'FANNY SUKMAWIJAYA', 'Perempuan', '2010-03-14', 'BandarÂ Lampung', 'Islam', '088286597516', '-', 'Jl. IKAN KAPASAN NO. 48, KUPANG RAYA, Kec. Teluk Betung Utara', 'TIRTA WIJAYA', '088286597516', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(439, '0106927862', '$2y$10$rMRHOs1sey27wQitnx4lPuR12o1evEAyISA7KzhuzQaXlQg9Oskoq', 'Fardhan Habib Rohiman Maulana', 'Laki-Laki', '2010-04-29', 'Teluk Betung', 'Islam', '085379844937', '-', 'Jl. Gn. Krakatau Gg. Gn. Abung Lk. I, Desa/Kel. Kupang Kota, Kec. Teluk Betung Utara', 'ROHIMAN', '085379844937', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(440, '0112817904', '$2y$10$sWPSY4DFsBu09PP3b6gD8uI3NUTb1CuaZR2EMnDev1RF2PSdDCGnS', 'Farel Rahmanda Dahri', 'Laki-Laki', '2011-06-14', 'BandarÂ Lampung', 'Islam', '082373328076', '-', 'Jl. HASANUDIN GG. TIRTA NO.7 LK II, Desa/Kel. GUNUNG MAS, Kec. Teluk Betung Selatan', 'Dahri Manan', '082373328076', 2023, '7A', 'default-profile-picture.jpg', 'Aktif'),
(441, '0082610728', '$2y$10$Zel6HG71CrDTax.hh7Yn9O1TIjHnmtO0WdhwtpozggtOP0v9rd1yq', 'FARHAN SAPUTRA', 'Laki-Laki', '2008-11-06', 'Teluk Betung', 'Islam', '089652987556', '-', 'JL.MS BATU BARA GG DELIMA NO.03, KUPANG TEBA, Kec. Teluk Betung Utara', 'SUNARTO SLAMET', '089652987556', 2023, '7D', 'default-profile-picture.jpg', 'Aktif'),
(442, '0098765762', '$2y$10$.sIFD4jt2.9rTaeEQddlmeLUtQcOaNSQFGE3qoiqMppuIvqPXnkge', 'FARIED AKBAR RIZIQH', 'Laki-Laki', '2009-06-18', 'BandarÂ Lampung', 'Islam', '085812551481', '-', 'JL. GUNUNG KRAKATAU NO.42, KUPANG KOTA, Kec. Teluk Betung Utara', 'DARMAWAN', '085812551481', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(443, '0087204807', '$2y$10$Fvq4QUn65iO0Q4brhhEMkuzRu/ny3Kj46WXeQL1T3lt5S.VSq4mMe', 'FARIS AHMAD RAHMADIJAYA', 'Laki-Laki', '2008-07-29', 'Tasikmalaya', 'Islam', '089514148553', '-', 'Jl. Batu Bara No. 4, Satria, Kec. Padang Hilir', 'Rahmat Rahmadi Jaya', '089514148553', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(444, '0086605932', '$2y$10$g34k9JCDO35X7hpGRyg7Y.GOv6WnC6SluyG7YUU5UQrJTXVCXxDYq', 'FATHI FAHREZI', 'Laki-Laki', '2008-06-08', 'BandarÂ Lampung', 'Islam', '083168266095', '-', 'JL.IKAN KITER, KANGKUNG, Kec. Bumi Waras', 'FUAD ALKATIRI', '083168266095', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(445, '0089307523', '$2y$10$I9gD5/aocHPuNK183futjOGJsx5u2q4mnntv1rF.zX6LnNMRQYY22', 'Fatma', 'Perempuan', '2008-03-09', 'Tanjung Karang', 'Islam', '082294186357', '-', 'Jl.Drs Warsito Gg.Tanggamus, Kupang Kota, Kec. Teluk Betung Utara', 'Pausi Sanusi', '082294186357', 2021, '9F', 'default-profile-picture.jpg', 'Aktif'),
(446, '0104870265', '$2y$10$7DICDxQIiK/52D.swr0ihOwNZHjld.SFoQEcDkEJbvcVSWBGjRrzC', 'Elsy Restiyani', 'Perempuan', '2010-07-05', 'BandarÂ Lampung', 'Islam', '089650545913', '-', 'Jl. Gn Agung G.Rias LK.I, kupang kota, Kec. Teluk Betung Utara', 'Jaini', '089650545913', 2022, '8C', 'default-profile-picture.jpg', 'Aktif'),
(447, '0097555749', '$2y$10$mYo60CPt2fRDTXoIFzYLLufIwfcv4n.kqmMFECQwTdNdqwhRtGC3q', 'EFINA AULIA PUTRI', 'Perempuan', '2009-08-19', 'BandarÂ Lampung', 'Islam', '088287391481', '-', 'Jl. DRS. Warsito Gg. Semeru No.30 LK.II, Kupang Kota, Kec. Teluk Betung Utara', 'EFFENDI', '088287391481', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(448, '0119518939', '$2y$10$W9tXymTIejRTIijGrx/DCOKXNr12tIO7V.TbPG2X1hpRaj7ndfvA.', 'DRINITY GRASIAN DJATMIKO', 'Perempuan', '2011-04-28', 'BandarÂ Lampung', 'Islam', '08950382384', '-', 'JL. YOS SUDARSO GANG KETAPANG LK.I, Desa/Kel. Sukaraja, Kec. Bumi Waras', 'SUMARNI', '08950382384', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(449, '0091863812', '$2y$10$cH3rMm0kpgwOPJbsa3tk5uqKrYeIV6RSJa7hqAL8Qo.ksGufd72pi', 'Ditha Yespa Dwika', 'Perempuan', '2009-06-10', 'BandarÂ Lampung', 'Islam', '082180222608', '-', 'Jl. Ikan Layur Blok C No.16, Teluk Betung, Kec. Teluk Betung Selatan', 'Husaipa', '082180222608', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(450, '0104573850', '$2y$10$cWliVv9.Z69XXBeqvUHEnuKQhUlQoKXZfrJfXzMzL4QaOzVylBJEG', 'DITA PRATAMA', 'Laki-Laki', '2010-04-28', 'BandarÂ Lampung', 'Islam', '089623322772', '-', 'Jl. Banyu Mas, Sukarame II, Kec. Teluk Betung Barat', 'ZAINUDIN', '089623322772', 2022, '8A', 'default-profile-picture.jpg', 'Aktif'),
(451, '3082473386', '$2y$10$9TQ2Q6U9zTmfjeZbDRmJ5uzPl5MRV/dbhJS0h7gwBNS5wdOfvIcs6', 'DIO FLORA RAMADANI', 'Laki-Laki', '2008-09-10', 'BandarÂ Lampung', 'Islam', '085841247608', '-', 'Jl. Tangkuban Perahu Gg. Urut no.17, Kupang Kota, Kec. Teluk Betung Utara', 'AGUS TONI', '085841247608', 2021, '9A', 'default-profile-picture.jpg', 'Aktif'),
(452, '0106272835', '$2y$10$L4T5ZFila69TvevfmKHXKudPpWMORjVDkeyc5iVOESWqdH2RsOwYe', 'Dinda Kirana', 'Perempuan', '2010-07-04', 'Teluk Betung', 'Islam', '08984278872', '-', 'Jl. Tangkuban Perahu Gg. Piring Kumpul No. 38 LK. II, Kupang Kota, Kec. Teluk Betung Utara', 'Tukiran', '08984278872', 2022, '8E', 'default-profile-picture.jpg', 'Aktif'),
(453, '0091685109', '$2y$10$Z4L8VPSzB9OrcOGdUBmcMO85Z9IS0XfeytzY31xnISVXdvUHxLTO2', 'DINDA KANYA DEWI', 'Perempuan', '2009-05-08', 'Teluk Betung', 'Islam', '089630059280', '-', 'JL. GUNUNG KRAKATAU NO.28, KUPANG KOTA, Kec. Teluk Betung Utara', 'PANDU WINATA', '089630059280', 2021, '9C', 'default-profile-picture.jpg', 'Aktif'),
(454, '0104903811', '$2y$10$NCbWjHkh.JvEB79rHtPbj.43D0x6RCwya6uouxM7LMu6PuQhtNhFq', 'Dinda Anisa Fitri', 'Perempuan', '2010-03-28', 'BandarÂ Lampung', 'Islam', '083184493459', '-', 'Jl. Tangkuban Perahu No. 21 Lk. I, Kupang Kota, Kec. Teluk Betung Utara', 'Suhaimi', '083184493459', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(455, '0092150388', '$2y$10$SqRpwasgVEZ/QudBXnJgy.mv7frqNkE3lWCMjPbeq/T60bQSIfo/a', 'DINA RAMADHANI', 'Perempuan', '2009-09-19', 'BandarÂ Lampung', 'Islam', '085840525687', '-', 'Jl. MS. BATUBARA Gg. Hi. ARSYAD NO. 17, KUPANG TEBA, Kec. Teluk Betung Utara', 'DECKY ICHSANUL HADI', '085840525687', 2022, '8D', 'default-profile-picture.jpg', 'Aktif'),
(456, '0096172715', '$2y$10$y1khsg6IgudTueZBI.bMU.IcktaYLX8oN1f89MJOGAYzzY4ANI4Ve', 'Dina Lusiana', 'Perempuan', '2009-05-03', 'Teluk Betung', 'Islam', '083170129083', '-', 'Jl. Tangkuban Perahu No. Lk. I, Kupang Kota, Kec. Teluk Betung Utara', 'Mahardika', '083170129083', 2022, '8B', 'default-profile-picture.jpg', 'Aktif'),
(457, '0112128593', '$2y$10$QOaIUTVtQh7YO4oAwserU.rLWW5sAjR2k9Jg9eUB993aoMaScovhO', 'Diego Al Ziqri Andola', 'Laki-Laki', '2011-02-28', 'BandarÂ Lampung', 'Islam', '085758635621', '-', 'Perum Sukajaya Darat, Desa/Kel. Sukajaya Lempasing, Kec. Teluk Pandan', 'Doon yunus', '085758635621', 2023, '7C', 'default-profile-picture.jpg', 'Aktif'),
(458, '0091891336', '$2y$10$Qmdu.032q61Qr4G1ht27bumC7VGBuhDvsGVBjgU5GtaAr8oVzoWfW', 'DIANA', 'Perempuan', '2009-08-07', 'Teluk Betung', 'Islam', '088747694176', '-', 'JL.IKAN MAS GG.MANSYUR, KANGKUNG, Kec. Bumi Waras', 'M.ARIF', '088747694176', 2021, '9B', 'default-profile-picture.jpg', 'Aktif'),
(459, '0105255307', '$2y$10$ToTBhaGQkro5UQm3umFH9.OgCy2V.x.KhwNnk./cl6RlM0.BARUAW', 'DHIO RISKI ANGGARA', 'Laki-Laki', '2010-08-09', 'Way Kanan', 'Islam', '081273293190', '-', 'JL. YOS SUDARSO GG M. AGUS, BUMI WARAS, Kec. Bumi Waras', 'M. DARWIS', '081273293190', 2022, '8D', 'default-profile-picture.jpg', 'Aktif');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `absensi`
--
ALTER TABLE `absensi`
  ADD PRIMARY KEY (`id_absensi`);

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id_admin`);

--
-- Indexes for table `guru`
--
ALTER TABLE `guru`
  ADD PRIMARY KEY (`id_guru`);

--
-- Indexes for table `jadwal_pelajaran`
--
ALTER TABLE `jadwal_pelajaran`
  ADD PRIMARY KEY (`id_jadwal`);

--
-- Indexes for table `kelas`
--
ALTER TABLE `kelas`
  ADD PRIMARY KEY (`id_kelas`) USING BTREE;

--
-- Indexes for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  ADD PRIMARY KEY (`id_mapel`) USING BTREE;

--
-- Indexes for table `modul`
--
ALTER TABLE `modul`
  ADD PRIMARY KEY (`id_modul`);

--
-- Indexes for table `nilai`
--
ALTER TABLE `nilai`
  ADD PRIMARY KEY (`id_nilai`);

--
-- Indexes for table `siswa`
--
ALTER TABLE `siswa`
  ADD PRIMARY KEY (`id_siswa`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `absensi`
--
ALTER TABLE `absensi`
  MODIFY `id_absensi` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=873;

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id_admin` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `guru`
--
ALTER TABLE `guru`
  MODIFY `id_guru` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;

--
-- AUTO_INCREMENT for table `jadwal_pelajaran`
--
ALTER TABLE `jadwal_pelajaran`
  MODIFY `id_jadwal` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=104;

--
-- AUTO_INCREMENT for table `kelas`
--
ALTER TABLE `kelas`
  MODIFY `id_kelas` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `mata_pelajaran`
--
ALTER TABLE `mata_pelajaran`
  MODIFY `id_mapel` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=68;

--
-- AUTO_INCREMENT for table `modul`
--
ALTER TABLE `modul`
  MODIFY `id_modul` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=41;

--
-- AUTO_INCREMENT for table `nilai`
--
ALTER TABLE `nilai`
  MODIFY `id_nilai` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;

--
-- AUTO_INCREMENT for table `siswa`
--
ALTER TABLE `siswa`
  MODIFY `id_siswa` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=461;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
