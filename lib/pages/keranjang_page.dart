
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cart_cubit.dart';
import '../models/produk.dart';

class KeranjangPage extends StatelessWidget {
  const KeranjangPage({super.key});

  String rupiah(int nilai) {
    return 'Rp${nilai.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    )}';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keranjang Belanja'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: BlocBuilder<CartCubit, List<ItemKeranjang>>(
        builder: (context, items) {
          if (items.isEmpty) {
            return const Center(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.shopping_cart_outlined,
                    size: 72,
                    color: Colors.grey,
                  ),
                  SizedBox(height: 12),
                  Text(
                    'Keranjang masih kosong',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 8),
                  Text(
                    'Silakan pilih produk di halaman Jelajahi.',
                  ),
                ],
              ),
            );
          }

          final cartCubit = context.read<CartCubit>();

          final totalHarga = cartCubit.totalHarga;

          return Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.all(16),
                  itemCount: items.length,
                  separatorBuilder: (context, index) {
                    return const Divider();
                  },
                  itemBuilder: (context, index) {
                    final item = items[index];

                    return ListTile(
                      leading: Text(
                        item.produk.ikon,
                        style: const TextStyle(
                          fontSize: 30,
                        ),
                      ),

                      title: Text(
                        item.produk.nama,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      subtitle: Text(
                        '${item.jumlah} x ${rupiah(item.produk.harga)}',
                      ),

                      trailing: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            onPressed: () {
                              context
                                  .read<CartCubit>()
                                  .kurangi(item.produk);
                            },
                            icon: const Icon(
                              Icons.remove_circle_outline,
                            ),
                          ),

                          Text(
                            '${item.jumlah}',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          IconButton(
                            onPressed: () {
                              context
                                  .read<CartCubit>()
                                  .tambah(item.produk);
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

              SafeArea(
                top: false,
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.stretch,
                    children: [
                      Text(
                        'Total Item: ${cartCubit.totalItem}',
                        style: const TextStyle(
                          fontSize: 16,
                        ),
                      ),

                      const SizedBox(height: 8),

                      Text(
                        'Total Harga: ${rupiah(totalHarga)}',
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                      const SizedBox(height: 12),

                      OutlinedButton.icon(
                        onPressed: () {
                          context
                              .read<CartCubit>()
                              .kosongkan();
                        },
                        icon: const Icon(
                          Icons.delete_outline,
                        ),
                        label: const Text(
                          'Kosongkan Keranjang',
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
