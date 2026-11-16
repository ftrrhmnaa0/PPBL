import 'package:flutter/material.dart';

import '../pages/formulir_pengajuan_page.dart';
import '../pages/detail_pengajuan_page.dart';
import '../model/pengajuan_model.dart';

class AppRoutes {
  static const String formulir = '/formulir';
  static const String detail = '/detail';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case formulir:
        final bidang = settings.arguments as String? ?? 'Perizinan';

        return MaterialPageRoute(
          builder: (_) => FormulirPengajuanPage(bidang: bidang),
        );

      case detail:
        final pengajuan = settings.arguments as Pengajuan;

        return MaterialPageRoute(
          builder: (_) => DetailPengajuanPage(
            pengajuan: pengajuan,
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(
              child: Text('Halaman tidak ditemukan'),
            ),
          ),
        );
    }
  }
}