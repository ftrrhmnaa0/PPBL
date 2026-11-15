import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/favorit_model.dart';
import '../navigation/app_routes.dart';

class LayananPage extends StatelessWidget {
  const LayananPage({super.key});

  static const List<Map<String, String>> layananPerizinan = [
    {
      'nama': 'Izin Mendirikan Bangunan',
      'kategori': 'Perizinan',
      'deskripsi': 'Layanan pengajuan izin bangunan.',
    },
    {
      'nama': 'Izin Usaha',
      'kategori': 'Perizinan',
      'deskripsi': 'Layanan pengajuan izin usaha.',
    },
  ];

  static const List<Map<String, String>> layananKesehatan = [
    {
      'nama': 'Pendaftaran Puskesmas',
      'kategori': 'Kesehatan',
      'deskripsi': 'Layanan pendaftaran ke puskesmas.',
    },
    {
      'nama': 'Informasi Rumah Sakit',
      'kategori': 'Kesehatan',
      'deskripsi': 'Informasi layanan rumah sakit.',
    },
  ];

  static const List<Map<String, String>> layananTransportasi = [
    {
      'nama': 'Informasi Transportasi Umum',
      'kategori': 'Transportasi',
      'deskripsi': 'Informasi transportasi umum.',
    },
    {
      'nama': 'Pengaduan Jalan',
      'kategori': 'Transportasi',
      'deskripsi': 'Layanan pengaduan kondisi jalan.',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Column(
        children: [
          const TabBar(
            tabs: [
              Tab(text: 'Perizinan'),
              Tab(text: 'Kesehatan'),
              Tab(text: 'Transportasi'),
            ],
          ),
          Expanded(
            child: TabBarView(
              children: [
                _daftarLayanan(context, layananPerizinan),
                _daftarLayanan(context, layananKesehatan),
                _daftarLayanan(context, layananTransportasi),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _daftarLayanan(
    BuildContext context,
    List<Map<String, String>> daftar,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: daftar.length,
      itemBuilder: (context, index) {
        final layanan = daftar[index];

        return KartuLayanan(layanan: layanan);
      },
    );
  }
}

class KartuLayanan extends StatelessWidget {
  final Map<String, String> layanan;

  const KartuLayanan({
    super.key,
    required this.layanan,
  });

  @override
  Widget build(BuildContext context) {
    final nama = layanan['nama']!;

    final favorit = context.watch<FavoritModel>();
    final sudahFavorit = favorit.isFavorit(nama);

    return Card(
      child: ListTile(
        leading: const Icon(
          Icons.miscellaneous_services,
          color: Colors.teal,
        ),
        title: Text(nama),
        subtitle: Text(layanan['deskripsi']!),
        trailing: IconButton(
          icon: Icon(
            sudahFavorit ? Icons.star : Icons.star_border,
            color: sudahFavorit ? Colors.amber : Colors.grey,
          ),
          onPressed: () {
            final model = context.read<FavoritModel>();

            if (sudahFavorit) {
              model.batalTandai(nama);
            } else {
              model.tandai(nama);
            }
          },
        ),
        onTap: () async {
          final hasil = await Navigator.pushNamed(
            context,
            AppRoutes.detailLayanan,
            arguments: layanan,
          );

          if (!context.mounted) return;

          if (hasil != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(hasil.toString()),
              ),
            );
          }
        },
      ),
    );
  }
}