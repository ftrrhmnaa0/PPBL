
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/pengajuan_cubit.dart';

class DetailLayananPage extends StatefulWidget {
  final Map<String, String> layanan;

  const DetailLayananPage({
    super.key,
    required this.layanan,
  });

  @override
  State<DetailLayananPage> createState() =>
      _DetailLayananPageState();
}

class _DetailLayananPageState
    extends State<DetailLayananPage> {
  bool sedangMengirim = false;

  Future<void> ajukanPermohonan(
    String namaLayanan,
  ) async {
    setState(() {
      sedangMengirim = true;
    });

    await Future.delayed(
      const Duration(seconds: 2),
    );

    if (!mounted) return;

    context
        .read<PengajuanCubit>()
        .tambah(namaLayanan);

    setState(() {
      sedangMengirim = false;
    });

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    final layanan = widget.layanan;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Layanan'),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
      ),

      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              layanan['nama'] ?? '',
              style: const TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            const Text(
              'Instansi / Dinas',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(layanan['dinas'] ?? '-'),

            const SizedBox(height: 16),

            const Text(
              'Jam Operasional',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(layanan['jam'] ?? '-'),

            const SizedBox(height: 16),

            const Text(
              'Keterangan',
              style: TextStyle(
                fontWeight: FontWeight.bold,
              ),
            ),

            Text(layanan['keterangan'] ?? '-'),

            const SizedBox(height: 24),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: sedangMengirim
                    ? null
                    : () {
                        ajukanPermohonan(
                          layanan['nama'] ?? '',
                        );
                      },

                child: sedangMengirim
                    ? const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          SizedBox(
                            width: 18,
                            height: 18,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                            ),
                          ),
                          SizedBox(width: 10),
                          Text('Sedang mengirim...'),
                        ],
                      )
                    : const Text('Ajukan Permohonan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
