import 'package:flutter/material.dart';

class HalamanTujuan extends StatelessWidget {
  const HalamanTujuan({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrangeAccent, // Latar oranye/merah sesuai spesifikasi[cite: 21]
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Ini Halaman Tujuan',
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Untuk berpindah ke halaman baru, gunakan metode Navigator.push(). Metode push() akan menambahkan Route ke dalam tumpukan Route yang dikelola oleh Navigator. Route ini dapat dibuat secara kustom atau menggunakan MaterialPageRoute, yang memiliki animasi transisi sesuai dengan platform yang digunakan.',
                style: TextStyle(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.justify,
              ),
              const SizedBox(height: 30),
              // Pengganti gambar pulau[cite: 21]
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: const Icon(Icons.landscape, size: 80, color: Colors.black87),
              ),
              const SizedBox(height: 30),
              const Text(
                'Untuk menutup halaman kedua dan kembali ke halaman pertama, gunakan metode Navigator.pop(). Metode pop() akan menghapus Route saat ini dari tumpukan Route yang dikelola oleh Navigator.',
                style: TextStyle(fontSize: 15, color: Colors.white),
                textAlign: TextAlign.justify,
              ),
              const Spacer(),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                ),
                onPressed: () {
                  // Kembali ke Halaman Utama[cite: 21]
                  Navigator.pop(context);
                },
                child: const Text('< Kembali ke home', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}