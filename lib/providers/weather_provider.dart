import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/mapper/weather_cache_to_response_extension.dart';
import 'package:weather_app/mapper/weather_response_to_cache_extension.dart';
import 'package:weather_app/models/api_models/weather_response.dart';
import 'package:weather_app/services/api/dio_consumer.dart';
import 'package:weather_app/services/weather/weather_api_service_impl.dart';
import 'package:weather_app/services/cache/weather_cache_service.dart';

class WeatherNotifier extends AsyncNotifier<WeatherResponse> {
  late final WeatherApiServiceImpl _weatherService;
  late final WeatherCacheService _cacheService;

  @override
  Future<WeatherResponse> build() async {
    _cacheService = WeatherCacheService();
    final dio = Dio();
    _weatherService = WeatherApiServiceImpl(api: DioConsumer(dio: dio));

    throw const AsyncError('No data loaded', StackTrace.empty);
  }

  Future<void> fetchByCity(String city, String lang) async {
    state = const AsyncLoading();

    try {
      final response = await _weatherService.fetchByCity(city, lang);

      await _cacheService.save(response.toCache(city: city, lang: lang));

      state = AsyncData(response);
    } catch (e, st) {
      final cache = await _cacheService.get();

      if (cache != null) {
        state = AsyncData(cache.toResponse());
        print('⚠️ Offline: showing cached data. Error: $e');
      } else {
        state = AsyncError(e, st);
      }
    }
  }

  Future<void> fetchByCoordinates({
    required double lat,
    required double lon,
    required String lang,
  }) async {
    state = const AsyncLoading();
    final key = '$lat,$lon';

    try {
      final response = await _weatherService.fetchByCoordinates(lat, lon, lang);

      await _cacheService.save(response.toCache(city: key, lang: lang));

      state = AsyncData(response);
    } catch (e, st) {
      final cache = await _cacheService.get();

      if (cache != null) {
        state = AsyncData(cache.toResponse());
        print('⚠️ Offline: showing cached data. Error: $e');
      } else {
        state = AsyncError(e, st);
      }
    }
  }
}

// Provider
final weatherProvider = AsyncNotifierProvider<WeatherNotifier, WeatherResponse>(
  WeatherNotifier.new,
);
