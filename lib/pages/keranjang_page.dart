
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cart_cubit.dart';
import '../models/produk.dart';

class KeranjangPage extends StatelessWidget {
  const KeranjangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: BlocBuilder<CartCubit, List<ItemKeranjang>>(
          builder: (context, daftarItem) {
            final totalItem = daftarItem.fold(
              0,
              (total, item) => total + item.jumlah,
            );

            return Text('Keranjang ($totalItem)');
          },
        ),
      ),
      body: BlocBuilder<CartCubit, List<ItemKeranjang>>(
        builder: (context, daftarItem) {
          final cubit = context.read<CartCubit>();

          if (daftarItem.isEmpty) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 72,
                  ),
                  SizedBox(height: 12),
                  Text('Keranjang masih kosong'),
                ],
              ),
            );
          }

          return Column(
            children: [
              Expanded(
                child: ListView.builder(
                  itemCount: daftarItem.length,
                  itemBuilder: (context, index) {
                    final item = daftarItem[index];

                    return ListTile(
                      leading: CircleAvatar(
                        child: Text(item.produk.ikon),
                      ),
                      title: Text(item.produk.nama),
                      subtitle: Text(
                        '${item.jumlah} x Rp${item.produk.harga}',
                      ),
                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              cubit.kurangi(item.produk);
                            },
                            icon: const Icon(
                              Icons.remove_circle_outline,
                            ),
                          ),
                          Text('${item.jumlah}'),
                          IconButton(
                            onPressed: () {
                              cubit.tambah(item.produk);
                            },
                            icon: const Icon(
                              Icons.add_circle_outline,
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    Text(
                      'Total Harga: Rp${cubit.totalHarga}',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge,
                    ),
                    const SizedBox(height: 12),
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: () {
                          cubit.kosongkan();
                        },
                        child: const Text(
                          'Kosongkan Keranjang',
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
