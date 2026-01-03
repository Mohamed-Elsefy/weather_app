abstract class EndPoint {
  static const String baseUrl = 'https://api.weatherapi.com/v1';
  static const String forecast = '/forecast.json';
}

abstract class ApiKeys {
  static final String weatherApiKey = '100de0c87fd54b5ebef142231260101',
      hour = 'hour',
      current = 'current',
      location = 'location',
      forecastday = 'forecastday',
      forecast = 'forecast',
      localtime = 'localtime',
      lon = 'lon',
      lat = 'lat',
      country = 'country',
      name = 'name',
      time = 'time',
      tempC = 'temp_c',
      condition = 'condition',
      icon = 'icon',
      maxtempC = 'maxtemp_c',
      mintempC = 'mintemp_c',
      day = 'day',
      date = 'date',
      feelslikeC = 'feelslike_c',
      windKph = 'wind_kph',
      humidity = 'humidity',
      text = 'text',
      q = 'q',
      lang = 'lang',
      alerts = 'alerts',
      aqi = 'aqi',
      days = 'days';
}
