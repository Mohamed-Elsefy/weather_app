import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/services/settings/settings_service.dart';

class LocaleNotifier extends Notifier<Locale> {
  final SettingsService _settings = SettingsService();

  @override
  Locale build() {
    final saved = _settings.getLocaleSync();
    if (saved != null && saved.isNotEmpty) {
      return Locale(saved);
    }
    return const Locale('en');
  }

  void changeToEnglish() => setLocale(const Locale('en'));
  void changeToArabic() => setLocale(const Locale('ar'));

  void setLocale(Locale locale) {
    state = locale;
    _settings.saveLocale(locale.languageCode);
  }
}

final localeProvider = NotifierProvider<LocaleNotifier, Locale>(
  LocaleNotifier.new,
);
