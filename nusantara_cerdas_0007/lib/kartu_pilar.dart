import 'package:flutter/material.dart';

class KartuPilar extends StatelessWidget {
  const KartuPilar({
    super.key,
    required this.nama,
    required this.ikon,
    required this.deskripsi,
  });

  final String nama;
  final IconData ikon;
  final String deskripsi;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(ikon, size: 30, color: Theme.of(context).primaryColor),
            const SizedBox(width: 12),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    nama,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 6),
                  Text(deskripsi),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
