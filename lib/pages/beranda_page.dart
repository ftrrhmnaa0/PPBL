import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selamat Datang',
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          const Text(
            'Nusantara Cerdas Mobile',
            style: TextStyle(fontSize: 18),
          ),
          const SizedBox(height: 16),
          const Text(
            'Layanan digital untuk memudahkan warga '
            'dalam mengakses pelayanan pemerintah.',
          ),
          const SizedBox(height: 24),
          Card(
            child: ListTile(
              leading: const Icon(
                Icons.location_city,
                color: Colors.teal,
                size: 36,
              ),
              title: const Text('Layanan Warga'),
              subtitle: const Text(
                'Temukan dan ajukan layanan pemerintah.',
              ),
            ),
          ),
        ],
      ),
    );
  }
}