import 'package:hive/hive.dart';
import 'package:weather_app/models/cach_models/weather_cache.dart';

class WeatherCacheService {
  static const String boxName = 'weather_cache';
  static const String cacheKey = 'latest_weather';

  static const Duration ttl = Duration(hours: 3);

  Future<Box<WeatherCache>> _openBox() async {
    if (!Hive.isBoxOpen(boxName)) {
      return await Hive.openBox<WeatherCache>(boxName);
    }
    return Hive.box<WeatherCache>(boxName);
  }

  Future<void> save(WeatherCache cache) async {
    final box = await _openBox();
    await box.put(cacheKey, cache);
  }

  Future<WeatherCache?> get() async {
    final box = await _openBox();
    final cache = box.get(cacheKey);

    if (cache == null) return null;

    final isExpired = DateTime.now().difference(cache.cachedAt) > ttl;
    if (isExpired) return null;

    return cache;
  }

  Future<void> clear() async {
    final box = await _openBox();
    await box.delete(cacheKey);
  }
}
