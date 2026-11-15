import 'package:flutter/material.dart';

import '../navigation/app_routes.dart';

class WargaPage extends StatelessWidget {
  const WargaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Card(
          child: Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                CircleAvatar(
                  radius: 40,
                  child: Icon(
                    Icons.person,
                    size: 45,
                  ),
                ),

                SizedBox(height: 12),

                Text(
                  'Aziz',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                SizedBox(height: 5),

                Text('Warga Kota Nusantara'),

                SizedBox(height: 5),

                Text('NIM: 0007'),
              ],
            ),
          ),
        ),

        const SizedBox(height: 20),

        const Text(
          'Aktivitas Warga',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        Card(
          child: ListTile(
            leading: const Icon(
              Icons.history,
              color: Colors.teal,
            ),
            title: const Text('Riwayat Laporan'),
            subtitle: const Text(
              'Lihat riwayat laporan warga.',
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
            ),
            onTap: () {
              Navigator.pushNamed(
                context,
                AppRoutes.riwayatLaporan,
              );
            },
          ),
        ),
      ],
    );
  }
}