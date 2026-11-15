import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';

class JelajahiPage extends StatelessWidget {
  const JelajahiPage({super.key});

  final List<Map<String, String>> produkSayur = const [
    {
      'nama': 'Bayam',
      'harga': 'Rp5.000',
      'pedagang': 'Bu Siti',
      'kategori': 'Sayur & Buah',
      'deskripsi': 'Bayam segar dari pedagang pasar tradisional.'
    },
    {
      'nama': 'Wortel',
      'harga': 'Rp8.000',
      'pedagang': 'Pak Ahmad',
      'kategori': 'Sayur & Buah',
      'deskripsi': 'Wortel segar untuk kebutuhan memasak.'
    },
    {
      'nama': 'Tomat',
      'harga': 'Rp7.000',
      'pedagang': 'Bu Rina',
      'kategori': 'Sayur & Buah',
      'deskripsi': 'Tomat segar yang cocok untuk berbagai masakan.'
    },
  ];

  final List<Map<String, String>> produkDaging = const [
    {
      'nama': 'Daging Ayam',
      'harga': 'Rp35.000',
      'pedagang': 'Pak Budi',
      'kategori': 'Daging & Ikan',
      'deskripsi': 'Daging ayam segar untuk kebutuhan keluarga.'
    },
    {
      'nama': 'Ikan Lele',
      'harga': 'Rp20.000',
      'pedagang': 'Bu Lina',
      'kategori': 'Daging & Ikan',
      'deskripsi': 'Ikan lele segar dari pedagang pasar.'
    },
    {
      'nama': 'Ikan Nila',
      'harga': 'Rp30.000',
      'pedagang': 'Pak Dedi',
      'kategori': 'Daging & Ikan',
      'deskripsi': 'Ikan nila segar untuk kebutuhan memasak.'
    },
  ];

  final List<Map<String, String>> produkSembako = const [
    {
      'nama': 'Beras',
      'harga': 'Rp15.000',
      'pedagang': 'Bu Ani',
      'kategori': 'Sembako',
      'deskripsi': 'Beras untuk kebutuhan konsumsi sehari-hari.'
    },
    {
      'nama': 'Minyak Goreng',
      'harga': 'Rp18.000',
      'pedagang': 'Pak Joko',
      'kategori': 'Sembako',
      'deskripsi': 'Minyak goreng untuk kebutuhan dapur.'
    },
    {
      'nama': 'Gula Pasir',
      'harga': 'Rp17.000',
      'pedagang': 'Bu Dewi',
      'kategori': 'Sembako',
      'deskripsi': 'Gula pasir untuk kebutuhan rumah tangga.'
    },
  ];

  Future<void> bukaDetail(
    BuildContext context,
    Map<String, String> produk,
  ) async {
    final hasil = await Navigator.pushNamed(
      context,
      AppRoutes.detailProduk,
      arguments: produk,
    );

    if (hasil != null && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(hasil.toString()),
        ),
      );
    }
  }

  Widget daftarProduk(
    BuildContext context,
    List<Map<String, String>> produk,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: produk.length,
      itemBuilder: (context, index) {
        final item = produk[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 12),
          child: ListTile(
            leading: const CircleAvatar(
              backgroundColor: Color(0xFFE0F2F1),
              child: Icon(
                Icons.shopping_basket,
                color: Colors.teal,
              ),
            ),

            title: Text(
              item['nama']!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            subtitle: Text(
              '${item['harga']} • ${item['pedagang']}',
            ),

            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),

            onTap: () {
              bukaDetail(context, item);
            },
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const Material(
            color: Colors.teal,
            child: TabBar(
              indicatorColor: Colors.white,
              labelColor: Colors.white,
              unselectedLabelColor: Colors.white70,
              tabs: [
                Tab(text: 'Sayur & Buah'),
                Tab(text: 'Daging & Ikan'),
                Tab(text: 'Sembako'),
              ],
            ),
          ),

          Expanded(
            child: TabBarView(
              children: [
                daftarProduk(context, produkSayur),
                daftarProduk(context, produkDaging),
                daftarProduk(context, produkSembako),
              ],
            ),
          ),
        ],
      ),
    );
  }
}