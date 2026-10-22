import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo GridView',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Demo GridView'),
          backgroundColor: Colors.amber,
        ),
        // Langkah 1d: Menampilkan item dalam bentuk grid
        body: GridView(
          padding: const EdgeInsets.all(10),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2, // Jumlah kotak menyamping
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          scrollDirection: Axis.vertical,
          physics: const NeverScrollableScrollPhysics(),
          // Langkah 1f: Memanggil method tile untuk menyusun isi GridView
          // Langkah 1f: Memanggil method tile untuk menyusun isi GridView
          children: [
            tile(Colors.greenAccent.shade400, 'assets/icon/Foto 1.png', 'Jadwal Kuliah'),
            tile(Colors.blueAccent.shade400, 'assets/icon/Foto 2.jpg', 'Kehadiran'),
            tile(Colors.yellowAccent.shade400, 'assets/icon/Foto 3.png', 'Tugas'),
            tile(Colors.redAccent.shade400, 'assets/icon/Foto 4.png', 'Pengumuman'),
            tile(Colors.purpleAccent.shade400, 'assets/icon/Foto 5.jpg', 'Nilai'),
            tile(Colors.tealAccent.shade400, 'assets/icon/Foto 6.png', 'Catatan'),
          ],
        ),
      ),
    );
  }

  // Langkah 1e: Method pembangun desain kotak (GridTile)[cite: 20]
  ClipRRect tile(Color warnakotak, String gambar, String judul) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Container(
        color: warnakotak,
        child: GridTile(
          footer: SizedBox(
            height: 45,
            child: GridTileBar(
              backgroundColor: Colors.black38,
              title: Text(
                judul,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          // Jika gambar error/belum ada, tangani agar aplikasi tidak layar merah
          child: Image.asset(
            gambar,
            scale: 4,
            errorBuilder: (context, error, stackTrace) => const Icon(Icons.image, size: 50, color: Colors.white),
          ),
        ),
      ),
    );
  }
}