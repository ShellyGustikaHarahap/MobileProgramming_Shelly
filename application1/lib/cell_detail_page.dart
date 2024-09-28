import 'package:flutter/material.dart';

class CellDetailPage extends StatefulWidget {
  const CellDetailPage({super.key});

  @override
  _CellDetailPageState createState() => _CellDetailPageState();
}

class _CellDetailPageState extends State<CellDetailPage> {
  final PageController _pageController = PageController();  // Membuat controller untuk PageView
  int _currentPage = 0;  // Menyimpan halaman saat ini

  void _goToNextPage() {
    if (_currentPage < 1) {  // Memastikan tidak melebihi jumlah halaman
      _currentPage++;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),  // Durasi animasi
        curve: Curves.easeInOut,  // Kurva animasi
      );
      setState(() {});  // Memperbarui tampilan
    }
  }

  void _goToPreviousPage() {
    if (_currentPage > 0) {  // Memastikan tidak kurang dari halaman pertama
      _currentPage--;
      _pageController.animateToPage(
        _currentPage,
        duration: const Duration(milliseconds: 300),  // Durasi animasi
        curve: Curves.easeInOut,  // Kurva animasi
      );
      setState(() {});  // Memperbarui tampilan
    }
  }

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
          children: [
            Expanded(
              child: PageView(
                controller: _pageController,  // Mengaitkan controller dengan PageView
                onPageChanged: (index) {
                  setState(() {
                    _currentPage = index;  // Memperbarui halaman saat ini
                  });
                },
                children: [
                  // Halaman Pertama - Detail Sel
                  Column(
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
                      Center(
                        child: Container(
                          width: 200,
                          height: 150,
                          decoration: BoxDecoration(
                            color: Colors.purple.shade100,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Image.asset(
                            'assets/logo_sel.png',  // Pastikan jalur dan nama file benar
                            fit: BoxFit.contain,
                          ),
                        ),
                      ),
                    ],
                  ),
                  // Halaman Kedua - Materi Lanjutan
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: const EdgeInsets.all(16),
                        decoration: BoxDecoration(
                          color: Colors.purple.shade100,
                          borderRadius: BorderRadius.circular(30),
                        ),
                        child: const Text(
                          'Materi Lanjutan: Jenis-jenis Sel\n\n'
                          '1. Sel Prokariotik: Sel tanpa inti sejati, biasanya lebih kecil dan sederhana.\n'
                          '2. Sel Eukariotik: Sel dengan inti sejati, lebih besar dan kompleks, ditemukan pada hewan, tumbuhan, dan jamur.\n'
                          '3. Sel Tumbuhan: Memiliki dinding sel, kloroplas, dan vakuola besar.\n'
                          '4. Sel Hewan: Tidak memiliki dinding sel dan umumnya lebih fleksibel.\n\n'
                          '5. Sel Stem: Sel yang memiliki kemampuan untuk berkembang menjadi berbagai jenis sel.\n'
                          'Penting untuk memahami perbedaan antara jenis sel ini dalam studi biologi.',
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),  // Jarak vertikal sebelum tombol panah
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,  // Memposisikan tombol panah di ujung
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_back),  // Ikon panah kiri
                  onPressed: _goToPreviousPage,  // Menjalankan fungsi untuk halaman sebelumnya
                ),
                IconButton(
                  icon: const Icon(Icons.arrow_forward),  // Ikon panah kanan
                  onPressed: _goToNextPage,  // Menjalankan fungsi untuk halaman selanjutnya
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
