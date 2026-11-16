import 'package:flutter/material.dart';

class RouteTidakDikenalPage extends StatelessWidget {
  const RouteTidakDikenalPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Halaman Tidak Ditemukan'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.error_outline,
                size: 80,
                color: Colors.red,
              ),

              const SizedBox(height: 16),

              const Text(
                'Route Tidak Dikenal',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Halaman yang ingin dibuka tidak tersedia.',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 20),

              ElevatedButton(
                onPressed: () {
                  Navigator.popUntil(
                    context,
                    (route) => route.isFirst,
                  );
                },
                child: const Text('Kembali ke Beranda'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}