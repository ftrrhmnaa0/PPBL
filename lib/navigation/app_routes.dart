import 'package:flutter/material.dart';

import '../pages/detail_produk_page.dart';
import '../pages/profil_page.dart';
import '../pages/route_tidak_dikenal_page.dart';
import '../pages/tentang_page.dart';

import 'kerangka_navigasi.dart';

class AppRoutes {
  static const String beranda = '/';
  static const String detailProduk = '/detail-produk';
  static const String profil = '/profil';
  static const String tentang = '/tentang';

  static Map<String, WidgetBuilder> daftarRoute() {
    return {
      beranda: (context) => const KerangkaNavigasi(),
      profil: (context) => const ProfilPage(),
      tentang: (context) => const TentangPage(),
    };
  }

  static Route<dynamic>? bentukRoute(
    RouteSettings settings,
  ) {
    if (settings.name == detailProduk) {
      final data =
          settings.arguments as Map<String, String>;

      return MaterialPageRoute(
        builder: (context) {
          return DetailProdukPage(
            produk: data,
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