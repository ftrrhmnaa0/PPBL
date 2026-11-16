
import 'package:flutter/material.dart';

import '../models/hasil_prediksi.dart';
import '../models/data_perawatan.dart';

class PrediksiCard extends StatelessWidget {
  final HasilPrediksi data;
  final VoidCallback onHapus;

  const PrediksiCard({
    super.key,
    required this.data,
    required this.onHapus,
  });

  @override
  Widget build(BuildContext context) {
    final scheme = Theme.of(context).colorScheme;

    return Card(
      margin: const EdgeInsets.symmetric(
        horizontal: 12,
        vertical: 6,
      ),
      child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    '${data.petak} - ${data.tanaman}',
                    style: Theme.of(context)
                        .textTheme.titleMedium,
                  ),
                ),
                Icon(
                  data.ikonStatus,
                  color: data.warnaStatus,
                ),
                const SizedBox(width: 4),
                Text(
                  data.status,
                  style: TextStyle(
                    color: data.warnaStatus,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                IconButton(
                  onPressed: onHapus,
                  icon: const Icon(Icons.delete_outline),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              'Kelembapan Tanah: '
              '${data.kelembapanTanah.toStringAsFixed(0)}%',
            ),
            const SizedBox(height: 6),
            LinearProgressIndicator(
              value: data.kelembapanTanah / 100,
              color: data.warnaStatus,
              backgroundColor: scheme.surfaceContainerHighest,
            ),
            const SizedBox(height: 10),
            Text(
              'Suhu Udara: ${data.suhuUdara} °C',
            ),
            Text(
              'Kelembapan Udara: '
              '${data.kelembapanUdara}%',
            ),
            const SizedBox(height: 8),
            Text(
              'Rekomendasi: ${data.rekomendasi}',
            ),
            const SizedBox(height: 6),
            Text(
              'Catatan Perawatan: '
              '${DataPerawatan.getCatatan(data.tanaman)}',
            ),
            const SizedBox(height: 8),
            Text(
              'Petugas: ${data.namaPetugas}',
            ),
            Text(
              'Waktu: ${data.waktu.toLocal()}',
              style: Theme.of(context).textTheme.bodySmall,
            ),
          ],
        ),
      ),
    );
  }
}
