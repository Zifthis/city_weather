import 'package:city_weather/common/storage/notifier/city_list_state.dart';
import 'package:city_weather/common/storage/repository/city_local_storage.dart';
import 'package:city_weather/common/storage/repository/i_city_local_storage.dart';
import 'package:city_weather/feature/search/domain/entities/location.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
    final locationList = await _cityLocalStorage.getCityList();
    state = locationList.fold((error) => CityListState.error(error), (data) {
      return data.isNotEmpty
          ? CityListState.loaded(data)
          : const CityListState.emptyList();
    });
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
    state = const CityListState.emptyList();
  }
}
