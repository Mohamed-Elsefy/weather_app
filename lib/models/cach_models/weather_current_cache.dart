import 'package:hive/hive.dart';

part 'weather_current_cache.g.dart';

@HiveType(typeId: 1)
class WeatherCurrentCache {
  @HiveField(0)
  final double tempC;

  @HiveField(1)
  final String conditionText;

  @HiveField(2)
  final String icon;

  @HiveField(3)
  final int humidity;

  @HiveField(4)
  final double windKph;

  @HiveField(5)
  final double feelsLikeC;

  WeatherCurrentCache({
    required this.tempC,
    required this.conditionText,
    required this.icon,
    required this.humidity,
    required this.windKph,
    required this.feelsLikeC,
  });
}
