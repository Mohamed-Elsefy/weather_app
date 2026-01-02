import 'package:weather_app/services/api_service/end_point.dart';

class WeatherHourly {
  final String time;
  final double tempC;
  final String icon;

  WeatherHourly({required this.time, required this.tempC, required this.icon});

  factory WeatherHourly.fromJson(Map<String, dynamic> json) {
    return WeatherHourly(
      time: json[ApiKeys.time] ?? '',
      tempC: json[ApiKeys.tempC].toDouble() ?? 0.0,
      icon: json[ApiKeys.condition][ApiKeys.icon] ?? '',
    );
  }
}
