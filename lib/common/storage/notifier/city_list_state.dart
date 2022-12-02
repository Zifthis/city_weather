import 'package:city_weather/feature/search/domain/entities/location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_list_state.freezed.dart';

@freezed
class CityListState with _$CityListState {
  const factory CityListState.initial() = _Initial;
  const factory CityListState.loading() = _Loading;
  const factory CityListState.loaded(
    List<Location> cityList,
  ) = _Loaded;
  const factory CityListState.error(String error) = _Error;
}
