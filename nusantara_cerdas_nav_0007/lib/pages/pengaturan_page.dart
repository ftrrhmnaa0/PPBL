import 'package:flutter/material.dart';

class PengaturanPage extends StatelessWidget {
  const PengaturanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pengaturan Kota'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: const Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Text(
            'Halaman Pengaturan Kota Nusantara',
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 18),
          ),
        ),
      ),
    );
  }
}