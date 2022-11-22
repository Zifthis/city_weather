import 'package:city_weather/common/domain/error_handling/either_failure_or.dart';
import 'package:city_weather/feature/weather/data/models/weather_response.dart';

abstract class IWeatherRepository {
  EitherAppFailureOr<WeatherResponse> fetchWeatherResponse(String cityName);
}
