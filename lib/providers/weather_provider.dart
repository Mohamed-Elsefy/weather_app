import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:weather_app/models/api_models/weather_response.dart';
import 'package:weather_app/services/api_service/dio_consumer.dart';
import 'package:weather_app/services/weather_service/weather_api_service_impl.dart';

class WeatherNotifier extends AsyncNotifier<WeatherResponse> {
  late final WeatherApiServiceImpl service;

  @override
  Future<WeatherResponse> build() async {
    final dio = Dio();
    final apiConsumer = DioConsumer(dio: dio);
    service = WeatherApiServiceImpl(api: apiConsumer);

    throw const AsyncError('No data loaded', StackTrace.empty);
  }

  Future<void> fetchByCity(String city, String lang) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(() => service.fetchByCity(city, lang));
  }

  Future<void> fetchByCoordinates({
    required double lat,
    required double lon,
    required String lang,
  }) async {
    state = const AsyncLoading();
    state = await AsyncValue.guard(
      () => service.fetchByCoordinates(lat, lon, lang),
    );
  }
}

final weatherProvider = AsyncNotifierProvider<WeatherNotifier, WeatherResponse>(
  WeatherNotifier.new,
);
