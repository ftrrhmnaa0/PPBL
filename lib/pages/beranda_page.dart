import 'package:flutter/material.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Container(
          width: double.infinity,
          padding: const EdgeInsets.all(22),
          decoration: BoxDecoration(
            color: Colors.teal,
            borderRadius: BorderRadius.circular(16),
          ),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.storefront,
                size: 55,
                color: Colors.white,
              ),

              SizedBox(height: 15),

              Text(
                'Peukan Rumoh',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),

              SizedBox(height: 8),

              Text(
                'Belanja kebutuhan pasar jadi lebih mudah.',
                style: TextStyle(
                  fontSize: 15,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),

        const SizedBox(height: 24),

        const Text(
          'Selamat Datang!',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          'Peukan Rumoh menghubungkan pembeli dengan '
          'pedagang pasar tradisional secara online. '
          'Temukan berbagai kebutuhan pangan dan dapur '
          'melalui satu aplikasi.',
          style: TextStyle(
            fontSize: 15,
            height: 1.5,
          ),
        ),

        const SizedBox(height: 24),

        const Text(
          'Kategori Produk',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 12),

        const Row(
          children: [
            Expanded(
              child: KategoriCard(
                ikon: Icons.eco,
                nama: 'Sayur & Buah',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: KategoriCard(
                ikon: Icons.set_meal,
                nama: 'Daging & Ikan',
              ),
            ),
            SizedBox(width: 10),
            Expanded(
              child: KategoriCard(
                ikon: Icons.rice_bowl,
                nama: 'Sembako',
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        const Text(
          'Belanja dari Pasar Tradisional',
          style: TextStyle(
            fontSize: 19,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 8),

        const Text(
          'Dapatkan informasi produk dan harga dari '
          'pedagang pasar dengan lebih praktis.',
          style: TextStyle(
            height: 1.5,
          ),
        ),
      ],
    );
  }
}

class KategoriCard extends StatelessWidget {
  final IconData ikon;
  final String nama;

  const KategoriCard({
    super.key,
    required this.ikon,
    required this.nama,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 16,
          horizontal: 5,
        ),
        child: Column(
          children: [
            Icon(
              ikon,
              color: Colors.teal,
              size: 30,
            ),

            const SizedBox(height: 8),

            Text(
              nama,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}