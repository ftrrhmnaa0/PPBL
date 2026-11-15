import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'models/keranjang_model.dart';
import 'navigation/kerangka_navigasi.dart';

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => KeranjangModel(),
      child: const AplikasiPeukanRumoh(),
    ),
  );
}

class AplikasiPeukanRumoh extends StatelessWidget {
  const AplikasiPeukanRumoh({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peukan Rumoh',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.green,
        ),
        useMaterial3: true,
      ),
      home: const KerangkaNavigasi(),
    );
  }
}