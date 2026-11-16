
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/hasil_prediksi.dart';
import '../state/prediksi_cubit.dart';
import '../state/prediksi_state.dart';
import '../widgets/stat_card.dart';
import '../widgets/prediksi_card.dart';

class PrediksiPage extends StatelessWidget {
  const PrediksiPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PrediksiCubit, PrediksiState>(
        builder: (context, state) {
          final daftar = state.prediksiTerfilter;

          return Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Riwayat Prediksi',
                      style: Theme.of(context)
                          .textTheme.titleLarge,
                    ),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 8,
                      children: [
                        _filterChip(
                          context,
                          'Semua',
                          state.filterPetak,
                        ),
                        _filterChip(
                          context,
                          'Petak 1',
                          state.filterPetak,
                        ),
                        _filterChip(
                          context,
                          'Petak 2',
                          state.filterPetak,
                        ),
                      ],
                    ),
                    const SizedBox(height: 12),
                    Row(
                      children: [
                        Expanded(
                          child: StatCard(
                            judul: 'Total',
                            jumlah: state.totalPrediksi,
                            ikon: Icons.analytics,
                            warna: Colors.blue,
                          ),
                        ),
                        Expanded(
                          child: StatCard(
                            judul: 'Optimal',
                            jumlah: state.totalOptimal,
                            ikon: Icons.check_circle,
                            warna: Colors.green,
                          ),
                        ),
                        Expanded(
                          child: StatCard(
                            judul: 'Perlu Tindakan',
                            jumlah: state.totalPerluTindakan,
                            ikon: Icons.warning,
                            warna: Colors.orange,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: daftar.isEmpty
                    ? const Center(
                        child: Text('Belum ada data'),
                      )
                    : ListView.builder(
                        itemCount: daftar.length,
                        itemBuilder: (context, index) {
                          final data = daftar[index];

                          return PrediksiCard(
                            data: data,
                            onHapus: () {
                              context
                                  .read<PrediksiCubit>()
                                  .hapusPrediksi(data);
                            },
                          );
                        },
                      ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () {
          Navigator.pushNamed(
            context,
            '/input-prediksi',
          );
        },
        icon: const Icon(Icons.add),
        label: const Text('Prediksi Baru'),
      ),
    );
  }

  Widget _filterChip(
    BuildContext context,
    String label,
    String filterAktif,
  ) {
    return ChoiceChip(
      label: Text(label),
      selected: filterAktif == label,
      onSelected: (_) {
        context.read<PrediksiCubit>().ubahFilter(label);
      },
    );
  }
}
