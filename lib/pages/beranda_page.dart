import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/pesanan_model.dart';
import '../model/chat_model.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final pesanan = context.watch<PesananModel>();
    final chat = context.watch<ChatModel>();

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Selamat Datang di Peukan Rumoh',
            style: TextStyle(
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 12),

          const Text(
            'Belanja kebutuhan pasar tradisional dengan lebih mudah.',
          ),

          const SizedBox(height: 24),

          Card(
            child: ListTile(
              leading: const Icon(
                Icons.shopping_bag,
                color: Colors.green,
              ),
              title: const Text('Total Pesanan'),
              subtitle: Text(
                '${pesanan.totalPesanan} pesanan telah dibuat',
              ),
            ),
          ),

          Card(
            child: ListTile(
              leading: const Icon(
                Icons.chat,
                color: Colors.green,
              ),
              title: const Text('Total Pesan'),
              subtitle: Text(
                '${chat.totalPesan} pesan dalam percakapan',
              ),
            ),
          ),
        ],
      ),
    );
  }
}