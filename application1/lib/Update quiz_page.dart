import 'package:flutter/material.dart';
import 'quiz_review_page.dart'; // Mengimpor halaman review

// Kelas untuk mendefinisikan pertanyaan
class Question {
  final String questionText; // Teks pertanyaan
  final List<String> options; // Pilihan jawaban
  final String answer; // Jawaban benar

  Question({
    required this.questionText,
    required this.options,
    required this.answer,
  });
}

// Kelas untuk halaman kuis
class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

// State untuk halaman kuis
class _QuizPageState extends State<QuizPage> {
  // List pertanyaan yang akan ditampilkan di kuis
  final List<Question> _questions = [
    Question(
      questionText: 'Apa bagian sel yang mengatur lalu lintas zat?',
      options: ['Membran Sel', 'Sitoplasma', 'Nukleus', 'Mitokondria'],
      answer: 'Membran Sel',
    ),
    Question(
      questionText: 'Apa yang dihasilkan oleh mitokondria?',
      options: ['Energi', 'Protein', 'Glukosa', 'Asam Lemak'],
      answer: 'Energi',
    ),
  ];

  int _currentQuestionIndex = 0; // Menyimpan indeks pertanyaan saat ini
  List<String> _selectedAnswers = []; // List untuk menyimpan jawaban yang dipilih pengguna

  // Fungsi untuk melanjutkan ke pertanyaan berikutnya
  void _nextQuestion(String selectedAnswer) {
    _selectedAnswers.add(selectedAnswer); // Simpan jawaban yang dipilih

    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++; // Menaikkan indeks pertanyaan
      });
    } else {
      // Jika semua pertanyaan sudah dijawab, pindah ke halaman review hasil kuis
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => QuizReviewPage(
            questions: _questions, // Kirim daftar pertanyaan ke halaman review
            selectedAnswers: _selectedAnswers, // Kirim jawaban yang dipilih
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuis Biologi'), // Judul pada AppBar
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0), // Padding di seluruh isi halaman
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start, // Mengatur teks ke kiri
          children: [
            // Menampilkan pertanyaan saat ini
            Text(
              _questions[_currentQuestionIndex].questionText,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold, // Mengatur ketebalan teks
              ),
            ),
            const SizedBox(height: 20), // Jarak antara pertanyaan dan opsi jawaban

            // Menampilkan pilihan jawaban
            Column(
              children: _questions[_currentQuestionIndex].options.map((option) {
                return Container(
                  margin: const EdgeInsets.only(bottom: 10), // Jarak antar tombol
                  width: double.infinity, // Membuat tombol selebar mungkin
                  child: ElevatedButton(
                    onPressed: () {
                      // Memeriksa apakah jawaban yang dipilih benar
                      String message = (option == _questions[_currentQuestionIndex].answer)
                          ? 'Jawaban Benar!'
                          : 'Jawaban Salah!';
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(message)), // Menampilkan pesan jawaban
                      );
                      _nextQuestion(option); // Panggil fungsi untuk melanjutkan ke pertanyaan berikutnya
                    },
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(vertical: 15), // Padding di dalam tombol
                      backgroundColor: Colors.purple.shade200, // Warna latar tombol
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10), // Membuat sudut tombol melengkung
                      ),
                    ),
                    child: Text(
                      option,
                      style: const TextStyle(
                        fontSize: 16, // Ukuran teks di dalam tombol
                      ),
                    ),
                  ),
                );
              }).toList(), // Mengonversi map menjadi list
            ),
          ],
        ),
      ),
    );
  }
}
