import 'package:weather_app/services/api_service/end_point.dart';

class WeatherCurrent {
  final double tempC;
  final String conditionText;
  final String conditionIcon;
  final int humidity;
  final double windKph;
  final double feelsLikeC;

  WeatherCurrent({
    required this.tempC,
    required this.conditionText,
    required this.conditionIcon,
    required this.humidity,
    required this.windKph,
    required this.feelsLikeC,
  });

  factory WeatherCurrent.fromJson(Map<String, dynamic> json) {
    return WeatherCurrent(
      tempC: json[ApiKeys.tempC].toDouble() ?? 0.0,
      conditionText: json[ApiKeys.condition][ApiKeys.text] ?? '',
      conditionIcon: json[ApiKeys.condition][ApiKeys.icon] ?? '',
      humidity: json[ApiKeys.humidity] ?? 0,
      windKph: json[ApiKeys.windKph].toDouble() ?? 0.0,
      feelsLikeC: json[ApiKeys.feelslikeC].toDouble() ?? 0.0,
    );
  }
}
