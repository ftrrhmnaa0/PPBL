
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/pengajuan_cubit.dart';

class DetailLayananPage extends StatefulWidget {
  final String namaLayanan;

  const DetailLayananPage({
    super.key,
    required this.namaLayanan,
  });

  @override
  State<DetailLayananPage> createState() =>
      _DetailLayananPageState();
}

class _DetailLayananPageState
    extends State<DetailLayananPage> {
  bool sedangMengirim = false;

  Future<void> ajukanPermohonan() async {
    setState(() {
      sedangMengirim = true;
    });

    await Future.delayed(const Duration(seconds: 2));

    if (!mounted) return;

    context.read<PengajuanCubit>().tambah(
      widget.namaLayanan,
    );

    setState(() {
      sedangMengirim = false;
    });

    Navigator.pop(context, true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Layanan'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              widget.namaLayanan,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            const Text(
              'Silakan ajukan permohonan layanan ini '
              'melalui tombol di bawah.',
            ),
            const Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed:
                    sedangMengirim ? null : ajukanPermohonan,
                child: sedangMengirim
                    ? const CircularProgressIndicator()
                    : const Text('Ajukan Permohonan'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
