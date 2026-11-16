
import 'package:flutter/material.dart';

import '../pages/beranda_page.dart';
import '../pages/formulir_pesanan_page.dart';
import '../pages/pesanan_page.dart';
import '../pages/chat_page.dart';

class AppRoutes {
  static const String beranda = '/';
  static const String formulir = '/formulir';
  static const String pesanan = '/pesanan';
  static const String chat = '/chat';

  static Map<String, WidgetBuilder> routes = {
    formulir: (context) => const FormulirPesananPage(),
    pesanan: (context) => const PesananPage(),
    chat: (context) => const ChatPage(),
  };
}
