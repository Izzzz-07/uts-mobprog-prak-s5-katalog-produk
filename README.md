# Katalog Produk UTS

## Deskripsi Singkat
Aplikasi Katalog Produk adalah aplikasi mobile berbasis Flutter yang menampilkan daftar produk secara dinamis. Aplikasi ini dirancang untuk memenuhi Tugas Ujian Tengah Semester (UTS) mata kuliah Pemrograman Mobile. Data produk diambil secara langsung dari Fake Store API dan disajikan dalam bentuk *grid view* yang responsif.

## Fitur Utama
- **Katalog Dinamis:** Menampilkan daftar produk beserta gambar *thumbnail*, kategori, judul, dan harga.
- **Asynchronous Data Fetching:** Mengambil data JSON dari REST API menggunakan metode HTTP GET.
- **State Management Handling:** Menggunakan `FutureBuilder` untuk menangani status pengambilan data secara *real-time* (Loading, Success, Error).
- **UI/UX Menarik:** Desain antarmuka berbasis *Card* dan *Grid* yang bersih dan modern.

## Teknologi & Package yang Digunakan
- **Flutter SDK:** Framework utama pengembangan aplikasi.
- **Dart:** Bahasa pemrograman.
- **http (^1.5.0):** Package eksternal untuk melakukan *HTTP requests* ke server API.

## Langkah Menjalankan Aplikasi
1. Pastikan Flutter SDK telah terinstal di komputer.
2. *Clone* repositori ini: `git clone [URL_REPOSITORI_KAMU]`
3. Buka terminal di dalam folder proyek dan jalankan perintah: `flutter pub get` untuk mengunduh dependensi.
4. Jalankan aplikasi pada emulator atau perangkat fisik menggunakan perintah: `flutter run`