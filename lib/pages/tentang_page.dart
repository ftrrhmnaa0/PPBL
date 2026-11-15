import 'package:flutter/material.dart';

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Aplikasi'),
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
                Icons.location_city,
                size: 70,
                color: Colors.teal,
              ),

              const SizedBox(height: 16),

              const Text(
                'Nusantara Cerdas Mobile',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                'Aplikasi layanan warga Kota Nusantara '
                'untuk mendukung pelayanan publik berbasis digital.',
                textAlign: TextAlign.center,
              ),

              const SizedBox(height: 25),

              ElevatedButton(
                onPressed: () {
                  Navigator.pushNamed(
                    context,
                    '/route-tidak-ada',
                  );
                },
                child: const Text(
                  'Uji Route Tidak Dikenal',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}