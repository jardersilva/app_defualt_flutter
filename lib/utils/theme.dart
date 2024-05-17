import 'package:app_cadastro/utils/appColors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static final ThemeData defaultTheme = ThemeData(
      colorScheme: ColorScheme.fromSeed(
        seedColor: const Color(AppColors.primary),
        primary: const Color(AppColors.primary),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Color(AppColors.primary),
      ),
      useMaterial3: false);
}
