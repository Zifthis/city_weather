import 'package:city_weather/common/storage/notifier/city_list_state.dart';
import 'package:city_weather/common/storage/repository/city_local_storage.dart';
import 'package:city_weather/common/storage/repository/i_city_local_storage.dart';
import 'package:city_weather/feature/search/domain/entities/location.dart';
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
    List<Location> locationList = await _cityLocalStorage.getCityList();
    state = locationList.isNotEmpty
        ? CityListState.loaded(locationList)
        : CityListState.error(S.current.list_empty);
  }

  Future<Box> getBox() async {
    Box box = await _cityLocalStorage.openBox();
    return box;
  }

  Future<void> addCity(Location location) async {
    await _cityLocalStorage.addCityToList(location);
    getCityList();
  }

  Future<void> deleteCity(Location location, int index) async {
    await _cityLocalStorage.removeCityFromList(index);
    getCityList();
  }

  Future<void> deleteAllCities() async {
    await _cityLocalStorage.clearCityList();
    getCityList();
  }
}
