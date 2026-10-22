import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

void main() {
  runApp(const UTSApp());
}

class UTSApp extends StatelessWidget {
  const UTSApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Katalog Produk UTS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        useMaterial3: true,
      ),
      home: const HalamanKatalog(),
    );
  }
}

// 1. CLASS MODEL: Mengonversi data JSON API menjadi objek Dart
class Produk {
  final int id;
  final String title;
  final double price;
  final String category;
  final String image;

  Produk({
    required this.id,
    required this.title,
    required this.price,
    required this.category,
    required this.image,
  });

  // Factory method untuk memetakan JSON ke atribut class
  factory Produk.fromJson(Map<String, dynamic> json) {
    return Produk(
      id: json['id'],
      title: json['title'],
      // Memastikan tipe data angka aman (bisa int atau double dari JSON)
      price: (json['price'] as num).toDouble(),
      category: json['category'],
      image: json['image'],
    );
  }
}

class HalamanKatalog extends StatefulWidget {
  const HalamanKatalog({super.key});

  @override
  State<HalamanKatalog> createState() => _HalamanKatalogState();
}

class _HalamanKatalogState extends State<HalamanKatalog> {
  // 2. FUNGSI ASYNCHRONOUS: Mengambil data dari API
  late Future<List<Produk>> futureProduk;

  @override
  void initState() {
    super.initState();
    futureProduk = _ambilDataProduk();
  }

  Future<List<Produk>> _ambilDataProduk() async {
    // Menggunakan Fake Store API sebagai sumber data dinamis
    final response = await http.get(Uri.parse('https://fakestoreapi.com/products'));

    if (response.statusCode == 200) {
      // Decode respons JSON menjadi List of dynamic
      List<dynamic> dataJson = jsonDecode(response.body);
      // Mapping List dynamic menjadi List objek Produk menggunakan Class Model
      return dataJson.map((json) => Produk.fromJson(json)).toList();
    } else {
      throw Exception('Gagal mengambil data dari API');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Produk', style: TextStyle(fontWeight: FontWeight.bold)),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[100],
      // 3. FUTUREBUILDER: Menangani status koneksi (Loading, Error, Success)
      body: FutureBuilder<List<Produk>>(
        future: futureProduk,
        builder: (context, snapshot) {
          // KONDISI 1: LOADING (Sedang menunggu data)
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(),
                  SizedBox(height: 15),
                  Text('Mengambil data produk...'),
                ],
              ),
            );
          } 
          // KONDISI 2: ERROR (Permintaan gagal/tidak ada internet)
          else if (snapshot.hasError) {
            return Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.error_outline, color: Colors.red, size: 60),
                  const SizedBox(height: 15),
                  Text('Terjadi Kesalahan: ${snapshot.error}', textAlign: TextAlign.center),
                  const SizedBox(height: 15),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        futureProduk = _ambilDataProduk();
                      });
                    },
                    child: const Text('Coba Lagi'),
                  )
                ],
              ),
            );
          } 
          // KONDISI 3: SUCCESS (Data berhasil diperoleh dan siap disajikan)
          else if (snapshot.hasData && snapshot.data!.isNotEmpty) {
            List<Produk> daftarProduk = snapshot.data!;
            
            return GridView.builder(
              padding: const EdgeInsets.all(12),
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, // 2 kolom produk
                childAspectRatio: 0.65, // Rasio tinggi kotak
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: daftarProduk.length,
              itemBuilder: (context, index) {
                Produk produk = daftarProduk[index];
                return Card(
                  elevation: 3,
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Gambar Produk
                        Expanded(
                          child: Center(
                            child: Image.network(
                              produk.image,
                              fit: BoxFit.contain,
                              errorBuilder: (context, error, stackTrace) => const Icon(Icons.broken_image),
                            ),
                          ),
                        ),
                        const SizedBox(height: 10),
                        // Kategori Produk
                        Text(
                          produk.category.toUpperCase(),
                          style: const TextStyle(fontSize: 10, color: Colors.grey, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        // Judul Produk
                        Text(
                          produk.title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: const TextStyle(fontSize: 14, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        // Harga Produk
                        Text(
                          '\$${produk.price}',
                          style: const TextStyle(fontSize: 16, color: Colors.teal, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          } 
          // Kondisi jika data kosong
          else {
            return const Center(child: Text('Tidak ada data produk.'));
          }
        },
      ),
    );
  }
}