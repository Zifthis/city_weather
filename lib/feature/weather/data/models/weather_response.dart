import 'package:city_weather/feature/weather/domain/entities/current.dart';
import 'package:city_weather/feature/weather/domain/entities/location.dart';
import 'package:city_weather/feature/weather/domain/entities/weather.dart';
import 'package:json_annotation/json_annotation.dart';

part "weather_response.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class WeatherResponse {
  LocationResponse? location;
  CurrentResponse? current;

  WeatherResponse({
    this.location,
    this.current,
  });

  factory WeatherResponse.fromJson(Map<String, dynamic> json) =>
      _$WeatherResponseFromJson(json);
  Map<String, dynamic> toJson() => _$WeatherResponseToJson(this);

  Weather toDomain() => Weather(
        current: current!.toDomain(),
        location: location!.toDomain(),
      );
}

@JsonSerializable(fieldRename: FieldRename.snake)
class CurrentResponse {
  final double? feelslikeC;
  final double? tempC;
  CurrentResponse({
    this.tempC,
    this.feelslikeC,
  });

  factory CurrentResponse.fromJson(Map<String, dynamic> json) =>
      _$CurrentResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CurrentResponseToJson(this);

  Current toDomain() => Current(
        feelslikeC: feelslikeC,
        tempC: tempC,
      );
}

@JsonSerializable(fieldRename: FieldRename.snake)
class LocationResponse {
  final String? name;
  final String? localtime;
  LocationResponse({
    this.name,
    this.localtime,
  });

  factory LocationResponse.fromJson(Map<String, dynamic> json) =>
      _$LocationResponseFromJson(json);
  Map<String, dynamic> toJson() => _$LocationResponseToJson(this);

  Location toDomain() => Location(
        localtime: localtime,
        name: name,
      );
}
