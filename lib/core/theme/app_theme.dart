import 'package:flutter/material.dart';
import 'color_schemes.dart';

abstract class AppTheme {
  static final light = ThemeData(
    colorScheme: lightColorScheme,
    fontFamily: 'Inter',
    brightness: Brightness.light,
  );

  static final dark = ThemeData(
    colorScheme: darkColorScheme,
    fontFamily: 'Inter',
    brightness: Brightness.dark,
  );
}
