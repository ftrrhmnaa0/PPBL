
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/favorit_cubit.dart';
import 'cubit/pengajuan_cubit.dart';

import 'navigation/app_routes.dart';
import 'navigation/kerangka_navigasi.dart';

void main() {
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<FavoritCubit>(
          create: (context) => FavoritCubit(),
        ),

        BlocProvider<PengajuanCubit>(
          create: (context) => PengajuanCubit(),
        ),
      ],

      child: const NusantaraCerdasApp(),
    ),
  );
}

class NusantaraCerdasApp extends StatelessWidget {
  const NusantaraCerdasApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Nusantara Cerdas Mobile',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
        useMaterial3: true,
      ),

      home: const KerangkaNavigasi(),

      onGenerateRoute: AppRoutes.onGenerateRoute,
    );
  }
}
