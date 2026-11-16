import 'package:flutter/material.dart';
import '../models/produk.dart';

class ProductCard extends StatelessWidget {
  final Produk produk;
  final VoidCallback onTambah;

  const ProductCard({
    super.key,
    required this.produk,
    required this.onTambah,
  });

  @override
  Widget build(BuildContext context) {
    final warna = Theme.of(context).colorScheme;

    return Card(
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: warna.primaryContainer,
          child: Text(produk.ikon),
        ),
        title: Text(
          produk.nama,
          style: Theme.of(context).textTheme.titleMedium,
        ),
        subtitle: Text(
          'Rp${produk.harga}',
          style: TextStyle(
            color: warna.primary,
            fontWeight: FontWeight.bold,
          ),
        ),
        trailing: IconButton(
          onPressed: onTambah,
          icon: Icon(
            Icons.add_shopping_cart,
            color: warna.primary,
          ),
        ),
      ),
    );
  }
}
