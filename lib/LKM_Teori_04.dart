import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const CampusNavigatorApp());
}

class CampusNavigatorApp extends StatelessWidget {
  const CampusNavigatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Campus Navigator',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => const HomePage(),
        '/profile': (context) => const ProfilePage(),
        '/detail': (context) => const DetailPage(),
        '/form': (context) => const RegistrationPage(),
      },
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int tapCount = 0;
  bool notificationOn = true;
  String selectedRole = 'Mahasiswa';

  Future<void> openWebsite() async {
    final uri = Uri.parse('https://flutter.dev');
    final success = await launchUrl(
      uri,
      mode: LaunchMode.externalApplication,
    );

    if (!success && mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Website tidak dapat dibuka.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Campus Navigator'),
        centerTitle: true,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Navigasi • Intent • Event',
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 8),
          const Text(
            'Praktik interaksi antarmuka dengan Flutter.',
          ),
          const SizedBox(height: 24),

          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '1. Penanganan Event',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  Text('Tombol ditekan: $tapCount kali'),
                  const SizedBox(height: 8),
                  FilledButton.icon(
                    onPressed: () {
                      setState(() {
                        tapCount++;
                      });
                    },
                    icon: const Icon(Icons.touch_app),
                    label: const Text('Tekan Saya'),
                  ),
                  SwitchListTile(
                    contentPadding: EdgeInsets.zero,
                    title: const Text('Notifikasi'),
                    value: notificationOn,
                    onChanged: (value) {
                      setState(() {
                        notificationOn = value;
                      });
                    },
                  ),
                  DropdownButton<String>(
                    value: selectedRole,
                    isExpanded: true,
                    items: const [
                      DropdownMenuItem(
                        value: 'Mahasiswa',
                        child: Text('Mahasiswa'),
                      ),
                      DropdownMenuItem(
                        value: 'Asisten',
                        child: Text('Asisten'),
                      ),
                      DropdownMenuItem(
                        value: 'Dosen',
                        child: Text('Dosen'),
                      ),
                    ],
                    onChanged: (value) {
                      if (value != null) {
                        setState(() {
                          selectedRole = value;
                        });
                      }
                    },
                  ),
                  Text('Peran aktif: $selectedRole'),
                ],
              ),
            ),
          ),

          const SizedBox(height: 12),
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  const Text(
                    '2. Navigasi & Intent',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 12),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/profile');
                    },
                    child: const Text('Buka Profile'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(
                        context,
                        '/detail',
                        arguments: {
                          'nama': 'Alya Rahma',
                          'nim': '24650001',
                          'role': selectedRole,
                        },
                      );
                    },
                    child: const Text('Kirim Data ke Detail'),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/form');
                    },
                    child: const Text('Buka Form'),
                  ),
                  FilledButton.tonalIcon(
                    onPressed: openWebsite,
                    icon: const Icon(Icons.open_in_browser),
                    label: const Text('Buka flutter.dev'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const CircleAvatar(
              radius: 36,
              child: Icon(Icons.person, size: 40),
            ),
            const SizedBox(height: 12),
            const Text(
              'Mahasiswa Informatika',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 16),
            FilledButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Kembali'),
            ),
          ],
        ),
      ),
    );
  }
}

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    final args = ModalRoute.of(context)!.settings.arguments
        as Map<String, dynamic>?;

    final nama = args?['nama'] ?? '-';
    final nim = args?['nim'] ?? '-';
    final role = args?['role'] ?? '-';

    return Scaffold(
      appBar: AppBar(title: const Text('Detail Data')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: ListTile(
            leading: const Icon(Icons.badge),
            title: Text(nama),
            subtitle: Text('NIM: $nim\nPeran: $role'),
          ),
        ),
      ),
    );
  }
}

class RegistrationPage extends StatefulWidget {
  const RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  final formKey = GlobalKey<FormState>();
  final nameController = TextEditingController();
  String liveText = '';

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  void submitForm() {
    if (formKey.currentState!.validate()) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Data diterima'),
          content: Text('Selamat datang, ${nameController.text}!'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('OK'),
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Form Event')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              TextFormField(
                controller: nameController,
                decoration: const InputDecoration(
                  labelText: 'Nama mahasiswa',
                  border: OutlineInputBorder(),
                ),
                onChanged: (value) {
                  setState(() {
                    liveText = value;
                  });
                },
                validator: (value) {
                  if (value == null || value.trim().length < 3) {
                    return 'Nama minimal 3 karakter.';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 12),
              Text('Preview input: $liveText'),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: submitForm,
                child: const Text('Simpan'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

