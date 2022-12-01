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
  Future<Box> openBox() async {
    final box = await Hive.openBox(Const.boxLabel);
    return box;
  }

  @override
  List<Location> getCityList(Box box) {
    return box.values.toList().cast<Location>();
  }

  @override
  Future<void> addCityToList(Box box, Location location) async {
    await box.add(location);
  }

  @override
  Future<void> removeCityFromList(Box box, int index) async {
    await box.deleteAt(index);
  }

  @override
  Future<void> clearCityList(Box box) async {
    await box.clear();
  }
}
