import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:fl_chart/fl_chart.dart';

import '../model/pengajuan_model.dart';

class StatistikPage extends StatelessWidget {
  const StatistikPage({super.key});

  @override
  Widget build(BuildContext context) {
    final model = context.watch<PengajuanModel>();

    final bidang = [
      'Perizinan',
      'Kesehatan',
      'Transportasi',
    ];

    final jumlah = bidang
        .map((nama) => model.jumlahBidang(nama))
        .toList();

    final nilaiMaksimum = jumlah.reduce(
      (a, b) => a > b ? a : b,
    );

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Statistik Pengajuan Layanan',
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),

          const SizedBox(height: 24),

          Text('Total Pengajuan: ${model.totalPengajuan}'),

          const SizedBox(height: 24),

          Expanded(
            child: BarChart(
              BarChartData(
                maxY: (nilaiMaksimum + 1).toDouble(),
                barGroups: List.generate(
                  bidang.length,
                  (index) {
                    return BarChartGroupData(
                      x: index,
                      barRods: [
                        BarChartRodData(
                          toY: jumlah[index].toDouble(),
                          width: 25,
                          color: Colors.blue,
                        ),
                      ],
                    );
                  },
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
                        final index = value.toInt();

                        if (index < 0 || index >= bidang.length) {
                          return const SizedBox.shrink();
                        }

                        return Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Text(
                            bidang[index],
                            style: const TextStyle(fontSize: 10),
                          ),
                        );
                      },
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}