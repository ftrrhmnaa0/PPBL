import 'package:flutter/material.dart';

import 'halaman_utama.dart';

void main() {
  runApp(const AplikasiNusantara());
}

class AplikasiNusantara extends StatelessWidget {
  const AplikasiNusantara({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nusantara Cerdas',

      theme: ThemeData(
        primarySwatch: Colors.teal,
        primaryColor: Colors.teal,
        scaffoldBackgroundColor: const Color(0xFFF2F4F8),

        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
      ),

      home: const HalamanUtama(),
    );
  }
}