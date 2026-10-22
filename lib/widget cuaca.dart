import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tugas Alignment Cuaca',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
      ),
      home: const Scaffold(
        body: Center(
          // Column utama pembungkus seluruh elemen UI
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // 1. Teks Lokasi
              Text(
                'Malang',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.normal,
                ),
              ),
              SizedBox(height: 40),
              
              // 2. Teks Suhu Utama
              Text(
                '25°',
                style: TextStyle(
                  fontSize: 100,
                  fontWeight: FontWeight.w400,
                ),
              ),
              SizedBox(height: 60),

              // 3. Row berisi ramalan 3 hari (Minggu, Senin, Selasa)
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Widget Hari 1: Minggu
                  CuacaHari(
                    hari: 'Minggu',
                    ikon: Icons.sunny,
                    suhu: '20°C',
                  ),
                  SizedBox(width: 40),
                  
                  // Widget Hari 2: Senin
                  CuacaHari(
                    hari: 'Senin',
                    ikon: Icons.cloudy_snowing,
                    suhu: '23°C',
                  ),
                  SizedBox(width: 40),
                  
                  // Widget Hari 3: Selasa
                  CuacaHari(
                    hari: 'Selasa',
                    ikon: Icons.cloud,
                    suhu: '22°C',
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// Custom Widget agar kode lebih rapi (Reusable Component)
class CuacaHari extends StatelessWidget {
  final String hari;
  final IconData ikon;
  final String suhu;

  const CuacaHari({
    super.key,
    required this.hari,
    required this.ikon,
    required this.suhu,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          hari,
          style: const TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 10),
        Icon(
          ikon,
          size: 40,
          color: Colors.black,
        ),
        const SizedBox(height: 10),
        Text(
          suhu,
          style: const TextStyle(fontSize: 16),
        ),
      ],
    );
  }
}