import 'package:flutter/material.dart';

import 'navigation/app_routes.dart';

void main() {
  runApp(const NusantaraCerdasApp());
}

class NusantaraCerdasApp extends StatelessWidget {
  const NusantaraCerdasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Nusantara Cerdas Mobile',

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