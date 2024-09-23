import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Study Mate Biologi',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PageOne(), // Halaman pertama saat aplikasi dimulai
    );
  }
}

// Halaman pertama (logo dan tombol start)
class PageOne extends StatefulWidget {
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();
}

class _PageOneState extends State<PageOne> {
  int _selectedIndex = 0; // Menyimpan indeks yang dipilih pada BottomNavigationBar

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            // Logo Gambar
            Image.asset(
              'assets/logo.png', // Pastikan logo gambar Anda ada di folder ini
              width: 350,
              height: 350,
            ),
            const SizedBox(height: 50), // Jarak antara logo dan tombol
            // Tombol Start
            ElevatedButton(
              onPressed: () {
                // Arahkan ke halaman berikutnya ketika tombol ditekan
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade200, // Warna latar belakang
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30), // Sudut bulat
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: const Text(
                'START',
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black, // Warna teks
                ),
              ),
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar untuk PageOne
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }
}

// Halaman setelah menekan tombol "START"
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  int _selectedOption = -1; // Variabel untuk melacak opsi yang dipilih oleh pengguna

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'STUDY MATE BIOLOGI',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Biologi',
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.purple.shade300,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildOption('KD 3.1 Menganalisis Struktur Fungsi dan Proses Terjadi Pada Sel Sebagai Unit Terkecil', 0),
            const SizedBox(height: 16),
            _buildOption('KD 3.4 Menjelaskan Proses Metabolisme Pada Tumbuhan Fotosintesis', 1),
            const SizedBox(height: 16),
            _buildOption('KD 3.3 Menganalisis Struktur Jaringan Pada Tumbuhan dan Fungsinya', 2),
            const SizedBox(height: 32),
            Container(
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(
                color: Colors.purple.shade100,
                borderRadius: BorderRadius.circular(16),
              ),
              // Konten tambahan bisa ditambahkan di sini
            ),
          ],
        ),
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: '',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.purple,
        unselectedItemColor: Colors.black,
        onTap: _onItemTapped,
      ),
    );
  }

  // Fungsi untuk membuat opsi pilihan KD (Kompetensi Dasar)
  Widget _buildOption(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOption = index;
        });
        // Jika KD 3.1 dipilih, navigasi ke halaman detail sel
        if (index == 0) {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const CellDetailPage()),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        decoration: BoxDecoration(
          color: Colors.purple.shade100,
          borderRadius: BorderRadius.circular(30),
        ),
        child: Row(
          children: [
            Radio(
              value: index,
              groupValue: _selectedOption,
              activeColor: Colors.purple.shade300,
              onChanged: (value) {
                setState(() {
                  _selectedOption = value!;
                });
              },
            ),
            Expanded(
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// Halaman detail sel untuk KD 3.1
class CellDetailPage extends StatelessWidget {
  const CellDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'STUDY MATE BIOLOGI - SEL',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.purple.shade100,
                borderRadius: BorderRadius.circular(30),
              ),
              child: const Text(
                'Sel adalah unit dasar dari kehidupan yang terdapat pada semua organisme. '
                'Sel terdiri dari beberapa bagian yang memiliki fungsi spesifik:\n\n'
                '1. Membran Sel: Mengatur lalu lintas zat yang keluar masuk sel.\n'
                '2. Sitoplasma: Tempat terjadinya reaksi kimia.\n'
                '3. Inti Sel (Nukleus): Mengontrol aktivitas sel dan membawa materi genetik.\n'
                '4. Mitokondria: Menghasilkan energi dalam bentuk ATP melalui respirasi sel.\n'
                '5. Kloroplas (pada tumbuhan): Tempat berlangsungnya fotosintesis.\n\n'
                'Pentingnya: Memahami sel adalah dasar dalam memahami fungsi organisme secara keseluruhan.',
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 16),
            // Gambar sel
            Image.asset(
              'assets/logo_sel.png', // Gambar sel
              width: double.infinity,
              height: 200,
            ),
          ],
        ),
      ),
    );
  }
}
