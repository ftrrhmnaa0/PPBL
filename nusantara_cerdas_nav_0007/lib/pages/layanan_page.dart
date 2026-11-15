import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';

class LayananPage extends StatelessWidget {
  const LayananPage({super.key});

  final List<Map<String, String>> layananPerizinan = const [
    {
      'nama': 'Izin Usaha',
      'dinas': 'Dinas Penanaman Modal dan PTSP',
      'jam': 'Senin - Jumat, 08.00 - 15.00',
      'keterangan': 'Layanan pengajuan izin pendirian usaha.'
    },
    {
      'nama': 'Izin Mendirikan Bangunan',
      'dinas': 'Dinas Pekerjaan Umum',
      'jam': 'Senin - Jumat, 08.00 - 15.00',
      'keterangan': 'Layanan pengajuan izin pembangunan bangunan.'
    },
    {
      'nama': 'Surat Keterangan Domisili',
      'dinas': 'Dinas Kependudukan dan Pencatatan Sipil',
      'jam': 'Senin - Jumat, 08.00 - 14.00',
      'keterangan': 'Layanan penerbitan surat keterangan domisili.'
    },
  ];

  final List<Map<String, String>> layananKesehatan = const [
    {
      'nama': 'Pemeriksaan Kesehatan',
      'dinas': 'Dinas Kesehatan',
      'jam': 'Senin - Sabtu, 08.00 - 14.00',
      'keterangan': 'Layanan pemeriksaan kesehatan masyarakat.'
    },
    {
      'nama': 'Vaksinasi',
      'dinas': 'Dinas Kesehatan',
      'jam': 'Senin - Jumat, 08.00 - 13.00',
      'keterangan': 'Layanan pemberian vaksin bagi masyarakat.'
    },
    {
      'nama': 'Konsultasi Kesehatan',
      'dinas': 'Puskesmas Kota Nusantara',
      'jam': 'Senin - Jumat, 08.00 - 15.00',
      'keterangan': 'Layanan konsultasi kesehatan bagi warga.'
    },
  ];

  final List<Map<String, String>> layananTransportasi = const [
    {
      'nama': 'Kartu Transportasi',
      'dinas': 'Dinas Perhubungan',
      'jam': 'Senin - Jumat, 08.00 - 15.00',
      'keterangan': 'Layanan pendaftaran kartu transportasi umum.'
    },
    {
      'nama': 'Informasi Rute Angkutan',
      'dinas': 'Dinas Perhubungan',
      'jam': 'Setiap Hari, 08.00 - 17.00',
      'keterangan': 'Layanan informasi rute angkutan umum.'
    },
    {
      'nama': 'Pengaduan Transportasi',
      'dinas': 'Dinas Perhubungan',
      'jam': 'Setiap Hari, 08.00 - 20.00',
      'keterangan': 'Layanan pengaduan masalah transportasi.'
    },
  ];

  Future<void> bukaDetail(
    BuildContext context,
    Map<String, String> data,
  ) async {
    final hasil = await Navigator.pushNamed(
      context,
      AppRoutes.detailLayanan,
      arguments: data,
    );

    if (hasil != null && context.mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(hasil.toString()),
        ),
      );
    }
  }

  Widget daftarLayanan(
    BuildContext context,
    List<Map<String, String>> data,
  ) {
    return ListView.builder(
      padding: const EdgeInsets.all(12),
      itemCount: data.length,
      itemBuilder: (context, index) {
        final layanan = data[index];

        return Card(
          margin: const EdgeInsets.only(bottom: 10),
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.description),
            ),
            title: Text(
              layanan['nama']!,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),
            subtitle: Text(layanan['dinas']!),
            trailing: const Icon(Icons.arrow_forward_ios),
            onTap: () {
              bukaDetail(context, layanan);
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
                Tab(text: 'Perizinan'),
                Tab(text: 'Kesehatan'),
                Tab(text: 'Transportasi'),
              ],
            ),
          ),

          Expanded(
            child: TabBarView(
              children: [
                daftarLayanan(context, layananPerizinan),
                daftarLayanan(context, layananKesehatan),
                daftarLayanan(context, layananTransportasi),
              ],
            ),
          ),
        ],
      ),
    );
  }
}