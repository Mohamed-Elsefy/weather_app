import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:weather_app/models/api_models/weather_response.dart';
import 'package:weather_app/providers/locale_provider.dart';
import 'package:weather_app/repositories/weather_repository.dart';
import 'package:weather_app/repositories/weather_repository_impl.dart';
import 'package:weather_app/services/api/dio_consumer.dart';
import 'package:weather_app/services/cache/weather_cache_service.dart';
import 'package:weather_app/services/location/location_service.dart';
import 'package:weather_app/services/weather/weather_api_service.dart';

class WeatherNotifier extends AsyncNotifier<WeatherResponse> {
  late final WeatherRepository _repo = WeatherRepositoryImpl(
    api: WeatherApiService(api: DioConsumer(dio: Dio())),
    cache: WeatherCacheService(),
  );

  late final LocationService _locationService = LocationService();

  @override
  Future<WeatherResponse> build() async {
    final lang = ref.watch(localeProvider).languageCode;
    final position = await _locationService.getCurrentLocation();

    return _repo.getByCoordinates(position.latitude, position.longitude, lang);
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

  Future<void> refresh() async {
    final lang = ref.watch(localeProvider).languageCode;
    final position = await _locationService.getCurrentLocation();

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _repo.getByCoordinates(position.latitude, position.longitude, lang),
    );
  }
}

final weatherProvider = AsyncNotifierProvider<WeatherNotifier, WeatherResponse>(
  () => WeatherNotifier(),
);
