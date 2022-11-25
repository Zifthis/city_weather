import 'package:city_weather/common/domain/error_handling/app_failure.dart';
import 'package:city_weather/feature/weather/domain/entities/weather.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'current_location_state.freezed.dart';

@freezed
class CurrentLocationState with _$CurrentLocationState {
  const factory CurrentLocationState.initial() = _Initial;
  const factory CurrentLocationState.loading() = _Loading;
  const factory CurrentLocationState.loaded(
    Weather weather,
  ) = _Loaded;
  const factory CurrentLocationState.error(AppFailure error) = _Error;
}
