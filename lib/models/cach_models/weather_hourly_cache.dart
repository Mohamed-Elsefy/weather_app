import 'package:hive/hive.dart';

part 'weather_hourly_cache.g.dart';

@HiveType(typeId: 3)
class WeatherHourlyCache {
  @HiveField(0)
  final String time;

  @HiveField(1)
  final double tempC;

  @HiveField(2)
  final String icon;

  WeatherHourlyCache({
    required this.time,
    required this.tempC,
    required this.icon,
  });
}
