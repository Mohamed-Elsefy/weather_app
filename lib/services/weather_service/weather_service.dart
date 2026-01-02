import 'package:weather_app/models/api_models/weather_response.dart';

abstract class WeatherService {
  Future<WeatherResponse> fetchByCity(String city, String lang);
  Future<WeatherResponse> fetchByCoordinates(
    double lat,
    double lon,
    String lang,
  );
}
