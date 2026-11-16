
import 'package:flutter/material.dart';

import '../pages/detail_layanan_page.dart';

class AppRoutes {
  static const String detailLayanan = '/detail-layanan';

  static Route<dynamic>? onGenerateRoute(
    RouteSettings settings,
  ) {
    switch (settings.name) {
      case detailLayanan:
        final arguments = settings.arguments;

        if (arguments is Map<String, String>) {
          return MaterialPageRoute(
            builder: (context) {
              return DetailLayananPage(
                layanan: arguments,
              );
            },
          );
        }

        return MaterialPageRoute(
          builder: (context) {
            return const Scaffold(
              body: Center(
                child: Text(
                  'Data layanan tidak valid.',
                ),
              ),
            );
          },
        );

      default:
        return null;
    }
  }
}
