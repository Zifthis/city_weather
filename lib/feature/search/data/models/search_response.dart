import 'package:freezed_annotation/freezed_annotation.dart';

part "search_response.g.dart";

@JsonSerializable(fieldRename: FieldRename.snake)
class SearchResponse {
  int id;
  String name;
  String region;
  String country;
  double lat;
  double lon;

  SearchResponse({
    required this.id,
    required this.name,
    required this.region,
    required this.country,
    required this.lat,
    required this.lon,
  });

  factory SearchResponse.fromJson(Map<String, dynamic> json) =>
      _$SearchResponseFromJson(json);
  Map<String, dynamic> toJson() => _$SearchResponseToJson(this);
}
