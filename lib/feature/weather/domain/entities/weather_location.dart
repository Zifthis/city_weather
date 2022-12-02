import 'package:freezed_annotation/freezed_annotation.dart';

part 'weather_location.freezed.dart';

@freezed
class WeatherLocation with _$WeatherLocation {
  const factory WeatherLocation({
    String? name,
    String? localtime,
  }) = _WeatherLocation;
}
