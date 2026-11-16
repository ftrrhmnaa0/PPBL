
import 'package:flutter/material.dart';

class StatCard extends StatelessWidget {
  final String judul;
  final int jumlah;
  final IconData ikon;
  final Color warna;

  const StatCard({
    super.key,
    required this.judul,
    required this.jumlah,
    required this.ikon,
    required this.warna,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              ikon,
              color: warna,
              size: 28,
            ),
            const SizedBox(height: 8),
            Text(
              '$jumlah',
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            Text(
              judul,
              textAlign: TextAlign.center,
              style: TextStyle(color: scheme.onSurface),
            ),
          ],
        ),
      ),
    );
  }
}
