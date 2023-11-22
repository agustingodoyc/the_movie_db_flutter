import 'package:flutter/material.dart';

class AppTheme {
  // Constants
  static const Color _transparentColor = Colors.transparent;
  static const String _fontFamily = 'IBM';
  static const double _appBarElevation = 0.0;

  final ColorScheme colorScheme;

  AppTheme({required this.colorScheme});

  ThemeData _buildTheme(Color? backgroundColor) {
    final Color primaryColor = colorScheme.primary;
    return ThemeData(
      colorScheme: colorScheme,
      scaffoldBackgroundColor: backgroundColor,
      splashColor: _transparentColor,
      fontFamily: _fontFamily,
      appBarTheme: AppBarTheme(
        elevation: _appBarElevation,
        color: primaryColor,
      ),
      drawerTheme: DrawerThemeData(backgroundColor: primaryColor),
    );
  }

  ThemeData get lightTheme => _buildTheme(Colors.white);

  ThemeData get darkTheme => _buildTheme(colorScheme.primary);
}
