import 'package:flutter/material.dart';

// Kelas untuk halaman kuis
class QuizPage extends StatefulWidget {
  const QuizPage({super.key});

  @override
  _QuizPageState createState() => _QuizPageState();
}

// State untuk QuizPage
class _QuizPageState extends State<QuizPage> {
  // List pertanyaan yang akan ditampilkan di kuis
  final List<Question> _questions = [
    Question(
      questionText: 'Apa bagian sel yang mengatur lalu lintas zat?',
      options: ['Membran Sel', 'Sitoplasma', 'Nukleus', 'Mitokondria'],
      answer: 'Membran Sel',  // Jawaban benar
    ),
    Question(
      questionText: 'Apa yang dihasilkan oleh mitokondria?',
      options: ['Energi', 'Protein', 'Glukosa', 'Asam Lemak'],
      answer: 'Energi',  // Jawaban benar
    ),
    // Tambahkan pertanyaan lainnya
  ];

  int _currentQuestionIndex = 0;  // Menyimpan indeks pertanyaan saat ini

  // Fungsi untuk melanjutkan ke pertanyaan berikutnya
  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      _currentQuestionIndex++;  // Menaikkan indeks pertanyaan
      setState(() {});  // Memperbarui tampilan
    } else {
      Navigator.pop(context);  // Kembali ke halaman sebelumnya jika sudah pertanyaan terakhir
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Kuis Biologi'),  // Judul halaman
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),  // Memberikan padding di seluruh isi
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,  // Mengatur teks ke kiri
          children: [
            // Menampilkan pertanyaan saat ini
            Text(
              _questions[_currentQuestionIndex].questionText,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,  // Mengatur ketebalan teks
              ),
            ),
            const SizedBox(height: 20),  // Jarak antara pertanyaan dan opsi
            // Menampilkan pilihan jawaban
            ..._questions[_currentQuestionIndex].options.map((option) {
              return ElevatedButton(
                onPressed: () {
                  // Memeriksa apakah jawaban yang dipilih benar
                  if (option == _questions[_currentQuestionIndex].answer) {
                    // Jika benar, tampilkan pesan
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Jawaban Benar!')),
                    );
                  } else {
                    // Jika salah, tampilkan pesan
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Jawaban Salah!')),
                    );
                  }
                  _nextQuestion();  // Melanjutkan ke pertanyaan berikutnya
                },
                child: Text(option),  // Teks pada tombol
              );
            }).toList(),  // Mengonversi map menjadi list
          ],
        ),
      ),
    );
  }
}

// Kelas untuk mendefinisikan pertanyaan
class Question {
  final String questionText;  // Teks pertanyaan
  final List<String> options;  // Pilihan jawaban
  final String answer;  // Jawaban benar

  Question({
    required this.questionText,
    required this.options,
    required this.answer,
  });
}
