import 'package:flutter/material.dart';

class TentangPage extends StatelessWidget {
  const TentangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Tentang Peukan Rumoh'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(
                Icons.storefront,
                size: 75,
                color: Colors.teal,
              ),

              const SizedBox(height: 16),

              const Text(
                'Peukan Rumoh',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Platform marketplace pasar tradisional '
                'yang menghubungkan pedagang dan pembeli '
                'secara online.',
                textAlign: TextAlign.center,
                style: TextStyle(
                  height: 1.5,
                ),
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