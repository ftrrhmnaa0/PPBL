import 'package:flutter/material.dart';

class DetailLayananPage extends StatelessWidget {
  final Map<String, String> layanan;

  const DetailLayananPage({
    super.key,
    required this.layanan,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rincian Layanan'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Icon(
              Icons.description,
              size: 55,
              color: Colors.teal,
            ),

            const SizedBox(height: 20),

            Text(
              layanan['nama']!,
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 20),

            const Text(
              'Dinas Penanggung Jawab',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(layanan['dinas']!),

            const SizedBox(height: 16),

            const Text(
              'Jam Operasional',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(layanan['jam']!),

            const SizedBox(height: 16),

            const Text(
              'Keterangan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(layanan['keterangan']!),

            const Spacer(),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(
                    context,
                    'Permohonan ${layanan['nama']} telah diajukan.',
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.teal,
                  foregroundColor: Colors.white,
                  padding: const EdgeInsets.all(15),
                ),
                child: const Text('Ajukan Permohonan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}