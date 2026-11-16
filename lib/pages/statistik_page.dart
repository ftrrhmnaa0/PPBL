
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fl_chart/fl_chart.dart';

import '../state/prediksi_cubit.dart';
import '../state/prediksi_state.dart';

class StatistikPage extends StatelessWidget {
  const StatistikPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<PrediksiCubit, PrediksiState>(
        builder: (context, state) {
          final jumlahKering = state.totalKering.toDouble();
          final jumlahOptimal = state.totalOptimal.toDouble();
          final jumlahLembap =
              state.totalTerlaluLembap.toDouble();

          final nilaiMaksimum = [
            jumlahKering,
            jumlahOptimal,
            jumlahLembap,
          ].reduce((a, b) => a > b ? a : b);

          return ListView(
            padding: const EdgeInsets.all(16),
            children: [
              Text(
                'Statistik Mikroklimat',
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              if (state.daftarPrediksi.isEmpty)
                const Center(
                  child: Padding(
                    padding: EdgeInsets.all(24),
                    child: Text(
                      'Belum ada data untuk ditampilkan',
                    ),
                  ),
                )
              else
                SizedBox(
                  height: 320,
                  child: BarChart(
                    BarChartData(
                      maxY: nilaiMaksimum + 2,
                      minY: 0,
                      borderData: FlBorderData(
                        show: false,
                      ),
                      gridData: const FlGridData(
                        show: true,
                      ),
                      titlesData: FlTitlesData(
                        topTitles: const AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        rightTitles: const AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: false,
                          ),
                        ),
                        bottomTitles: AxisTitles(
                          sideTitles: SideTitles(
                            showTitles: true,
                            getTitlesWidget: (value, meta) {
                              const labels = [
                                'Kering',
                                'Optimal',
                                'Terlalu\nLembap',
                              ];

                              final index = value.toInt();

                              if (index < 0 ||
                                  index >= labels.length) {
                                return const SizedBox();
                              }

                              return SideTitleWidget(
                                meta: meta,
                                child: Text(
                                  labels[index],
                                  textAlign: TextAlign.center,
                                  style: const TextStyle(
                                    fontSize: 10,
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),
                      barGroups: [
                        _bar(0, jumlahKering, Colors.orange),
                        _bar(1, jumlahOptimal, Colors.green),
                        _bar(2, jumlahLembap, Colors.blue),
                      ],
                    ),
                  ),
                ),
              const SizedBox(height: 16),
              const Text(
                'Grafik menunjukkan jumlah data pada setiap '
                'status mikroklimat. Data akan berubah otomatis '
                'ketika riwayat prediksi ditambahkan atau dihapus.',
              ),
            ],
          );
        },
      ),
    );
  }

  BarChartGroupData _bar(
    int x,
    double nilai,
    Color warna,
  ) {
    return BarChartGroupData(
      x: x,
      barRods: [
        BarChartRodData(
          toY: nilai,
          color: warna,
          width: 32,
          borderRadius: BorderRadius.circular(4),
        ),
      ],
    );
  }
}
