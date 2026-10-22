import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Contoh SizedBox',
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.amber,
          title: const Text('Contoh SizedBox'),
        ),
        // Langkah 1d: Menggunakan Row di dalam Center
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Kotak 1: Amber
              kotakUji(Colors.amber),
              
              // Langkah 1i: Jarak kosong 25 piksel
              const SizedBox(
                width: 25,
                height: 25,
              ),
              
              // Kotak 2: Hijau
              // Langkah 1k: Mengubah ukuran kotak hijau menjadi 100x100
              SizedBox(
                width: 100,
                height: 100,
                child: kotakUji(Colors.green),
              ),
              
              // Langkah 1i: Jarak kosong 25 piksel
              const SizedBox(
                width: 25,
                height: 25,
              ),
              
              // Kotak 3: Biru
              kotakUji(Colors.blue),
            ],
          ),
        ),
      ),
    );
  }

  // Langkah 1f: Method untuk membuat kotak warna (default 75x75)
  Container kotakUji(Color warna) {
    return Container(
      height: 75,
      width: 75,
      color: warna,
    );
  }
}