
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'navigation/app_routes.dart';
import 'navigation/kerangka_navigasi.dart';

import 'state/prediksi_cubit.dart';
import 'state/prediksi_state.dart';
import 'state/theme_cubit.dart';

import 'theme/app_theme.dart';

void main() {
  runApp(const AgriClimaApp());
}

class AgriClimaApp extends StatelessWidget {
  const AgriClimaApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => PrediksiCubit(),
        ),
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp(
            title: 'AgriClima LSTM',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: mode,
            routes: AppRoutes.routes,
            home: const KerangkaNavigasi(),
          );
        },
      ),
    );
  }
}
