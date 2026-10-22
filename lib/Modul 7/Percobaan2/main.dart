import 'package:flutter/material.dart';
import 'home.dart';
import 'tujuan.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // Halaman pertama yang dibuka adalah '/'
      initialRoute: '/', //
      // Mendaftarkan nama-nama rute halaman
      routes: {
        '/': (context) => const HomePage(), //[cite: 19]
        '/tujuan': (context) => const TujuanPage(), //[cite: 19]
      },
    );
  }
}