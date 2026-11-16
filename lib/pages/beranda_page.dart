
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cart_cubit.dart';
import '../cubit/theme_cubit.dart';
import '../models/produk.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Peukan Rumoh'),
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
      body: Center(
        child: BlocBuilder<CartCubit, List<ItemKeranjang>>(
          builder: (context, daftarItem) {
            final totalItem =
                context.read<CartCubit>().totalItem;
            final totalHarga =
                context.read<CartCubit>().totalHarga;

            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.storefront,
                  size: 72,
                ),
                const SizedBox(height: 16),
                Text(
                  'Selamat Datang di Peukan Rumoh',
                  style: Theme.of(context).textTheme.titleLarge,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                Text('Jumlah produk di keranjang: $totalItem'),
                Text('Total belanja: Rp$totalHarga'),
                const SizedBox(height: 16),
                const Text('Gunakan tombol di atas untuk mengganti tema.'),
              ],
            );
          },
        ),
      ),
    );
  }
}
