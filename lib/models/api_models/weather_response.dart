import 'package:weather_app/models/api_models/weather_current.dart';
import 'package:weather_app/models/api_models/weather_daily.dart';
import 'package:weather_app/models/api_models/weather_hourly.dart';
import 'package:weather_app/models/api_models/weather_location.dart';
import 'package:weather_app/services/api/end_point.dart';

class WeatherResponse {
  final WeatherLocation location;
  final WeatherCurrent current;
  final List<WeatherDaily> daily;
  final List<WeatherHourly> hourly;

  WeatherResponse({
    required this.location,
    required this.current,
    required this.daily,
    required this.hourly,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) {
    final forecastDays = json[ApiKeys.forecast][ApiKeys.forecastday] as List;

    return WeatherResponse(
      location: WeatherLocation.fromJson(json[ApiKeys.location]),
      current: WeatherCurrent.fromJson(json[ApiKeys.current]),
      daily: forecastDays.map((e) => WeatherDaily.fromJson(e)).toList(),
      hourly: forecastDays.first[ApiKeys.hour]
          .map<WeatherHourly>((e) => WeatherHourly.fromJson(e))
          .toList(),
    );
  }
}
