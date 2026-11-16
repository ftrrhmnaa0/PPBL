import 'package:flutter/material.dart';

import '../model/pengajuan_model.dart';

class DetailPengajuanPage extends StatelessWidget {
  final Pengajuan pengajuan;

  const DetailPengajuanPage({
    super.key,
    required this.pengajuan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pengajuan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Nama: ${pengajuan.nama}'),
                const SizedBox(height: 8),
                Text('Email: ${pengajuan.email}'),
                const SizedBox(height: 8),
                Text('Bidang: ${pengajuan.bidang}'),
                const SizedBox(height: 8),
                Text('Sesi: ${pengajuan.sesi}'),
                const SizedBox(height: 8),
                Text(
                  'Status: ${pengajuan.selesai ? "Selesai" : "Dalam proses"}',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}