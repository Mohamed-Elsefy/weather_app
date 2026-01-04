import 'package:hive/hive.dart';

class SettingsService {
  static const String boxName = 'settings';
  static const String keyLocale = 'locale';
  static const String keyTheme = 'theme';

  Future<void> init() async {
    if (!Hive.isBoxOpen(boxName)) {
      await Hive.openBox(boxName);
    }
  }

  String? getLocaleSync() {
    if (!Hive.isBoxOpen(boxName)) return null;
    final box = Hive.box(boxName);
    return box.get(keyLocale) as String?;
  }

  Future<void> saveLocale(String locale) async {
    final box = await _openBox();
    await box.put(keyLocale, locale);
  }

  String? getThemeSync() {
    if (!Hive.isBoxOpen(boxName)) return null;
    final box = Hive.box(boxName);
    return box.get(keyTheme) as String?;
  }

  Future<void> saveTheme(String theme) async {
    final box = await _openBox();
    await box.put(keyTheme, theme);
  }

  Future<Box> _openBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox(boxName);
    }
    return Hive.box(boxName);
  }
}
