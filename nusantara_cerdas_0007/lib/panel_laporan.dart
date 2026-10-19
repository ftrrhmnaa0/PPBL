import 'package:flutter/material.dart';

class PanelLaporanWarga extends StatefulWidget {
  const PanelLaporanWarga({super.key});

  @override
  State<PanelLaporanWarga> createState() => _PanelLaporanWargaState();
}

class _PanelLaporanWargaState extends State<PanelLaporanWarga> {
  int _jumlahLaporan = 0;

  void _laporanMasuk() {
    setState(() => _jumlahLaporan++);
  }

  void _laporanSelesai() {
    setState(() {
      if (_jumlahLaporan > 0) {
        _jumlahLaporan--;
      }
    });
  }

  void _resetHarian() {
    setState(() => _jumlahLaporan = 0);
  }

  String get _statusPelayanan {
    if (_jumlahLaporan < 5) return 'Pelayanan Lancar';
    if (_jumlahLaporan <= 10) return 'Pelayanan Sibuk';
    return 'Perlu Penambahan Petugas';
  }

  Color get _warnaStatus {
    if (_jumlahLaporan < 5) return const Color(0xFF21865B);
    if (_jumlahLaporan <= 10) return const Color(0xFFB7791F);
    return const Color(0xFFC0392B);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Row(
              children: [
                Icon(Icons.assignment_outlined, size: 25),
                SizedBox(width: 9),
                Expanded(
                  child: Text(
                    'Laporan Warga Hari Ini',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 18),
            Center(
              child: Column(
                children: [
                  Text(
                    '$_jumlahLaporan',
                    style: const TextStyle(
                      fontSize: 46,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const Text('laporan belum selesai'),
                  const SizedBox(height: 12),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 14,
                      vertical: 8,
                    ),
                    decoration: BoxDecoration(
                      color: _warnaStatus.withValues(alpha: 0.12),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    child: Text(
                      _statusPelayanan,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: _warnaStatus,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Center(
              child: Wrap(
                spacing: 10,
                runSpacing: 10,
                alignment: WrapAlignment.center,
                children: [
                  FilledButton.icon(
                    onPressed: _laporanMasuk,
                    icon: const Icon(Icons.add),
                    label: const Text('Laporan Masuk'),
                  ),
                  OutlinedButton.icon(
                    onPressed: _laporanSelesai,
                    icon: const Icon(Icons.check_circle_outline),
                    label: const Text('Laporan Selesai'),
                  ),
                  TextButton.icon(
                    onPressed: _resetHarian,
                    icon: const Icon(Icons.refresh),
                    label: const Text('Reset Harian'),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            const Center(
              child: Text(
                'Status dihitung otomatis: 0-4 lancar, 5-10 sibuk, dan lebih dari 10 perlu tambahan petugas.',
                textAlign: TextAlign.center,
                style: TextStyle(color: Color(0xFF5D6A67), fontSize: 12),
              ),
            ),
          ],
        ),
      ),
    );
  }
}