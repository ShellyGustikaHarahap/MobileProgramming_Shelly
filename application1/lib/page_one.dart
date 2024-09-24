import 'package:flutter/material.dart';
import 'home_page.dart';  // Mengimpor halaman MyHomePage.

class PageOne extends StatefulWidget {  // StatefulWidget untuk halaman pertama yang dapat berubah sesuai interaksi pengguna.
  const PageOne({super.key});

  @override
  State<PageOne> createState() => _PageOneState();  // Membuat state dari PageOne.
}

class _PageOneState extends State<PageOne> {
  int _selectedIndex = 0;  // Variabel untuk melacak item yang dipilih pada BottomNavigationBar.

  void _onItemTapped(int index) {  // Fungsi yang dijalankan ketika item pada BottomNavigationBar diklik.
    setState(() {
      _selectedIndex = index;  // Mengubah indeks yang dipilih.
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(  // Scaffold menyediakan struktur dasar halaman (appBar, body, bottomNavigationBar).
      body: Center(
        child: Column(  // Mengatur logo dan tombol di tengah halaman menggunakan Column.
          mainAxisAlignment: MainAxisAlignment.center,  // Menyusun elemen di tengah-tengah halaman.
          children: <Widget>[
            Image.asset(  // Menampilkan logo yang ada di folder assets.
              'assets/logo.png',
              width: 350,
              height: 350,
            ),
            const SizedBox(height: 50),  // Menambahkan jarak vertikal antara logo dan tombol.
            ElevatedButton(  // Tombol Start.
              onPressed: () {
                // Arahkan ke halaman berikutnya ketika tombol ditekan.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const MyHomePage()),  // Navigasi ke halaman berikutnya (MyHomePage).
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple.shade200,  // Warna latar belakang tombol.
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),  // Membuat tombol dengan sudut bulat.
                ),
                padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),  // Memberi padding di dalam tombol.
              ),
              child: const Text(
                'START',  // Teks pada tombol.
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,  // Warna teks tombol.
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(  // BottomNavigationBar di bagian bawah halaman.
        items: const <BottomNavigationBarItem>[  // Ikon-ikon di dalam BottomNavigationBar.
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '',  // Ikon home.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.bookmark_border),
            label: '',  // Ikon bookmark.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.message_outlined),
            label: '',  // Ikon pesan.
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.star_border),
            label: '',  // Ikon bintang.
          ),
        ],
        currentIndex: _selectedIndex,  // Menentukan item yang sedang dipilih.
        selectedItemColor: Colors.purple,  // Warna ikon yang dipilih.
        unselectedItemColor: Colors.black,  // Warna ikon yang tidak dipilih.
        onTap: _onItemTapped,  // Fungsi ketika salah satu item diklik.
      ),
    );
  }
}
