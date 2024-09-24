import 'package:flutter/material.dart';
import 'page_one.dart'; // Mengimpor halaman PageOne.

void main() {
  runApp(const MyApp());  // Fungsi utama yang menjalankan aplikasi dengan root widget MyApp.
}

class MyApp extends StatelessWidget {  // Kelas utama aplikasi yang bersifat Stateless (tidak berubah).
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(  // MaterialApp adalah widget root yang mengatur navigasi dan tema.
      title: 'Study Mate Biologi',  // Menentukan judul aplikasi.
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),  // Skema warna utama aplikasi.
        useMaterial3: true,  // Mengaktifkan Material Design versi 3.
      ),
      home: const PageOne(),  // Menampilkan halaman pertama (PageOne) saat aplikasi dibuka.
    );
  }
}
