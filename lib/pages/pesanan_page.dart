import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/pesanan_model.dart';

class PesananPage extends StatelessWidget {
  const PesananPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PesananModel>();

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Daftar Pesanan Saya',
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        if (model.daftarPesanan.isEmpty)
          const Text('Belum ada pesanan.'),

        ...model.daftarPesanan.map((pesanan) {
          return Card(
            child: ListTile(
              leading: const Icon(
                Icons.shopping_bag,
                color: Colors.green,
              ),
              title: Text(pesanan.namaProduk),
              subtitle: Text(
                'Pembeli: ${pesanan.namaPembeli}\n'
                'Alamat: ${pesanan.alamat}\n'
                'Pengiriman: ${pesanan.metodePengiriman}',
              ),
              isThreeLine: true,
            ),
          );
        }),
      ],
    );
  }
}