import 'package:flutter/material.dart';

class AppTheme {
  AppTheme._();
  static ThemeData get lightTheme => ThemeData(
        fontFamily: 'Sofia Pro',
        scaffoldBackgroundColor: Colors.white,
        colorScheme: const ColorScheme.light(
          primary: Color(0xFF70B9BE),
          secondary: Color(0xFF042628),
          tertiary: Color(0xFF97A2B0),
          onSecondary: Colors.white,
        ),
      );
}
