import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/keranjang_model.dart';

class JelajahiPage extends StatefulWidget {
  const JelajahiPage({super.key});

  @override
  State<JelajahiPage> createState() => _JelajahiPageState();
}

class _JelajahiPageState extends State<JelajahiPage> {
  String _kataKunci = '';

  static const List<Produk> daftarProduk = [
    Produk(
      nama: 'Beras',
      harga: 15000,
      ikon: '🌾',
    ),
    Produk(
      nama: 'Bayam',
      harga: 5000,
      ikon: '🥬',
    ),
    Produk(
      nama: 'Wortel',
      harga: 8000,
      ikon: '🥕',
    ),
    Produk(
      nama: 'Tomat',
      harga: 7000,
      ikon: '🍅',
    ),
    Produk(
      nama: 'Kentang',
      harga: 12000,
      ikon: '🥔',
    ),
    Produk(
      nama: 'Cabai',
      harga: 10000,
      ikon: '🌶️',
    ),
  ];

  String rupiah(int nilai) {
    return 'Rp${nilai.toString()}';
  }

  @override
  Widget build(BuildContext context) {
    final totalItem = context.watch<KeranjangModel>().totalItem;

    final produkDitampilkan = daftarProduk.where((produk) {
      return produk.nama
          .toLowerCase()
          .contains(_kataKunci.toLowerCase());
    }).toList();

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(16),
          child: TextField(
            decoration: const InputDecoration(
              labelText: 'Cari produk',
              prefixIcon: Icon(Icons.search),
              border: OutlineInputBorder(),
            ),
            onChanged: (nilai) {
              setState(() {
                _kataKunci = nilai;
              });
            },
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Jumlah barang di keranjang: $totalItem',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),

        const SizedBox(height: 8),

        Expanded(
          child: ListView.separated(
            padding: const EdgeInsets.all(16),
            itemCount: produkDitampilkan.length,
            separatorBuilder: (context, index) =>
                const SizedBox(height: 8),
            itemBuilder: (context, index) {
              final produk = produkDitampilkan[index];

              return Card(
                child: ListTile(
                  leading: Text(
                    produk.ikon,
                    style: const TextStyle(fontSize: 32),
                  ),
                  title: Text(produk.nama),
                  subtitle: Text(rupiah(produk.harga)),
                  trailing: FilledButton(
                    onPressed: () {
                      context
                          .read<KeranjangModel>()
                          .tambah(produk);

                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(
                            '${produk.nama} ditambahkan ke keranjang',
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
    );
  }
}