
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cart_cubit.dart';
import '../models/produk.dart';
import '../widgets/product_card.dart';

class JelajahiPage extends StatefulWidget {
  const JelajahiPage({super.key});

  @override
  State<JelajahiPage> createState() => _JelajahiPageState();
}

class _JelajahiPageState extends State<JelajahiPage> {
  final TextEditingController pencarianController =
      TextEditingController();

  String kataKunci = '';
  bool tampilkanKategori = false;

  final List<Produk> daftarProduk = const [
    Produk(
      id: 'p1',
      nama: 'Beras',
      harga: 15000,
      ikon: '🌾',
    ),
    Produk(
      id: 'p2',
      nama: 'Minyak Goreng',
      harga: 18000,
      ikon: '🛢️',
    ),
    Produk(
      id: 'p3',
      nama: 'Gula Pasir',
      harga: 14000,
      ikon: '🍚',
    ),
  ];

  @override
  void dispose() {
    pencarianController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final hasilPencarian = daftarProduk.where((produk) {
      return produk.nama
          .toLowerCase()
          .contains(kataKunci.toLowerCase());
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jelajahi Produk'),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: pencarianController,
              decoration: const InputDecoration(
                labelText: 'Cari produk',
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(),
              ),
              onChanged: (value) {
                setState(() {
                  kataKunci = value;
                });
              },
            ),
          ),
          SwitchListTile(
            title: const Text('Tampilkan kategori'),
            value: tampilkanKategori,
            onChanged: (value) {
              setState(() {
                tampilkanKategori = value;
              });
            },
          ),
          if (tampilkanKategori)
            const Padding(
              padding: EdgeInsets.all(12),
              child: Text(
                'Kategori: Bahan Pokok',
              ),
            ),
          Expanded(
            child: hasilPencarian.isEmpty
                ? const Center(
                    child: Text('Produk tidak ditemukan'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.all(12),
                    itemCount: hasilPencarian.length,
                    itemBuilder: (context, index) {
                      final produk = hasilPencarian[index];

                      return ProductCard(
                        produk: produk,
                        onTambah: () {
                          context
                              .read<CartCubit>()
                              .tambah(produk);

                          ScaffoldMessenger.of(context)
                              .showSnackBar(
                            SnackBar(
                              content: Text(
                                '${produk.nama} ditambahkan',
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
