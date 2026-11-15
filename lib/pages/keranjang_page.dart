import 'package:flutter/material.dart';

class KeranjangPage extends StatelessWidget {
  const KeranjangPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        const Text(
          'Keranjang Belanja',
          style: TextStyle(
            fontSize: 21,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 16),

        Card(
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.shopping_basket),
            ),
            title: const Text('Bayam'),
            subtitle: const Text('Rp5.000 • Bu Siti'),
            trailing: const Text('1 item'),
          ),
        ),

        Card(
          child: ListTile(
            leading: const CircleAvatar(
              child: Icon(Icons.shopping_basket),
            ),
            title: const Text('Beras'),
            subtitle: const Text('Rp15.000 • Bu Ani'),
            trailing: const Text('1 item'),
          ),
        ),

        const SizedBox(height: 20),

        const Card(
          child: Padding(
            padding: EdgeInsets.all(16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Total Contoh',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Rp20.000',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.teal,
                  ),
                ),
              ],
            ),
          ),
        ),

        const SizedBox(height: 16),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(
                  content: Text(
                    'Halaman checkout masih berupa kerangka desain.',
                  ),
                ),
              );
            },
            child: const Text('Lanjut ke Checkout'),
          ),
        ),
      ],
    );
  }
}