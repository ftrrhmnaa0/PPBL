import 'package:flutter/material.dart';
import 'halaman_utama.dart';

void main() {
  runApp(const NusantaraCerdasApp());
}

class NusantaraCerdasApp extends StatelessWidget {
  const NusantaraCerdasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nusantara Cerdas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF2F4F8),
        appBarTheme: const AppBarTheme(
          backgroundColor: Color(0xFF176B5B),
          foregroundColor: Colors.white,
          centerTitle: true,
        ),
      ),
      home: const HalamanUtama(),
    );
  }
}
