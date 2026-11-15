import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Selamat Datang di Peukan Rumoh',
          style: TextStyle(
            fontSize: 24,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 12),
        const Text(
          'Belanja kebutuhan sehari-hari dari pasar tradisional '
          'menjadi lebih mudah melalui Peukan Rumoh.',
          style: TextStyle(fontSize: 16),
        ),
        const SizedBox(height: 20),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Icon(
                  Icons.storefront,
                  size: 64,
                  color: Colors.green,
                ),
                const SizedBox(height: 12),
                const Text(
                  'Belanja Produk Pasar Tradisional',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 8),
                const Text(
                  'Temukan berbagai kebutuhan dari pedagang '
                  'pasar melalui satu aplikasi.',
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}