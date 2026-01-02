import 'package:weather_app/services/api_service/end_point.dart';

class WeatherDaily {
  final String date;
  final double minTemp;
  final double maxTemp;
  final String icon;

  WeatherDaily({
    required this.date,
    required this.minTemp,
    required this.maxTemp,
    required this.icon,
  });

  factory WeatherDaily.fromJson(Map<String, dynamic> json) {
    return WeatherDaily(
      date: json[ApiKeys.date] ?? '',
      minTemp: json[ApiKeys.day][ApiKeys.mintempC].toDouble() ?? 0.0,
      maxTemp: json[ApiKeys.day][ApiKeys.maxtempC].toDouble() ?? 0.0,
      icon: json[ApiKeys.day][ApiKeys.condition][ApiKeys.icon] ?? '',
    );
  }
}
