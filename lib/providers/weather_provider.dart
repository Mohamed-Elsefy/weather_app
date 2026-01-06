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

  double? _lat;
  double? _lon;

  late final LocationService _locationService = LocationService();

  @override
  Future<WeatherResponse> build() async {
    final lang = ref.watch(localeProvider).languageCode;

    final position = await _locationService.getCurrentLocation();
    _lat = position.latitude;
    _lon = position.longitude;

    return _repo.getByCoordinates(_lat!, _lon!, lang);
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
    if (_lat == null || _lon == null) return;

    final lang = ref.read(localeProvider).languageCode;

    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => _repo.getByCoordinates(_lat!, _lon!, lang),
    );
  }
}

final weatherProvider = AsyncNotifierProvider<WeatherNotifier, WeatherResponse>(
  () => WeatherNotifier(),
);
