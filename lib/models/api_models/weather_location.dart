import 'package:weather_app/services/api_service/end_point.dart';

class WeatherLocation {
  final String name;
  final String country;
  final double lat;
  final double lon;
  final String localTime;

  WeatherLocation({
    required this.name,
    required this.country,
    required this.lat,
    required this.lon,
    required this.localTime,
  });

  factory WeatherLocation.fromJson(Map<String, dynamic> json) {
    return WeatherLocation(
      name: json[ApiKeys.name] ?? '',
      country: json[ApiKeys.country] ?? '',
      lat: json[ApiKeys.lat].toDouble() ?? 0.0,
      lon: json[ApiKeys.lon].toDouble() ?? 0.0,
      localTime: json[ApiKeys.localtime] ?? '',
    );
  }
}
