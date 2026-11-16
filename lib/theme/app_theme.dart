
import 'package:flutter/material.dart';

class AppTheme {
  static const Color warnaUtama = Color(0xFF2E7D32);

  static ThemeData lightTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: warnaUtama,
      brightness: Brightness.light,
    ),
  );

  static ThemeData darkTheme = ThemeData(
    useMaterial3: true,
    colorScheme: ColorScheme.fromSeed(
      seedColor: warnaUtama,
      brightness: Brightness.dark,
    ),
  );
}
