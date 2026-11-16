
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/favorit_cubit.dart';
import '../cubit/pengajuan_cubit.dart';

class WargaPage extends StatelessWidget {
  const WargaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Warga'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Layanan Favorit',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            BlocBuilder<FavoritCubit, Set<String>>(
              builder: (context, daftarFavorit) {
                if (daftarFavorit.isEmpty) {
                  return const Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: Text(
                          'Belum ada layanan favorit.',
                        ),
                      ),
                    ),
                  );
                }

                return Column(
                  children: daftarFavorit.map((namaLayanan) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: const Icon(
                          Icons.star,
                          color: Colors.amber,
                        ),

                        title: Text(namaLayanan),

                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            context
                                .read<FavoritCubit>()
                                .batalTandai(namaLayanan);
                          },
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),

            const SizedBox(height: 24),

            const Text(
              'Pengajuan Layanan',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            BlocBuilder<PengajuanCubit, List<String>>(
              builder: (context, daftarPengajuan) {
                if (daftarPengajuan.isEmpty) {
                  return const Card(
                    child: Padding(
                      padding: EdgeInsets.all(16),
                      child: Center(
                        child: Text(
                          'Belum ada layanan yang diajukan.',
                        ),
                      ),
                    ),
                  );
                }

                return Column(
                  children: daftarPengajuan.map((namaLayanan) {
                    return Card(
                      margin: const EdgeInsets.only(bottom: 8),
                      child: ListTile(
                        leading: const Icon(
                          Icons.description,
                          color: Colors.teal,
                        ),

                        title: Text(namaLayanan),

                        subtitle: const Text(
                          'Permohonan berhasil diajukan',
                        ),

                        trailing: IconButton(
                          icon: const Icon(
                            Icons.delete_outline,
                            color: Colors.red,
                          ),
                          onPressed: () {
                            context
                                .read<PengajuanCubit>()
                                .hapus(namaLayanan);
                          },
                        ),
                      ),
                    );
                  }).toList(),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
