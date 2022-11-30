import 'package:city_weather/common/storage/model/city_model.dart';
import 'package:city_weather/common/storage/repository/i_city_local_storage.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final localStorageRepositoryProvider = Provider<ICityLocalStorage>(
  (ref) => CityLocalStorage(),
);

class CityLocalStorage extends ICityLocalStorage {
  String boxLabel = 'cityKey';

  @override
  Future<Box> openBox() async {
    final box = await Hive.openBox(boxLabel);
    return box;
  }

  @override
  List<CityModel> getCityList(Box box) {
    return box.values.toList().cast<CityModel>();
  }

  @override
  Future<void> addCityToList(Box box, CityModel cityModel) async {
    await box.add(cityModel);
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
