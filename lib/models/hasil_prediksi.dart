
import 'package:flutter/material.dart';

class HasilPrediksi {
  final String petak;
  final String tanaman;
  final double suhuUdara;
  final double kelembapanUdara;
  final double kelembapanTanah;
  final String namaPetugas;
  final DateTime waktu;

  HasilPrediksi({
    required this.petak,
    required this.tanaman,
    required this.suhuUdara,
    required this.kelembapanUdara,
    required this.kelembapanTanah,
    required this.namaPetugas,
    required this.waktu,
  });

  String get status {
    if (kelembapanTanah < 40) {
      return 'Kering';
    } else if (kelembapanTanah <= 70) {
      return 'Optimal';
    } else {
      return 'Terlalu Lembap';
    }
  }

  String get rekomendasi {
    if (kelembapanTanah < 40) {
      return 'Segera lakukan penyiraman atau irigasi';
    } else if (kelembapanTanah <= 70) {
      return 'Pertahankan pola perawatan saat ini';
    } else {
      return 'Kurangi penyiraman dan periksa drainase';
    }
  }

  Color get warnaStatus {
    switch (status) {
      case 'Kering':
        return Colors.orange;
      case 'Optimal':
        return Colors.green;
      default:
        return Colors.blue;
    }
  }

  IconData get ikonStatus {
    switch (status) {
      case 'Kering':
        return Icons.water_drop_outlined;
      case 'Optimal':
        return Icons.check_circle_outline;
      default:
        return Icons.water;
    }
  }
}
