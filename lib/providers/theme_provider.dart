import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/services/settings/settings_service.dart';

class ThemeNotifier extends Notifier<ThemeMode> {
  final SettingsService _settings = SettingsService();

  final String light = 'light';
  final String dark = 'dark';
  final String system = 'system';

  @override
  ThemeMode build() {
    final saved = _settings.getThemeSync();
    if (saved == light) return ThemeMode.light;
    if (saved == dark) return ThemeMode.dark;
    return ThemeMode.system;
  }

  void setLight() {
    state = ThemeMode.light;
    _settings.saveTheme(light);
  }

  void setDark() {
    state = ThemeMode.dark;
    _settings.saveTheme(dark);
  }

  void setSystem() {
    state = ThemeMode.system;
    _settings.saveTheme(system);
  }

  void setTheme(ThemeMode mode) {
    state = mode;
    final key = (mode == ThemeMode.light)
        ? light
        : (mode == ThemeMode.dark)
        ? dark
        : system;
    _settings.saveTheme(key);
  }
}

final themeProvider = NotifierProvider<ThemeNotifier, ThemeMode>(
  ThemeNotifier.new,
);
