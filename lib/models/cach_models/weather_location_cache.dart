import 'package:hive/hive.dart';

part 'weather_location_cache.g.dart';

@HiveType(typeId: 4)
class WeatherLocationCache {
  @HiveField(0)
  final String name;

  @HiveField(1)
  final String country;

  @HiveField(2)
  final double lat;

  @HiveField(3)
  final double lon;

  @HiveField(4)
  final String localTime;

  WeatherLocationCache({
    required this.name,
    required this.country,
    required this.lat,
    required this.lon,
    required this.localTime,
  });
}
