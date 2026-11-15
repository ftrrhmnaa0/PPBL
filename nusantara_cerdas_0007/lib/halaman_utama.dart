import 'package:flutter/material.dart';

import 'kepala_kota.dart';
import 'kartu_pilar.dart';
import 'panel_laporan.dart';

class HalamanUtama extends StatelessWidget {
  const HalamanUtama({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nusantara Cerdas'),
        centerTitle: true,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const KepalaKota(),

            const SizedBox(height: 24),

            const Text(
              'Enam Pilar Smart City',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 12),

            const KartuPilar(
              namaPilar: 'Smart Governance',
              ikon: Icons.account_balance,
              deskripsi:
                  'Meningkatkan pelayanan publik melalui pemerintahan digital.',
            ),

            const KartuPilar(
              namaPilar: 'Smart Economy',
              ikon: Icons.trending_up,
              deskripsi:
                  'Mendorong pertumbuhan ekonomi melalui pemanfaatan teknologi.',
            ),

            const KartuPilar(
              namaPilar: 'Smart Living',
              ikon: Icons.health_and_safety,
              deskripsi:
                  'Meningkatkan kualitas hidup dan kesejahteraan masyarakat.',
            ),

            const KartuPilar(
              namaPilar: 'Smart Mobility',
              ikon: Icons.directions_bus,
              deskripsi:
                  'Mendukung transportasi yang efisien dan terintegrasi.',
            ),

            const KartuPilar(
              namaPilar: 'Smart Environment',
              ikon: Icons.eco,
              deskripsi:
                  'Mendukung lingkungan yang bersih dan berkelanjutan.',
            ),

            const KartuPilar(
              namaPilar: 'Smart People',
              ikon: Icons.people,
              deskripsi:
                  'Meningkatkan kemampuan masyarakat dalam memanfaatkan teknologi.',
            ),

            const SizedBox(height: 24),

            const PanelLaporanWarga(),
          ],
        ),
      ),
    );
  }
}