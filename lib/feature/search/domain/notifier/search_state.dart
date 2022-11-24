import 'package:city_weather/common/domain/error_handling/app_failure.dart';
import 'package:city_weather/feature/search/domain/entities/search.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState.initial() = _Initial;
  const factory SearchState.loading() = _Loading;
  const factory SearchState.loaded(
    List<Search> searchList,
  ) = _Loaded;
  const factory SearchState.error(AppFailure error) = _Error;
}
