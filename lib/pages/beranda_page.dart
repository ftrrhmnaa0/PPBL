
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../cubit/pengajuan_cubit.dart';

class BerandaPage extends StatelessWidget {
  const BerandaPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nusantara Cerdas Mobile'),
      ),
      body: Center(
        child: BlocBuilder<PengajuanCubit, List<String>>(
          builder: (context, daftarPengajuan) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.location_city,
                  size: 72,
                ),
                const SizedBox(height: 16),
                const Text('Selamat Datang'),
                const SizedBox(height: 8),
                Text(
                  'Total pengajuan: ${daftarPengajuan.length}',
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
