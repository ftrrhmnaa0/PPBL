import 'package:flutter/material.dart';

class DetailProdukPage extends StatelessWidget {
  final Map<String, String> produk;

  const DetailProdukPage({
    super.key,
    required this.produk,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Produk'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: double.infinity,
              height: 180,
              decoration: BoxDecoration(
                color: const Color(0xFFE0F2F1),
                borderRadius: BorderRadius.circular(15),
              ),
              child: const Icon(
                Icons.shopping_basket,
                size: 80,
                color: Colors.teal,
              ),
            ),

            const SizedBox(height: 20),

            Text(
              produk['nama']!,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 8),

            Text(
              produk['harga']!,
              style: const TextStyle(
                fontSize: 20,
                color: Colors.teal,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Informasi Pedagang',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(produk['pedagang']!),

            const SizedBox(height: 15),

            const Text(
              'Kategori',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(produk['kategori']!),

            const SizedBox(height: 15),

            const Text(
              'Deskripsi Produk',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(produk['deskripsi']!),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    '${produk['nama']} berhasil ditambahkan ke keranjang.',
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text('Tambah ke Keranjang'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}