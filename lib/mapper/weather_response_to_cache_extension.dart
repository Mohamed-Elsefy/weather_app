import 'package:weather_app/models/cach_models/weather_cache.dart';
import 'package:weather_app/models/cach_models/weather_current_cache.dart';
import 'package:weather_app/models/cach_models/weather_daily_cache.dart';
import 'package:weather_app/models/cach_models/weather_hourly_cache.dart';
import 'package:weather_app/models/api_models/weather_response.dart';
import 'package:weather_app/models/cach_models/weather_location_cache.dart';

extension WeatherResponseToCacheExtension on WeatherResponse {
  WeatherCache toCache({required String city, required String lang}) {
    return WeatherCache(
      location: WeatherLocationCache(
        name: location.name,
        country: location.country,
        lat: location.lat,
        lon: location.lon,
        localTime: location.localTime,
      ),
      lang: lang,
      cachedAt: DateTime.now(),
      current: WeatherCurrentCache(
        tempC: current.tempC,
        conditionText: current.conditionText,
        icon: current.conditionIcon,
        humidity: current.humidity,
        windKph: current.windKph,
        feelsLikeC: current.feelsLikeC,
      ),
      daily: daily
          .map(
            (d) => WeatherDailyCache(
              date: d.date,
              minTemp: d.minTemp,
              maxTemp: d.maxTemp,
              icon: d.icon,
            ),
          )
          .toList(),
      hourly: hourly
          .map(
            (h) =>
                WeatherHourlyCache(time: h.time, tempC: h.tempC, icon: h.icon),
          )
          .toList(),
    );
  }
}
