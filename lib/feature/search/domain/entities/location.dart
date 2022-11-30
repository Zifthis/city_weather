import 'package:freezed_annotation/freezed_annotation.dart';

part 'location.freezed.dart';

@freezed
class Location with _$Location {
  const factory Location({
    int? id,
    String? name,
    String? region,
    String? country,
    double? lat,
    double? lon,
  }) = _Location;
}
