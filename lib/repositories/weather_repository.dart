import 'package:weather_app/models/api_models/weather_response.dart';

abstract class WeatherRepository {
  Future<WeatherResponse> getByCity(String city, String lang);
  Future<WeatherResponse> getByCoordinates(double lat, double lon, String lang);
}
