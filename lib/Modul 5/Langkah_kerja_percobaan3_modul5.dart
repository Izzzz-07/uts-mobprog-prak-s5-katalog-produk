import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo Card',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Card Demo'),
          backgroundColor: Colors.amber, // Langkah 3b: Warna AppBar
        ),
        body: Center(
          // Langkah 3d - 3f: Menggunakan Card dengan margin dan Column di dalamnya
          child: Card(
            margin: const EdgeInsets.all(8),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Langkah 3g: Informasi lokasi menggunakan ListTile
                const ListTile(
                  leading: Icon(
                    Icons.location_pin,
                    color: Colors.red,
                  ),
                  title: Text(
                    'Taman Nasional Bromo Tengger Semeru',
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Jawa Timur, Indonesia'),
                ),
                // Langkah 3i: Dua buah tombol yang dibungkus Row di bawah ListTile
                Container(
                  padding: const EdgeInsets.only(left: 8, right: 8, bottom: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.blue)),
                        child: const Icon(Icons.map),
                      ),
                      const SizedBox(width: 10), // Memberi jarak antar tombol[cite: 6]
                      OutlinedButton(
                        onPressed: () {},
                        style: OutlinedButton.styleFrom(
                            side: const BorderSide(color: Colors.blue)),
                        child: const Icon(Icons.phone),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}