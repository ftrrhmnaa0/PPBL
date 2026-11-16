
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/cart_cubit.dart';
import '../models/produk.dart';

class JelajahiPage extends StatefulWidget {
  const JelajahiPage({super.key});

  @override
  State<JelajahiPage> createState() =>
      _JelajahiPageState();
}

class _JelajahiPageState extends State<JelajahiPage> {
  bool tampilkanKategori = true;

  final TextEditingController pencarianController =
      TextEditingController();

  String kataKunci = '';

  final List<Produk> daftarProduk = const [
    Produk(
      nama: 'Beras',
      harga: 15000,
      ikon: '🌾',
    ),
    Produk(
      nama: 'Minyak Goreng',
      harga: 18000,
      ikon: '🛢️',
    ),
    Produk(
      nama: 'Gula Pasir',
      harga: 14000,
      ikon: '🍚',
    ),
  ];

  String rupiah(int nilai) {
    return 'Rp${nilai.toString().replaceAllMapped(
      RegExp(r'(\d)(?=(\d{3})+(?!\d))'),
      (match) => '${match[1]}.',
    )}';
  }

  @override
  void dispose() {
    pencarianController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final produkDitampilkan = daftarProduk.where((produk) {
      return produk.nama.toLowerCase().contains(
            kataKunci.toLowerCase(),
          );
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jelajahi Produk'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 16),
            child: Center(
              child: BlocBuilder<CartCubit, List<ItemKeranjang>>(
                builder: (context, items) {
                  final totalItem =
                      context.read<CartCubit>().totalItem;

                  return Text(
                    'Keranjang: $totalItem',
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16),
            child: TextField(
              controller: pencarianController,
              decoration: InputDecoration(
                hintText: 'Cari kebutuhan sehari-hari...',
                prefixIcon: const Icon(Icons.search),
                suffixIcon: IconButton(
                  icon: const Icon(Icons.clear),
                  onPressed: () {
                    pencarianController.clear();

                    setState(() {
                      kataKunci = '';
                    });
                  },
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onChanged: (nilai) {
                setState(() {
                  kataKunci = nilai;
                });
              },
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 16,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Kategori Produk',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                TextButton(
                  onPressed: () {
                    setState(() {
                      tampilkanKategori = !tampilkanKategori;
                    });
                  },
                  child: Text(
                    tampilkanKategori ? 'Sembunyikan' : 'Tampilkan',
                  ),
                ),
              ],
            ),
          ),

          if (tampilkanKategori)
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              child: Wrap(
                spacing: 8,
                children: const [
                  Chip(label: Text('Sembako')),
                  Chip(label: Text('Minuman')),
                  Chip(label: Text('Bumbu Dapur')),
                ],
              ),
            ),

          const Padding(
            padding: EdgeInsets.all(16),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Produk Pilihan',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),

          Expanded(
            child: produkDitampilkan.isEmpty
                ? const Center(
                    child: Text('Produk tidak ditemukan.'),
                  )
                : ListView.builder(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    itemCount: produkDitampilkan.length,
                    itemBuilder: (context, index) {
                      final produk = produkDitampilkan[index];

                      return Card(
                        margin: const EdgeInsets.only(
                          bottom: 12,
                        ),
                        child: ListTile(
                          leading: Text(
                            produk.ikon,
                            style: const TextStyle(
                              fontSize: 32,
                            ),
                          ),

                          title: Text(
                            produk.nama,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          subtitle: Text(
                            rupiah(produk.harga),
                          ),

                          trailing: FilledButton(
                            onPressed: () {
                              context
                                  .read<CartCubit>()
                                  .tambah(produk);

                              ScaffoldMessenger.of(context)
                                  .showSnackBar(
                                SnackBar(
                                  content: Text(
                                    '${produk.nama} ditambahkan ke keranjang',
                                  ),
                                  duration: const Duration(
                                    seconds: 1,
                                  ),
                                ),
                              );
                            },
                            child: const Text('Tambah'),
                          ),
                        ),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}
