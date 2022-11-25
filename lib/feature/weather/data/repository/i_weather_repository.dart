import 'package:city_weather/common/domain/error_handling/either_failure_or.dart';
import 'package:city_weather/feature/weather/domain/entities/weather.dart';

abstract class IWeatherRepository {
  EitherAppFailureOr<Weather> fetchWeatherResponse(String cityName);
}
