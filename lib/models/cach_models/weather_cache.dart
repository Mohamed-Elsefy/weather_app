import 'package:hive/hive.dart';
import 'package:weather_app/models/cach_models/weather_current_cache.dart';
import 'package:weather_app/models/cach_models/weather_daily_cache.dart';
import 'package:weather_app/models/cach_models/weather_hourly_cache.dart';
import 'package:weather_app/models/cach_models/weather_location_cache.dart';

part 'weather_cache.g.dart';

@HiveType(typeId: 0)
class WeatherCache {
  @HiveField(0)
  final WeatherLocationCache location;

  @HiveField(1)
  final String lang;

  @HiveField(2)
  final DateTime cachedAt;

  @HiveField(3)
  final WeatherCurrentCache current;

  @HiveField(4)
  final List<WeatherDailyCache> daily;

  @HiveField(5)
  final List<WeatherHourlyCache> hourly;

  WeatherCache({
    required this.location,
    required this.lang,
    required this.cachedAt,
    required this.current,
    required this.daily,
    required this.hourly,
  });
}
