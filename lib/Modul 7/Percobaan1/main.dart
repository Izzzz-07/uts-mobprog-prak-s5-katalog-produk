import 'package:flutter/material.dart';
import 'home.dart'; // Memanggil class Home dari file home.dart[cite: 24]

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(), // Halaman utama aplikasi diarahkan ke Home[cite: 24]
    );
  }
}