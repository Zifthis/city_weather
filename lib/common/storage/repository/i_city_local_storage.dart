import 'package:city_weather/feature/search/domain/entities/location.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class ICityLocalStorage {
  Future<Box<Location>> openBox();
  Future<List<Location>> getCityList();
  Future<void> addCityToList(Location location);
  Future<void> removeCityFromList(int index);
  Future<void> clearCityList();
}
