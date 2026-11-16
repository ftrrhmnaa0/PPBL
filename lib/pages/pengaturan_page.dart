
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../state/prediksi_cubit.dart';
import '../state/theme_cubit.dart';

class PengaturanPage extends StatelessWidget {
  const PengaturanPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Pengaturan Aplikasi',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 12),
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, mode) {
              return SwitchListTile(
                title: const Text('Mode Gelap'),
                subtitle: const Text(
                  'Aktifkan atau nonaktifkan tema gelap',
                ),
                value: mode == ThemeMode.dark,
                onChanged: (value) {
                  context.read<ThemeCubit>().ubahTema(value);
                },
              );
            },
          ),
          const Divider(),
          const SizedBox(height: 12),
          ElevatedButton.icon(
            onPressed: () {
              context
                  .read<PrediksiCubit>()
                  .buatDataSimulasi();

              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text('10 data simulasi berhasil dimuat'),
                ),
              );
            },
            icon: const Icon(Icons.download),
            label: const Text('Muat Data Simulasi'),
          ),
          const SizedBox(height: 12),
          OutlinedButton.icon(
            onPressed: () async {
              final konfirmasi = await showDialog<bool>(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: const Text('Hapus Semua Data'),
                    content: const Text(
                      'Apakah kamu yakin ingin menghapus '
                      'seluruh riwayat prediksi?',
                    ),
                    actions: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context, false);
                        },
                        child: const Text('Batal'),
                      ),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context, true);
                        },
                        child: const Text('Hapus'),
                      ),
                    ],
                  );
                },
              );

              if (konfirmasi == true && context.mounted) {
                context.read<PrediksiCubit>().hapusSemua();

                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Semua data berhasil dihapus'),
                  ),
                );
              }
            },
            icon: const Icon(Icons.delete_outline),
            label: const Text('Hapus Semua Data'),
          ),
        ],
      ),
    );
  }
}
