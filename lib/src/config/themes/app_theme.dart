import 'package:flutter/material.dart';

class AppTheme {
  static const appBarElevation = 0.0;

  static ThemeData get light {
    return ThemeData(
      appBarTheme: AppBarTheme(
        elevation: appBarElevation,
        color: Colors.blue.shade900,
      ),
      scaffoldBackgroundColor: Colors.blue.shade900,
      primaryColor: Colors.blue,
      splashColor: Colors.transparent,
      fontFamily: 'IBM',
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.blue),
    );
  }

  ThemeData themeByColorScheme(ColorScheme colorScheme) {
    return ThemeData(
      appBarTheme: AppBarTheme(
        elevation: appBarElevation,
        color: colorScheme.secondary,
      ),
      scaffoldBackgroundColor: colorScheme.primary,
      primaryColor: colorScheme.primary,
      splashColor: Colors.transparent,
      fontFamily: 'IBM',
      colorScheme: colorScheme,
      cardColor: colorScheme.primary,
    );
  }
}
