import 'package:weather_app/models/api_models/weather_response.dart';
import 'package:weather_app/models/api_models/weather_location.dart';
import 'package:weather_app/models/api_models/weather_current.dart';
import 'package:weather_app/models/api_models/weather_daily.dart';
import 'package:weather_app/models/api_models/weather_hourly.dart';
import 'package:weather_app/models/cach_models/weather_cache.dart';

extension WeatherCacheToResponseExtension on WeatherCache {
  WeatherResponse toResponse() {
    return WeatherResponse(
      location: WeatherLocation(
        name: location.name,
        country: location.country,
        lat: location.lat,
        lon: location.lon,
        localTime: location.localTime,
      ),
      current: WeatherCurrent(
        tempC: current.tempC,
        conditionText: current.conditionText,
        conditionIcon: current.icon,
        humidity: current.humidity,
        windKph: current.windKph,
        feelsLikeC: current.feelsLikeC,
      ),
      daily: daily
          .map(
            (d) => WeatherDaily(
              date: d.date,
              minTemp: d.minTemp,
              maxTemp: d.maxTemp,
              icon: d.icon,
            ),
          )
          .toList(),
      hourly: hourly
          .map((h) => WeatherHourly(time: h.time, tempC: h.tempC, icon: h.icon))
          .toList(),
    );
  }
}
