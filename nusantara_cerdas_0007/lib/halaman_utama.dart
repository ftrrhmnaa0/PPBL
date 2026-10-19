import 'package:flutter/material.dart';
import 'kepala_kota.dart';
import 'kartu_pilar.dart';
import 'panel_laporan.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Nusantara Cerdas')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            KepalaKota(),
            SizedBox(height: 20),
            Text(
              'Dasbor Pilar Smart City',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 6),
            Text('Ringkasan enam pilar pembangunan Kota Nusantara.'),
            SizedBox(height: 12),
            KartuPilar(
              nama: 'Smart Governance',
              ikon: Icons.account_balance,
              deskripsi: 'Layanan pemerintahan digital yang transparan dan mudah diakses.',
            ),
            KartuPilar(
              nama: 'Smart Economy',
              ikon: Icons.trending_up,
              deskripsi: 'Mendukung UMKM dan pertumbuhan ekonomi lokal.',
            ),
            KartuPilar(
              nama: 'Smart Living',
              ikon: Icons.health_and_safety,
              deskripsi: 'Mendukung kesehatan, keamanan, dan kualitas hidup warga.',
            ),
            KartuPilar(
              nama: 'Smart Mobility',
              ikon: Icons.directions_bus,
              deskripsi: 'Menyediakan informasi transportasi dan mobilitas kota.',
            ),
            KartuPilar(
              nama: 'Smart Environment',
              ikon: Icons.eco,
              deskripsi: 'Mendukung kebersihan dan pengelolaan lingkungan kota.',
            ),
            KartuPilar(
              nama: 'Smart People',
              ikon: Icons.groups,
              deskripsi: 'Meningkatkan literasi digital dan partisipasi masyarakat.',
            ),
            SizedBox(height: 20),
            Text(
              'Pemantauan Pelayanan',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 12),
            PanelLaporanWarga(),
            SizedBox(height: 16),
            Center(
              child: Text(
                'Nusantara Cerdas • Informasi untuk kota yang lebih baik',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 12, color: Colors.black54),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
