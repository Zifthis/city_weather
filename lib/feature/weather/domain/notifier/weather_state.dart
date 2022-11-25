import 'package:city_weather/common/domain/error_handling/app_failure.dart';
import 'package:city_weather/feature/weather/data/models/weather_response.dart';
import 'package:city_weather/feature/weather/domain/entities/weather.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_state.freezed.dart';

@freezed
class WeatherState with _$WeatherState {
  const factory WeatherState.initial() = _Initial;
  const factory WeatherState.loading() = _Loading;
  const factory WeatherState.loaded(
    Weather weather,
  ) = _Loaded;
  const factory WeatherState.error(AppFailure error) = _Error;
}
