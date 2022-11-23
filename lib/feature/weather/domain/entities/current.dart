import 'package:freezed_annotation/freezed_annotation.dart';

part 'current.freezed.dart';

@freezed
class Current with _$Current {
  const factory Current({
    double? feelslikeC,
    double? tempC,
  }) = _Current;
}
