import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http; // Paket untuk ambil data dari internet[cite: 23]

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Demo GridView.builder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.amber),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Demo GridView.builder'),
    );
  }
}

// Langkah 3d: Menggunakan StatefulWidget karena datanya dinamis[cite: 23]
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  // List kosong untuk menyimpan data berita dari internet[cite: 24]
  List dataBerita = [];

  @override
  void initState() {
    super.initState();
    // Memanggil fungsi ambil data saat aplikasi pertama kali dibuka[cite: 24]
    _ambilData();
  }

  // Langkah 3e: Method request data API[cite: 24]
  Future<void> _ambilData() async {
    try {
      final response = await http.get(
        Uri.parse('https://jakpost.vercel.app/api/category/business/tech'),
      );
      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        setState(() {
          dataBerita = data['posts']; // Memasukkan data API ke dalam List[cite: 24]
        });
      } else {
        throw Exception('Gagal load data');
      }
    } catch (e) {
      print(e);
    }
  }

  // Langkah 3f - 3h: Menampilkan GridView.builder[cite: 24]
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.amber,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: 1.25,
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
          ),
          itemCount: dataBerita.length, // Menghitung otomatis jumlah berita[cite: 24]
          // Langkah 3i: Menyusun desain per-kotak berita[cite: 24, 25]
          itemBuilder: (context, index) {
            return ClipRRect(
              borderRadius: BorderRadius.circular(15),
              child: GridTile(
                footer: SizedBox(
                  height: 65,
                  child: GridTileBar(
                    backgroundColor: Colors.black26.withAlpha(175),
                    title: Text(
                      dataBerita[index]['title'] ?? 'Tanpa judul',
                      maxLines: 3,
                      overflow: TextOverflow.ellipsis, // Teks kepanjangan jadi titik-titik (...)
                    ),
                  ),
                ),
                child: Image.network(
                  dataBerita[index]['image'] ?? 'https://cdn.pixabay.com/photo/2018/03/17/20/51/white-buildings-3235135_340.jpg',
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => const Center(child: Icon(Icons.broken_image)),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}