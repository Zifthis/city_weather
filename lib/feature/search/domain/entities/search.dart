import 'package:freezed_annotation/freezed_annotation.dart';

part 'search.freezed.dart';

@freezed
class Search with _$Search {
  const factory Search({
    int? id,
    String? name,
    String? region,
    String? country,
    double? lat,
    double? lon,
  }) = _Search;
}
