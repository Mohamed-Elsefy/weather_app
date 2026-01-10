import 'package:flutter/material.dart';
import 'package:weather_app/core/constants/app_radius.dart';
import 'package:weather_app/core/constants/app_size.dart';
import 'color_schemes.dart';

abstract class AppTheme {
  static ThemeData get light => ThemeData(
    useMaterial3: true,
    brightness: Brightness.light,
    colorScheme: lightColorScheme,
    fontFamily: 'Inter',

    scaffoldBackgroundColor: lightColorScheme.surface,

    appBarTheme: AppBarTheme(
      backgroundColor: lightColorScheme.surface,
      foregroundColor: lightColorScheme.onSurface,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: lightColorScheme.onSurface,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: lightColorScheme.onSurface,
        size: AppSize.s_28,
      ),
    ),

    cardTheme: CardThemeData(
      color: lightColorScheme.surface,
      elevation: 3,
      shadowColor: lightColorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.r_20),
      ),
    ),

    textTheme: _textTheme(lightColorScheme),

    dividerTheme: DividerThemeData(
      color: lightColorScheme.onSurface.withAlpha(30),
      thickness: 1,
    ),

    listTileTheme: ListTileThemeData(
      iconColor: lightColorScheme.primary,
      titleTextStyle: TextStyle(
        color: lightColorScheme.onSurface,
        fontSize: 16,
      ),
    ),
  );

  static ThemeData get dark => ThemeData(
    useMaterial3: true,
    brightness: Brightness.dark,
    colorScheme: darkColorScheme,
    fontFamily: 'Inter',

    scaffoldBackgroundColor: darkColorScheme.surface,

    appBarTheme: AppBarTheme(
      backgroundColor: darkColorScheme.surface,
      foregroundColor: darkColorScheme.onSurface,
      elevation: 0,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: TextStyle(
        color: darkColorScheme.onSurface,
        fontSize: 18,
        fontWeight: FontWeight.bold,
      ),
      iconTheme: IconThemeData(
        color: darkColorScheme.onSurface,
        size: AppSize.s_28,
      ),
    ),

    cardTheme: CardThemeData(
      color: darkColorScheme.surface,
      elevation: 3,
      shadowColor: darkColorScheme.primary,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppRadius.r_20),
      ),
    ),

    textTheme: _textTheme(darkColorScheme),

    dividerTheme: DividerThemeData(
      color: darkColorScheme.onSurface.withAlpha(30),
      thickness: 1,
    ),

    listTileTheme: ListTileThemeData(
      iconColor: darkColorScheme.primary,
      titleTextStyle: TextStyle(color: darkColorScheme.onSurface, fontSize: 16),
    ),
  );

  static TextTheme _textTheme(ColorScheme scheme) {
    return TextTheme(
      headlineLarge: TextStyle(
        fontSize: 48,
        fontWeight: FontWeight.w300,
        color: scheme.onSurface,
      ),
      headlineMedium: TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.w400,
        color: scheme.onSurface,
      ),
      headlineSmall: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.w600,
        color: scheme.onSurface,
      ),
      titleMedium: TextStyle(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: scheme.onSurface,
      ),
      bodyLarge: TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: scheme.onSurface,
      ),
      bodyMedium: TextStyle(
        fontSize: 14,
        color: scheme.onSurface.withAlpha(205),
      ),
      labelMedium: TextStyle(
        fontSize: 12,
        color: scheme.onSurface.withAlpha(155),
      ),
    );
  }
}
