import 'package:flutter/material.dart';

class PesananPage extends StatelessWidget {
  const PesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Pesanan Saya',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 16),

        Card(
          child: ListTile(
            leading: const Icon(
              Icons.receipt_long,
              color: Colors.teal,
              size: 35,
            ),
            title: const Text('Pesanan #PR001'),
            subtitle: const Text(
              'Bayam dan Beras\nStatus: Menunggu Konfirmasi',
            ),
            isThreeLine: true,
          ),
        ),

        Card(
          child: ListTile(
            leading: const Icon(
              Icons.receipt_long,
              color: Colors.teal,
              size: 35,
            ),
            title: const Text('Pesanan #PR002'),
            subtitle: const Text(
              'Daging Ayam\nStatus: Pesanan Diproses',
            ),
            isThreeLine: true,
          ),
        ),
      ],
    );
  }
}