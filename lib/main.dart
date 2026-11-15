import 'package:flutter/material.dart';

import 'navigation/app_routes.dart';

void main() {
  runApp(const PeukanRumohApp());
}

class PeukanRumohApp extends StatelessWidget {
  const PeukanRumohApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Peukan Rumoh',

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
        scaffoldBackgroundColor: const Color(0xFFF5F7F8),
      ),

      initialRoute: AppRoutes.beranda,

      routes: AppRoutes.daftarRoute(),

      onGenerateRoute: AppRoutes.bentukRoute,

      onUnknownRoute: AppRoutes.routeTidakDikenal,
    );
  }
}