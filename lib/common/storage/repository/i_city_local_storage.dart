import 'package:city_weather/common/domain/error_handling/either_failure_or.dart';
import 'package:city_weather/feature/search/domain/entities/location.dart';
import 'package:dartz/dartz.dart';

abstract class ICityLocalStorage {
  EitherAppFailureOr<List<Location>> getCityList();
  EitherAppFailureOr<Unit> addCityToList(Location location);
  EitherAppFailureOr<Unit> removeCityFromList(int index);
  EitherAppFailureOr<Unit> clearCityList();
}
