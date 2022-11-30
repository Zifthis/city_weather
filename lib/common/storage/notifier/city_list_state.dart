import 'package:city_weather/common/domain/error_handling/app_failure.dart';
import 'package:city_weather/common/storage/model/city_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'city_list_state.freezed.dart';

@freezed
class CityListState with _$CityListState {
  const factory CityListState.initial() = _Initial;
  const factory CityListState.loading() = _Loading;
  const factory CityListState.loaded(
    List<CityModel> cityList,
  ) = _Loaded;
  const factory CityListState.error(String error) = _Error;
}
