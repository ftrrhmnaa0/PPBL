
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/favorit_cubit.dart';
import '../cubit/pengajuan_cubit.dart';
import '../cubit/theme_cubit.dart';

class WargaPage extends StatelessWidget {
  const WargaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Warga'),
        actions: [
          BlocBuilder<ThemeCubit, ThemeMode>(
            builder: (context, mode) {
              return Switch(
                value: mode == ThemeMode.dark,
                onChanged: (_) {
                  context.read<ThemeCubit>().toggle();
                },
              );
            },
          ),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Text(
            'Layanan Favorit',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          const SizedBox(height: 8),
          BlocBuilder<FavoritCubit, Set<String>>(
            builder: (context, daftarFavorit) {
              if (daftarFavorit.isEmpty) {
                return const Text(
                  'Belum ada layanan favorit.',
                );
              }

              return Column(
                children: daftarFavorit.map((nama) {
                  return ListTile(
                    leading: const Icon(Icons.star),
                    title: Text(nama),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () {
                        context
                            .read<FavoritCubit>()
                            .batalTandai(nama);
                      },
                    ),
                  );
                }).toList(),
              );
            },
          ),
          const Divider(),
          Text(
            'Keranjang Pengajuan',
            style: Theme.of(context).textTheme.titleLarge,
          ),
          BlocBuilder<PengajuanCubit, List<String>>(
            builder: (context, daftarPengajuan) {
              if (daftarPengajuan.isEmpty) {
                return const Text(
                  'Belum ada pengajuan layanan.',
                );
              }

              return Column(
                children: daftarPengajuan.map((nama) {
                  return ListTile(
                    title: Text(nama),
                    trailing: IconButton(
                      icon: const Icon(Icons.delete_outline),
                      onPressed: () {
                        context
                            .read<PengajuanCubit>()
                            .hapus(nama);
                      },
                    ),
                  );
                }).toList(),
              );
            },
          ),
          const SizedBox(height: 12),
          ElevatedButton(
            onPressed: () {
              context.read<PengajuanCubit>().kosongkan();
            },
            child: const Text('Kosongkan Pengajuan'),
          ),
        ],
      ),
    );
  }
}
