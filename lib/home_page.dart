import 'package:flutter/material.dart';
import 'cell_detail_page.dart';  // Mengimpor halaman detail sel.

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;
  int _selectedOption = -1;

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
            ),
          ],
        ),
      ),
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

  Widget _buildOption(String text, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedOption = index;
        });
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
