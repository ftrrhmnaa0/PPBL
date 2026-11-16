
import 'package:flutter/material.dart';
import '../widgets/kartu_layanan.dart';
import 'detail_layanan_page.dart';

class LayananPage extends StatelessWidget {
  const LayananPage({super.key});

  static const daftarLayanan = [
    {
      'nama': 'Perizinan Usaha',
      'deskripsi': 'Pengajuan izin usaha masyarakat',
    },
    {
      'nama': 'Layanan Kesehatan',
      'deskripsi': 'Informasi dan layanan kesehatan warga',
    },
    {
      'nama': 'Transportasi Umum',
      'deskripsi': 'Informasi layanan transportasi umum',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Layanan'),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Perizinan'),
              Tab(text: 'Kesehatan'),
              Tab(text: 'Transportasi'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _daftar(context, [daftarLayanan[0]]),
            _daftar(context, [daftarLayanan[1]]),
            _daftar(context, [daftarLayanan[2]]),
          ],
        ),
      ),
    );
  }

  Widget _daftar(
    BuildContext context,
    List<Map<String, String>> layanan,
  ) {
    return ListView(
      padding: const EdgeInsets.all(12),
      children: layanan.map((item) {
        return KartuLayanan(
          nama: item['nama']!,
          deskripsi: item['deskripsi']!,
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (_) => DetailLayananPage(
                  namaLayanan: item['nama']!,
                ),
              ),
            );
          },
        );
      }).toList(),
    );
  }
}
