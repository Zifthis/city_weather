import 'package:city_weather/common/storage/model/city_model.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class ICityLocalStorage {
  Future<Box> openBox();
  List<CityModel> getCityList(Box box);
  Future<void> addCityToList(Box box, CityModel cityModel);
  Future<void> removeCityFromList(Box box, int index);
  Future<void> clearCityList(Box box);
}
