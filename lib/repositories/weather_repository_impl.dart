import 'package:weather_app/mapper/weather_cache_to_response_extension.dart';
import 'package:weather_app/mapper/weather_response_to_cache_extension.dart';
import 'package:weather_app/models/api_models/weather_response.dart';
import 'package:weather_app/repositories/weather_repository.dart';
import 'package:weather_app/services/cache/weather_cache_service.dart';
import 'package:weather_app/services/weather/weather_api_service.dart';

class WeatherRepositoryImpl implements WeatherRepository {
  final WeatherApiService api;
  final WeatherCacheService cache;

  WeatherRepositoryImpl({required this.api, required this.cache});

  @override
  Future<WeatherResponse> getByCity(String city, String lang) async {
    try {
      final response = await api.fetchByCity(city, lang);
      await cache.save(response.toCache(lang: lang));
      return response;
    } catch (_) {
      final cached = await cache.get();
      if (cached != null) return cached.toResponse();
      rethrow;
    }
  }

  @override
  Future<WeatherResponse> getByCoordinates(
    double lat,
    double lon,
    String lang,
  ) async {
    try {
      final response = await api.fetchByCoordinates(lat, lon, lang);
      await cache.save(response.toCache(lang: lang));
      return response;
    } catch (_) {
      final cached = await cache.get();
      if (cached != null) return cached.toResponse();
      rethrow;
    }
  }
}
