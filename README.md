# Sistem Informasi Akademik SMP Negeri 35 Bandar Lampung

Sistem Informasi Akademik (SIAKAD) SMP Negeri 35 Bandar Lampung adalah sebuah platform untuk memanajemen informasi akademik siswa, guru, dan administrasi sekolah.

## Fitur

- Login dan autentikasi untuk admin, guru, dan siswa
- Dashboard untuk masing-masing pengguna dengan informasi relevan
- Manajemen data guru dan siswa
- Penyimpanan dan pengelolaan jadwal pelajaran
- Pengelolaan absensi setiap kelas
- Penilaian dan pengelolaan nilai siswa
- Pengelolaan modul dan materi pelajaran

## Teknologi

- PHP
- MySQL
- HTML
- CSS
- JavaScript
- Bootstrap

## Instalasi

Untuk mengatur SIAKAD di server lokal atau pengembangan, ikuti langkah-langkah berikut:

1. Klon repositori ini atau unduh sebagai ZIP dan ekstrak di server lokal Anda.
2. Buat database MySQL dan impor struktur dari file `siakad_smpn35.sql` yang disediakan.
3. Sesuaikan koneksi database di `db.php` dengan pengaturan server Anda.
4. Akses aplikasi melalui browser di `http://localhost/path-to-your-app`.

## Konfigurasi

Sebelum menggunakan aplikasi, pastikan untuk mengonfigurasi pengaturan-pengaturan khusus aplikasi di file konfigurasi:

- `src/db.php` - Pengaturan database
- `.htaccess` - Pengaturan URL dan rewrite rules (jika menggunakan Apache)

## Keamanan

Beberapa Keamanan Pada Website Ini:

- Menggunakan koneksi HTTPS
- Mengenkripsi password dengan `password_hash` dan memverifikasi dengan `password_verify`
- Melindungi terhadap serangan SQL injection dengan menggunakan prepared statements
- Memastikan input yang datang dari pengguna selalu divalidasi dan disanitasi


## Link Website Resmi

https://siakadsmpn35bandarlampung.id

---

Dikembangkan dengan 💖 oleh Tim SIXTH:
Aqsal Yazid Setiawan - 120140197 (Project Manager / QA)
Faisal Khairul Fasha - 120140158 (Back-End Developer)
Faustine Elvaretta Tambila -	120140157	(Technical Writer)
Winda - 120140123	(System Analyst)
Azka Hafidz Asianto -	120140201	(Front-End Developer)
Chaterine Sidabutar -	120140199 (Technical Writer)
Muhammad Alhafiz - 120140108 (Front-End Developer)
Andre Riantasa Wijaya	- 120140166	(UI/UX Designer)
