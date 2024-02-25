import 'package:flutter/material.dart';

class AppColors {

  static const int _primaryValue = 0xFF57B085;

  static const Color primaryColor = Color(0xFF57B085);

  static const MaterialColor primarySwatch = MaterialColor(
    _primaryValue,
    <int, Color>{
      50: Color(_primaryValue),
      100: Color(_primaryValue),
      200: Color(_primaryValue),
      300: Color(_primaryValue),
      400: Color(_primaryValue),
      500: Color(_primaryValue),
      600: Color(_primaryValue),
      700: Color(_primaryValue),
      800: Color(_primaryValue),
      900: Color(_primaryValue),
    },
  );

  static Color pageColor = Colors.grey.shade200;
  static const Color white = Colors.white;

  AppColors._();
}
