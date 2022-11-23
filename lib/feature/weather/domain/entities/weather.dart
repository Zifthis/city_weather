import 'package:city_weather/feature/weather/domain/entities/current.dart';
import 'package:city_weather/feature/weather/domain/entities/location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather.freezed.dart';

@freezed
class Weather with _$Weather {
  const factory Weather({
    Location? location,
    Current? current,
  }) = _Weather;
}
