import 'package:flutter/material.dart';
import 'page_one.dart';  // Mengimpor halaman pertama.

void main() {
  runApp(const MyApp());  // Fungsi utama yang menjalankan aplikasi dengan root widget MyApp.
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
      home: const PageOne(),  // Halaman pertama saat aplikasi dibuka.
    );
  }
}
