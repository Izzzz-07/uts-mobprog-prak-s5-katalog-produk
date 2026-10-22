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
        // ... (kode Scaffold dan AppBar tetap sama)
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              // Kotak 1: Amber
              kotakUji(Colors.amber),
              
              // Langkah 2d: Spacer dengan flex 1 di antara amber dan hijau
              const Spacer(flex: 1),
              
              // Kotak 2: Hijau (Tetap dibungkus SizedBox ukuran 100x100 dari percobaan 1)
              SizedBox(
                width: 100,
                height: 100,
                child: kotakUji(Colors.green),
              ),
              
              // Langkah 2f: Spacer dengan flex 2 di antara hijau dan biru
              const Spacer(flex: 2),
              
              // Kotak 3: Biru
              kotakUji(Colors.blue),
            ],
          ),
        ),
        // ... (method kotakUji di bawahnya tetap sama)
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