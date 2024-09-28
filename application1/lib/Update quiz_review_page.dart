import 'package:flutter/material.dart';
import 'quiz_page.dart'; // Mengimpor kelas Question

// Kelas untuk halaman review
class QuizReviewPage extends StatelessWidget {
  final List<Question> questions; // Daftar pertanyaan
  final List<String> selectedAnswers; // Jawaban yang dipilih

  // Konstruktor untuk QuizReviewPage
  QuizReviewPage({
    required this.questions,
    required this.selectedAnswers,
  });

  @override
  Widget build(BuildContext context) {
    int correctAnswersCount = 0; // Menyimpan jumlah jawaban benar

    // Menghitung jumlah jawaban benar
    for (var index = 0; index < questions.length; index++) {
      if (selectedAnswers[index] == questions[index].answer) {
        correctAnswersCount++; // Hitung jawaban benar
      }
    }

    // Menghitung skor
    double score = (correctAnswersCount == questions.length) ? 100 : (correctAnswersCount / questions.length) * 100;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Kuis'), // Judul di AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding di seluruh isi halaman
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Mengatur teks ke kiri
          children: [
            // Menampilkan setiap pertanyaan dan jawaban pengguna
            Expanded(
              child: ListView.builder(
                itemCount: questions.length, // Jumlah pertanyaan
                itemBuilder: (context, index) {
                  final isCorrect = selectedAnswers[index] == questions[index].answer; // Memeriksa jawaban benar

                  return Card( // Membuat kartu untuk setiap pertanyaan
                    margin: const EdgeInsets.symmetric(vertical: 8), // Jarak antar kartu
                    child: ListTile(
                      title: Text(questions[index].questionText), // Menampilkan teks pertanyaan
                      subtitle: Text(
                        'Jawaban Anda: ${selectedAnswers[index]}\nJawaban Benar: ${questions[index].answer}', // Menampilkan jawaban yang dipilih
                        style: TextStyle(
                          color: isCorrect ? Colors.green : Colors.red, // Mengubah warna berdasarkan jawaban
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),

            // Menampilkan skor di bagian bawah
            Padding(
              padding: const EdgeInsets.all(16.0), // Padding di sekitar teks skor
              child: Text(
                'Skor: ${score.toStringAsFixed(2)} / 100', // Menampilkan skor
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold, // Ketebalan teks
                ),
              ),
            ),

            // Tombol untuk mengulang kuis
            ElevatedButton(
              onPressed: () {
                Navigator.popUntil(context, (route) => route.isFirst); // Kembali ke halaman utama
              },
              child: const Text('Ulang Kuis'), // Teks tombol
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15), // Padding di dalam tombol
                backgroundColor: Colors.blue, // Warna latar tombol
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10), // Membuat sudut tombol melengkung
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
