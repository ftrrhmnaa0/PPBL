import 'package:flutter/material.dart';

class PesananPage extends StatelessWidget {
  const PesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: const [
        Text(
          'Riwayat Pesanan',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
          ),
        ),
        SizedBox(height: 16),
        Card(
          child: ListTile(
            leading: Icon(Icons.receipt_long),
            title: Text('Belum ada pesanan'),
            subtitle: Text(
              'Pesanan yang dilakukan akan ditampilkan di sini.',
            ),
          ),
        ),
      ],
    );
  }
}