import 'package:hive/hive.dart';

part 'weather_daily_cache.g.dart';

@HiveType(typeId: 2)
class WeatherDailyCache {
  @HiveField(0)
  final String date;

  @HiveField(1)
  final double minTemp;

  @HiveField(2)
  final double maxTemp;

  @HiveField(3)
  final String icon;

  WeatherDailyCache({
    required this.date,
    required this.minTemp,
    required this.maxTemp,
    required this.icon,
  });
}
