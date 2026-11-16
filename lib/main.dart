
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'cubit/cart_cubit.dart';
import 'navigation/kerangka_navigasi.dart';

void main() {
  runApp(
    BlocProvider(
      create: (context) => CartCubit(),
      child: const PeukanRumohApp(),
    ),
  );
}

class PeukanRumohApp extends StatelessWidget {
  const PeukanRumohApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Peukan Rumoh',

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.teal,
        ),
        useMaterial3: true,
      ),

      home: const KerangkaNavigasi(),
    );
  }
}
