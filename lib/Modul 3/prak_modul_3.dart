import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Row and Column',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Row and Column'),
        ),
        body: Center(
          // Column utama untuk menyusun 2 baris (Row) secara vertikal
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Baris pertama berisi 2 kotak
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KotakCustom(warna: Colors.blue, teks: 'Kotak 1'),
                  const SizedBox(width: 10), // Jarak horizontal
                  KotakCustom(warna: Colors.green, teks: 'Kotak 2'),
                ],
              ),
              const SizedBox(height: 10), // Jarak vertikal antar baris
              // Baris kedua berisi 2 kotak
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  KotakCustom(warna: Colors.orange, teks: 'Kotak 3'),
                  const SizedBox(width: 10), // Jarak horizontal
                  KotakCustom(warna: Colors.purple, teks: 'Kotak 4'),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Widget untuk Kotak
class KotakCustom extends StatelessWidget {
  final Color warna;
  final String teks;

  const KotakCustom({super.key, required this.warna, required this.teks});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        color: warna,
        border: Border.all(color: Colors.black, width: 2),
        borderRadius: BorderRadius.circular(10),
      ),
      // Menggunakan Column untuk menyusun Icon dan Text secara vertikal
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.favorite,
            color: Colors.red,
            size: 40,
          ),
          const SizedBox(height: 8), // Jarak antara icon dan text
          Text(
            teks,
            style: const TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
            ),
          ),
        ],
      ),
    );
  }
}