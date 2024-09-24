import 'package:flutter/material.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;  // Menyimpan indeks dari BottomNavigationBar.

  void _onItemTapped(int index) {  // Fungsi yang dijalankan ketika item di BottomNavigationBar diklik.
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(  // AppBar di bagian atas halaman.
        title: const Text(
          'STUDY MATE BIOLOGI',  // Judul pada AppBar.
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
        backgroundColor: Colors.white,  // Warna latar belakang AppBar.
        elevation: 0,  // Menghilangkan bayangan pada AppBar.
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Center(
              child: Text(
                'Biologi',  // Label di sebelah kanan AppBar.
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
      body: const Center(
        child: Text(
          'Welcome to Study Mate Biologi!',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.purple,
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(  // BottomNavigationBar di bagian bawah halaman.
        items: const <BottomNavigationBarItem>[  // Item-item pada BottomNavigationBar.
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
        selectedItemColor: Colors.purple,  // Warna item yang dipilih.
        unselectedItemColor: Colors.black,  // Warna item yang tidak dipilih.
        onTap: _onItemTapped,  // Fungsi ketika item diklik.
      ),
    );
  }
}
