import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/api_models/weather_response.dart';
import 'package:weather_app/repositories/weather_repository.dart';
import 'package:weather_app/repositories/weather_repository_impl.dart';
import 'package:weather_app/services/api/dio_consumer.dart';
import 'package:weather_app/services/cache/weather_cache_service.dart';
import 'package:weather_app/services/weather/weather_api_service.dart';

class WeatherNotifier extends AsyncNotifier<WeatherResponse> {
  late final WeatherRepository _repo;

  @override
  Future<WeatherResponse> build() async {
    final dio = Dio();
    _repo = WeatherRepositoryImpl(
      api: WeatherApiService(api: DioConsumer(dio: dio)),
      cache: WeatherCacheService(),
    );

    throw const AsyncError('No data loaded', StackTrace.empty);
  }

  Future<void> fetchByCity(String city, String lang) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => _repo.getByCity(city, lang));
  }

  Future<void> fetchByCoordinates({
    required double lat,
    required double lon,
    required String lang,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _repo.getByCoordinates(lat, lon, lang),
    );
  }
}

final weatherProvider = AsyncNotifierProvider<WeatherNotifier, WeatherResponse>(
  () => WeatherNotifier(),
);
