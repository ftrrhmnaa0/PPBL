
import 'package:flutter/material.dart';

import '../pages/beranda_page.dart';
import '../pages/tentang_page.dart';
import '../pages/input_prediksi_page.dart';

class AppRoutes {
  static const String beranda = '/beranda';
  static const String tentang = '/tentang';
  static const String inputPrediksi = '/input-prediksi';

  static Map<String, WidgetBuilder> routes = {
    beranda: (context) => const BerandaPage(),
    tentang: (context) => const TentangPage(),
    inputPrediksi: (context) => const InputPrediksiPage(),
  };
}
