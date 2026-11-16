import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'model/pengajuan_model.dart';
import 'navigation/app_routes.dart';
import 'navigation/kerangka_navigasi.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => PengajuanModel(),
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
      title: 'Nusantara Cerdas Mobile',
      theme: ThemeData(
        colorSchemeSeed: Colors.blue,
        useMaterial3: true,
      ),
      home: const KerangkaNavigasi(),
      onGenerateRoute: AppRoutes.generateRoute,
    );
  }
}