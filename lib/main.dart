import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/pesanan_model.dart';
import 'model/chat_model.dart';
import 'navigation/kerangka_navigasi.dart';
import 'navigation/app_routes.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(
          create: (_) => PesananModel(),
        ),
        ChangeNotifierProvider(
          create: (_) => ChatModel(),
        ),
      ],
      child: const Aplikasi(),
    ),
  );
}

class Aplikasi extends StatelessWidget {
  const Aplikasi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peukan Rumoh',
      theme: ThemeData(
        colorSchemeSeed: Colors.green,
        useMaterial3: true,
      ),
      home: const KerangkaNavigasi(),
      routes: AppRoutes.routes,
    );
  }
}