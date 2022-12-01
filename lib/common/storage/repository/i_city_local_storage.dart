import 'package:city_weather/feature/search/domain/entities/location.dart';
import 'package:hive_flutter/hive_flutter.dart';

abstract class ICityLocalStorage {
  Future<Box> openBox();
  List<Location> getCityList(Box box);
  Future<void> addCityToList(Box box, Location location);
  Future<void> removeCityFromList(Box box, int index);
  Future<void> clearCityList(Box box);
}
