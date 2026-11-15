import 'package:flutter/material.dart';

import '../pages/beranda_page.dart';
import '../pages/detail_layanan_page.dart';
import '../pages/pengaturan_page.dart';
import '../pages/riwayat_laporan_page.dart';
import '../pages/route_tidak_dikenal_page.dart';
import '../pages/tentang_page.dart';
import 'kerangka_navigasi.dart';

class AppRoutes {
  static const String beranda = '/';
  static const String detailLayanan = '/detail-layanan';
  static const String riwayatLaporan = '/riwayat-laporan';
  static const String pengaturan = '/pengaturan';
  static const String tentang = '/tentang';

  static Map<String, WidgetBuilder> daftarRoute() {
    return {
      beranda: (context) => const KerangkaNavigasi(),
      riwayatLaporan: (context) => const RiwayatLaporanPage(),
      pengaturan: (context) => const PengaturanPage(),
      tentang: (context) => const TentangPage(),
    };
  }

  static Route<dynamic>? bentukRoute(
    RouteSettings settings,
  ) {
    if (settings.name == detailLayanan) {
      final data =
          settings.arguments as Map<String, String>;

      return MaterialPageRoute(
        builder: (context) {
          return DetailLayananPage(
            layanan: data,
          );
        },
      );
    }

    return null;
  }

  static Route<dynamic> routeTidakDikenal(
    RouteSettings settings,
  ) {
    return MaterialPageRoute(
      builder: (context) {
        return const RouteTidakDikenalPage();
      },
    );
  }
}