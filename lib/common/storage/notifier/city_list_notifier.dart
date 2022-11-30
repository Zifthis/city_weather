import 'package:city_weather/common/storage/model/city_model.dart';
import 'package:city_weather/common/storage/notifier/city_list_state.dart';
import 'package:city_weather/common/storage/repository/city_local_storage.dart';
import 'package:city_weather/common/storage/repository/i_city_local_storage.dart';
import 'package:city_weather/generated/l10n.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final cityListNotifierProvider =
    StateNotifierProvider<CityListNotifier, CityListState>(
  (ref) => CityListNotifier(
    ref.read(localStorageRepositoryProvider),
  ),
);

class CityListNotifier extends StateNotifier<CityListState> {
  final ICityLocalStorage _cityLocalStorage;

  CityListNotifier(
    this._cityLocalStorage,
  ) : super(const CityListState.initial()) {
    getCityList();
  }

  Future<void> getCityList() async {
    Box box = await _cityLocalStorage.openBox();
    List<CityModel> cityModelList = _cityLocalStorage.getCityList(box);
    state = cityModelList.isNotEmpty
        ? CityListState.loaded(cityModelList)
        : CityListState.error(S.current.list_empty);
  }

  Future<Box> getBox() async {
    Box box = await _cityLocalStorage.openBox();
    return box;
  }

  Future<void> addCity(CityModel cityName) async {
    Box box = await _cityLocalStorage.openBox();
    final newItem = _cityLocalStorage.addCityToList(box, cityName);
    state = CityListState.loaded(newItem as List<CityModel>);
  }

  Future<void> deleteCity(CityModel cityName, int index) async {
    Box box = await _cityLocalStorage.openBox();
    final newItem = _cityLocalStorage.removeCityFromList(box, index);
    state = CityListState.loaded(newItem as List<CityModel>);
  }

  Future<void> deleteAllCities() async {
    Box box = await _cityLocalStorage.openBox();
    final newItem = _cityLocalStorage.clearCityList(box);
    state = CityListState.loaded(newItem as List<CityModel>);
    box.close();
  }
}
