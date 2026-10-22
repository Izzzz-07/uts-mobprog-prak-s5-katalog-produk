import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pemutar Musik',
      // Langkah a: Gunakan theme aplikasi ThemeData.dark()
      theme: ThemeData.dark(),
      home: Scaffold(
        body: const Center(
          child: Text(
            'Pemutar Musik',
            style: TextStyle(fontSize: 18),
          ),
        ),
        // Langkah b: Letakkan Control Bar di bottomNavigationBar
        bottomNavigationBar: Container(
          // Langkah c: Padding dan warna latar hitam transparan
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 10),
          color: Colors.black54,
          child: const Row(
            children: [
              // Langkah d, e, & g: Tombol didistribusikan merata menggunakan Expanded & ikon putih
              Expanded(
                child: Icon(Icons.shuffle, color: Colors.white),
              ),
              Expanded(
                child: Icon(Icons.skip_previous, color: Colors.white),
              ),
              
              // Langkah f: Tombol Play menggunakan Flexible(flex:2, tight) agar lebih besar
              Flexible(
                flex: 2,
                fit: FlexFit.tight,
                child: Icon(Icons.play_circle_fill, color: Colors.white, size: 55),
              ),
              
              Expanded(
                child: Icon(Icons.skip_next, color: Colors.white),
              ),
              Expanded(
                child: Icon(Icons.repeat, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}