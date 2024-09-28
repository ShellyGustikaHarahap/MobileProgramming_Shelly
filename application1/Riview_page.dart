import 'package:flutter/material.dart';

// Kelas untuk halaman review hasil kuis
class ReviewPage extends StatelessWidget {
  final int score; // Skor akhir dari kuis
  final int totalQuestions; // Total jumlah pertanyaan di kuis

  const ReviewPage({super.key, required this.score, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hasil Kuis'), // Judul halaman
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Memberikan padding di seluruh isi
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center, // Menempatkan konten di tengah vertikal
          crossAxisAlignment: CrossAxisAlignment.center, // Menempatkan konten di tengah horizontal
          children: [
            // Tampilkan pesan hasil
            Text(
              'Skor Anda:',
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold, // Mengatur ketebalan teks
              ),
            ),
            const SizedBox(height: 20), // Jarak antara teks
            Text(
              '$score / $totalQuestions', // Menampilkan skor pengguna
              style: const TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold, // Mengatur ketebalan teks
                color: Colors.purple,
              ),
            ),
            const SizedBox(height: 50), // Jarak antara teks dan tombol
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context); // Kembali ke halaman sebelumnya
              },
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
                backgroundColor: Colors.purple,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: const Text(
                'Kembali',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white, // Warna teks pada tombol
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
