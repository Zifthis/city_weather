import 'package:city_weather/common/const.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hive_flutter/hive_flutter.dart';

part 'location.freezed.dart';
part 'location.g.dart';

@freezed
@HiveType(typeId: Const.hiveTypeId)
class Location with _$Location {
  const factory Location({
    @HiveField(0) int? id,
    @HiveField(1) String? name,
    @HiveField(2) String? region,
    @HiveField(3) String? country,
    @HiveField(4) double? lat,
    @HiveField(5) double? lon,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
