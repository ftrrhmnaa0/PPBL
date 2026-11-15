import 'package:flutter/material.dart';

class PanelLaporanWarga extends StatefulWidget {
  const PanelLaporanWarga({super.key});

  @override
  State<PanelLaporanWarga> createState() =>
      _PanelLaporanWargaState();
}

class _PanelLaporanWargaState extends State<PanelLaporanWarga> {
  int _jumlahLaporan = 0;

  void _laporanMasuk() {
    setState(() {
      _jumlahLaporan++;
    });
  }

  void _laporanSelesai() {
    if (_jumlahLaporan > 0) {
      setState(() {
        _jumlahLaporan--;
      });
    }
  }

  void _resetHarian() {
    setState(() {
      _jumlahLaporan = 0;
    });
  }

  String _statusPelayanan() {
    if (_jumlahLaporan < 5) {
      return 'Pelayanan Lancar';
    } else if (_jumlahLaporan <= 10) {
      return 'Pelayanan Sibuk';
    } else {
      return 'Perlu Penambahan Petugas';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Panel Laporan Warga',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 16),

            Center(
              child: Column(
                children: [
                  const Text(
                    'Jumlah Laporan Masuk',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    '$_jumlahLaporan',
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).primaryColor,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.teal.shade50,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  const Text(
                    'Status Pelayanan',
                    style: TextStyle(fontSize: 14),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    _statusPelayanan(),
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 16),

            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _laporanMasuk,
                    child: const Text('Laporan Masuk'),
                  ),
                ),
                const SizedBox(width: 8),
                Expanded(
                  child: ElevatedButton(
                    onPressed: _laporanSelesai,
                    child: const Text('Laporan Selesai'),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 8),

            SizedBox(
              width: double.infinity,
              child: OutlinedButton(
                onPressed: _resetHarian,
                child: const Text('Reset Harian'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}