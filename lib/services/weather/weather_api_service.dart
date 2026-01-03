import 'package:weather_app/models/api_models/weather_response.dart';
import 'package:weather_app/services/api/api_consumer.dart';
import 'package:weather_app/services/api/end_point.dart';

class WeatherApiService {
  final ApiConsumer api;

  WeatherApiService({required this.api});

  Future<WeatherResponse> fetchByCity(String city, String lang) async {
    final response = await api.get(
      EndPoint.forecast,
      queryParameters: {
        ApiKeys.q: city,
        ApiKeys.days: 7,
        ApiKeys.aqi: 'no',
        ApiKeys.alerts: 'no',
        ApiKeys.lang: lang,
      },
    );
    return WeatherResponse.fromJson(response);
  }

  Future<WeatherResponse> fetchByCoordinates(
    double lat,
    double lon,
    String lang,
  ) async {
    final response = await api.get(
      EndPoint.forecast,
      queryParameters: {
        ApiKeys.q: '$lat,$lon',
        ApiKeys.days: 7,
        ApiKeys.aqi: 'no',
        ApiKeys.alerts: 'no',
        ApiKeys.lang: lang,
      },
    );
    return WeatherResponse.fromJson(response);
  }
}
