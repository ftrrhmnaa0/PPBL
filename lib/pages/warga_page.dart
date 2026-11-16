import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../model/pengajuan_model.dart';
import '../navigation/app_routes.dart';

class WargaPage extends StatelessWidget {
  const WargaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PengajuanModel>();

    final bidangLayanan = [
      'Perizinan',
      'Kesehatan',
      'Transportasi',
    ];

    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(
            context,
            AppRoutes.formulir,
            arguments: 'Perizinan',
          );
        },
        child: const Icon(Icons.add),
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          const Text(
            'Layanan Warga',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 12),

          ...bidangLayanan.map((bidang) {
            return Card(
              child: ListTile(
                leading: const Icon(Icons.home_work),
                title: Text('Layanan $bidang'),
                subtitle: const Text('Ajukan layanan warga'),
                trailing: const Icon(Icons.arrow_forward_ios),
                onTap: () {
                  Navigator.pushNamed(
                    context,
                    AppRoutes.formulir,
                    arguments: bidang,
                  );
                },
              ),
            );
          }),

          const SizedBox(height: 20),

          const Text(
            'Riwayat Pengajuan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          if (model.daftar.isEmpty)
            const Padding(
              padding: EdgeInsets.all(16),
              child: Text('Belum ada pengajuan.'),
            ),

          ...model.daftar.map((pengajuan) {
            return GestureDetector(
              onTap: () {
                Navigator.pushNamed(
                  context,
                  AppRoutes.detail,
                  arguments: pengajuan,
                );
              },
              onLongPress: () {
                context
                    .read<PengajuanModel>()
                    .tandaiSelesai(pengajuan);

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text(
                      'Pengajuan ditandai selesai ditindaklanjuti',
                    ),
                  ),
                );
              },
              child: Card(
                child: ListTile(
                  leading: const Icon(Icons.description),
                  title: Text(pengajuan.nama),
                  subtitle: Text(
                    '${pengajuan.bidang} - Sesi ${pengajuan.sesi}',
                  ),
                  trailing: Icon(
                    pengajuan.selesai
                        ? Icons.check_circle
                        : Icons.pending,
                    color: pengajuan.selesai
                        ? Colors.green
                        : Colors.orange,
                  ),
                ),
              ),
            );
          }),
        ],
      ),
    );
  }
}