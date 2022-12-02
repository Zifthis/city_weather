import 'package:city_weather/common/const.dart';
import 'package:city_weather/common/storage/repository/i_city_local_storage.dart';
import 'package:city_weather/feature/search/domain/entities/location.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final localStorageRepositoryProvider = Provider<ICityLocalStorage>(
  (ref) => CityLocalStorage(),
);

class CityLocalStorage extends ICityLocalStorage {
  @override
  Future<Box<Location>> openBox() async {
    final box = await Hive.openBox<Location>(Const.boxLabel);
    return box;
  }

  @override
  Future<List<Location>> getCityList() async {
    final box = await openBox();
    return box.values.toList();
  }

  @override
  Future<void> addCityToList(Location location) async {
    final box = await openBox();
    await box.add(location);
  }

  @override
  Future<void> removeCityFromList(int index) async {
    final box = await openBox();
    await box.deleteAt(index);
  }

  @override
  Future<void> clearCityList() async {
    final box = await openBox();
    await box.clear();
  }
}
