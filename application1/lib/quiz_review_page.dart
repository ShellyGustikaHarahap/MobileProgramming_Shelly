import 'package:flutter/material.dart';
import 'quiz_page.dart'; // Pastikan untuk mengimpor kelas Question

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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Review Kuis'), // Judul di AppBar
      ),
      body: ListView.builder(
        itemCount: questions.length, // Jumlah pertanyaan
        itemBuilder: (context, index) {
          final isCorrect = selectedAnswers[index] == questions[index].answer; // Memeriksa apakah jawaban benar
          return ListTile(
            title: Text(questions[index].questionText), // Menampilkan teks pertanyaan
            subtitle: Column(
              crossAxisAlignment: CrossAxisAlignment.start, // Mengatur teks ke kiri
              children: [
                Text('Jawaban Anda: ${selectedAnswers[index]}'), // Menampilkan jawaban yang dipilih
                if (!isCorrect) // Jika jawaban salah
                  Text(
                    'Jawaban Benar: ${questions[index].answer}', // Menampilkan jawaban yang benar
                    style: const TextStyle(color: Colors.red), // Warna merah untuk jawaban yang benar
                  ),
                const SizedBox(height: 5), // Jarak antara jawaban
              ],
            ),
            trailing: isCorrect // Menampilkan ikon sesuai dengan status jawaban
                ? const Icon(Icons.check, color: Colors.green)
                : const Icon(Icons.close, color: Colors.red),
          );
        },
      ),
    );
  }
}
