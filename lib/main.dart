import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:weather_app/app.dart';
import 'package:weather_app/models/cach_models/weather_cache.dart';
import 'package:weather_app/models/cach_models/weather_current_cache.dart';
import 'package:weather_app/models/cach_models/weather_daily_cache.dart';
import 'package:weather_app/models/cach_models/weather_hourly_cache.dart';
import 'package:weather_app/models/cach_models/weather_location_cache.dart';
import 'package:weather_app/services/settings/settings_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initHive();
  runApp(const ProviderScope(child: MainApp()));
}

Future<void> initHive() async {
  await Hive.initFlutter();

  Hive.registerAdapter(WeatherCacheAdapter());
  Hive.registerAdapter(WeatherCurrentCacheAdapter());
  Hive.registerAdapter(WeatherDailyCacheAdapter());
  Hive.registerAdapter(WeatherHourlyCacheAdapter());
  Hive.registerAdapter(WeatherLocationCacheAdapter());

  await Hive.openBox(SettingsService.boxName);
}
