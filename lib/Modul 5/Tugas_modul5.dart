import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Music Card',
      // Langkah a: Menggunakan tema gelap
      theme: ThemeData.dark(),
      home: Scaffold(
        appBar: AppBar(
          // Langkah b: Judul aplikasi dan centerTitle
          title: const Text('Sedang memutar'),
          centerTitle: true,
        ),
        // Langkah c: Menempatkan Card di tengah layar
        body: Center(
          // Memberi sedikit jarak dari tepi layar agar Card tidak menempel penuh
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Card(
              // Langkah d: Atur elevasi dan bentuk sudut melengkung Card
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              child: Padding(
                // Langkah d: Padding di dalam Card sebesar 12
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  mainAxisSize: MainAxisSize.min, // Agar Card tidak memanjang ke bawah
                  children: [
                    const SizedBox(height: 20), // Memberi jarak atas
                    
                    // Ikon Cover Album
                    Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.grey[800],
                      ),
                      padding: const EdgeInsets.all(24),
                      child: const Icon(
                        Icons.album,
                        size: 80,
                        color: Colors.blueGrey,
                      ),
                    ),
                    
                    // Jarak tetap antara cover album dan teks menggunakan SizedBox
                    const SizedBox(height: 30),
                    
                    // Row untuk menyusun Teks dan Tombol Like
                    Row(
                      children: [
                        // Column untuk Judul dan Artis agar tersusun vertikal
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Di sini ada judul lagu',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            // SizedBox memberi jarak kecil antara Judul dan Nama Artis
                            const SizedBox(height: 4),
                            Text(
                              'Di sini ada nama artis',
                              style: TextStyle(
                                fontSize: 14,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                        
                        // Spacer mendorong tombol Like ke ujung paling kanan
                        const Spacer(),
                        
                        // Tombol Like (Ikon Hati)
                        IconButton(
                          icon: const Icon(
                            Icons.favorite_border,
                            color: Colors.pink,
                          ),
                          onPressed: () {}, // Aksi tombol kosong
                        ),
                      ],
                    ),
                    const SizedBox(height: 10), // Jarak bawah
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}