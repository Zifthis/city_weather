import 'package:city_weather/common/domain/error_handling/either_failure_or.dart';
import 'package:city_weather/feature/search/domain/entities/search.dart';
import 'package:city_weather/feature/weather/domain/entities/weather.dart';

abstract class ICityWeatherRepository {
  EitherAppFailureOr<List<Search>> fetchSearchResponse(String search);
  EitherAppFailureOr<Weather> fetchWeatherResponse(String cityName);
  EitherAppFailureOr<Weather> fetchCurrentLocationWeather(List<double> current);
}
