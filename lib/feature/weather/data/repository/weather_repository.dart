import 'package:city_weather/common/data/api_client/api_client.dart';
import 'package:city_weather/common/data/provider.dart';
import 'package:city_weather/common/domain/error_handling/app_failure.dart';
import 'package:city_weather/common/domain/error_handling/either_failure_or.dart';
import 'package:city_weather/feature/weather/data/models/weather_response.dart';
import 'package:city_weather/feature/weather/data/repository/i_weather_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final weatherRepositoryProvider = Provider<IWeatherRepository>(
  (ref) => WeatherRepository(
    ref.read(apiClientProvider),
  ),
);

class WeatherRepository implements IWeatherRepository {
  final ApiClient _apiClient;

  WeatherRepository(this._apiClient);

  @override
  EitherAppFailureOr<WeatherResponse> fetchWeatherResponse(
      String cityName) async {
    try {
      final response = await _apiClient.getCityWeather(cityName);
      return Right(response);
    } catch (err) {
      return Left(Failure.serverError.toAppFailure);
    }
  }
}
