
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cart_cubit.dart';
import '../models/produk.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

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
        title: const Text('Peukan Rumoh'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Selamat Datang di Peukan Rumoh!',
              style: TextStyle(
                fontSize: 23,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            const Text(
              'Belanja kebutuhan sehari-hari dari pasar '
              'tradisional dengan lebih mudah.',
            ),

            const SizedBox(height: 24),

            const Text(
              'Ringkasan Keranjang',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            BlocBuilder<CartCubit, List<ItemKeranjang>>(
              builder: (context, items) {
                final cartCubit = context.read<CartCubit>();

                return Card(
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment:
                          CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            const Icon(
                              Icons.shopping_cart,
                              size: 35,
                              color: Colors.teal,
                            ),

                            const SizedBox(width: 12),

                            const Text(
                              'Produk dalam Keranjang',
                              style: TextStyle(
                                fontSize: 16,
                              ),
                            ),
                          ],
                        ),

                        const SizedBox(height: 20),

                        Text(
                          '${cartCubit.totalItem} Item',
                          style: const TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                        const SizedBox(height: 8),

                        Text(
                          'Total Belanja: ${rupiah(cartCubit.totalHarga)}',
                          style: const TextStyle(
                            fontSize: 16,
                            color: Colors.teal,
                          ),
                        ),

                        const SizedBox(height: 16),

                        if (items.isEmpty)
                          const Text(
                            'Belum ada produk yang ditambahkan.',
                          )
                        else
                          const Text(
                            'Produk siap diperiksa di keranjang.',
                          ),
                      ],
                    ),
                  ),
                );
              },
            ),

            const SizedBox(height: 24),

            const Text(
              'Keunggulan Peukan Rumoh',
              style: TextStyle(
                fontSize: 19,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const Card(
              child: ListTile(
                leading: Icon(
                  Icons.store,
                  color: Colors.teal,
                ),
                title: Text('Mendukung Pasar Tradisional'),
                subtitle: Text(
                  'Membantu pedagang memperluas jangkauan penjualan.',
                ),
              ),
            ),

            const Card(
              child: ListTile(
                leading: Icon(
                  Icons.shopping_bag,
                  color: Colors.teal,
                ),
                title: Text('Belanja Lebih Praktis'),
                subtitle: Text(
                  'Memudahkan pembeli menemukan kebutuhan sehari-hari.',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
