import 'package:city_weather/common/data/api_client/api_client.dart';
import 'package:city_weather/common/data/provider.dart';
import 'package:city_weather/common/data/repository/i_city_weather_repository.dart';
import 'package:city_weather/common/domain/error_handling/app_failure.dart';
import 'package:city_weather/common/domain/error_handling/either_failure_or.dart';
import 'package:city_weather/feature/search/domain/entities/location.dart';
import 'package:city_weather/feature/weather/domain/entities/weather.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final cityWeatherRepositoryProvider = Provider<ICityWeatherRepository>(
  (ref) => WeatherRepositoryProvider(
    ref.read(apiClientProvider),
  ),
);

class WeatherRepositoryProvider implements ICityWeatherRepository {
  final ApiClient _apiClient;

  WeatherRepositoryProvider(this._apiClient);

  @override
  EitherAppFailureOr<List<Location>> fetchSearchResponse(String search) async {
    try {
      final response = await _apiClient.getSearchResults(search);
      return Right(response);
    } on DioError catch (error) {
      final err = error;
      err.response?.statusCode;
      return Left(AppFailure.fromDioErrorResponse(err));
    } catch (err) {
      return Left(Failure.serverError.toAppFailure);
    }
  }

  @override
  EitherAppFailureOr<Weather> fetchWeatherResponse(String cityName) async {
    try {
      final response = await _apiClient.getCityWeather(cityName);
      return Right(response.toDomain());
    } on DioError catch (error) {
      final err = error;
      err.response?.statusCode;
      return Left(AppFailure.fromDioErrorResponse(err));
    } catch (err) {
      return Left(Failure.serverError.toAppFailure);
    }
  }

  @override
  EitherAppFailureOr<Weather> fetchCurrentLocationWeather(
      List<double> current) async {
    try {
      final response = await _apiClient.getCurrentLocationTemperature(current);
      return Right(response.toDomain());
    } on DioError catch (error) {
      final err = error;
      err.response?.statusCode;
      return Left(AppFailure.fromDioErrorResponse(err));
    } catch (err) {
      return Left(Failure.serverError.toAppFailure);
    }
  }
}
