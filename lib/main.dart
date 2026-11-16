
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cart_cubit.dart';
import 'cubit/theme_cubit.dart';
import 'navigation/kerangka_navigasi.dart';
import 'theme/app_theme.dart';

void main() {
  runApp(const PeukanRumohApp());
}

class PeukanRumohApp extends StatelessWidget {
  const PeukanRumohApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => CartCubit(),
        ),
        BlocProvider(
          create: (_) => ThemeCubit(),
        ),
      ],
      child: BlocBuilder<ThemeCubit, ThemeMode>(
        builder: (context, mode) {
          return MaterialApp(
            title: 'Peukan Rumoh',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: mode,
            home: const KerangkaNavigasi(),
          );
        },
      ),
    );
  }
}
