import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Daftar Game F2P',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Daftar Game F2P'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // Menyiapkan list kosong untuk data game
  List dataGame = [];

  @override
  void initState() {
    super.initState();
    _ambilData();
  }

  // Langkah c: Method request data ke server API FreeToGame
  Future<void> _ambilData() async {
    try {
      final response = await http.get(
        Uri.parse('https://www.freetogame.com/api/games'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          // Menyimpan hanya 20 data pertama dari API ke List
          dataGame = data.take(20).toList();
        });
      } else {
        throw Exception('Gagal load data dari FreeToGame API');
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      backgroundColor: Colors.grey[200], // Latar belakang abu-abu agar list putih terlihat menonjol
      // Langkah f: Menggunakan fungsi _listItem di ListView.builder[cite: 25]
      body: dataGame.isEmpty 
          ? const Center(child: CircularProgressIndicator()) // Efek loading saat data diambil
          : ListView.builder(
              padding: const EdgeInsets.only(top: 10),
              itemCount: dataGame.length,
              itemBuilder: (context, index) {
                return _listItem(
                  dataGame[index]['thumbnail'] ?? 'https://via.placeholder.com/150',
                  dataGame[index]['title'] ?? 'Tidak ada judul',
                  dataGame[index]['genre'] ?? 'Tidak ada genre',
                  dataGame[index]['release_date'] ?? 'Tidak ada tanggal',
                );
              },
            ),
    );
  }
}

// Langkah d: Menambahkan fungsi _tombolBaca di luar class _MyHomePageState[cite: 24]
Container _tombolBaca() {
  return Container(
    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
    decoration: BoxDecoration(
      color: Colors.orange,
      borderRadius: BorderRadius.circular(15),
    ),
    child: const Text(
      'Baca Info',
      style: TextStyle(color: Colors.white),
    ),
  );
}

// Langkah e: Menambahkan fungsi _listItem di luar class _MyHomePageState[cite: 25]
Container _listItem(String url, String judul, String genre, String rilis) {
  return Container(
    padding: const EdgeInsets.all(15),
    margin: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
    ),
    child: Row(
      children: [
        ClipRRect(
          borderRadius: BorderRadius.circular(5),
          child: Image.network(
            url,
            width: 70,
            height: 70,
            fit: BoxFit.cover,
            errorBuilder: (context, error, stackTrace) => const SizedBox(width: 70, height: 70, child: Icon(Icons.broken_image)),
          ),
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                judul,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(genre, style: const TextStyle(color: Colors.grey)),
                      const SizedBox(height: 2),
                      Text(rilis, style: const TextStyle(color: Colors.grey)),
                    ],
                  ),
                  _tombolBaca(),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}