import 'package:city_weather/common/const.dart';
import 'package:city_weather/common/domain/error_handling/app_failure.dart';
import 'package:city_weather/common/domain/error_handling/either_failure_or.dart';
import 'package:city_weather/common/storage/repository/i_city_local_storage.dart';
import 'package:city_weather/feature/search/domain/entities/location.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive/hive.dart';

final localStorageRepositoryProvider = Provider<ICityLocalStorage>(
  (ref) => CityLocalStorage(),
);

class CityLocalStorage extends ICityLocalStorage {
  Future<Box<Location>> openBox() async {
    final box = await Hive.openBox<Location>(Const.boxLabel);
    return box;
  }

  @override
  EitherAppFailureOr<List<Location>> getCityList() async {
    try {
      final box = await openBox();
      return Right(box.values.toList());
    } catch (e) {
      return Left(AppFailure(title: e.toString()));
    }
  }

  @override
  EitherAppFailureOr<Unit> addCityToList(Location location) async {
    try {
      final box = await openBox();
      box.values.any((element) => element.name!.contains(location.name!))
          ? null
          : box.add(location);
      return const Right(unit);
    } catch (e) {
      return Left(AppFailure(title: e.toString()));
    }
  }

  @override
  EitherAppFailureOr<Unit> removeCityFromList(int index) async {
    try {
      final box = await openBox();
      box.deleteAt(index);
      return const Right(unit);
    } catch (e) {
      return Left(AppFailure(title: e.toString()));
    }
  }

  @override
  EitherAppFailureOr<Unit> clearCityList() async {
    try {
      final box = await openBox();
      box.clear();
      return const Right(unit);
    } catch (e) {
      return Left(AppFailure(title: e.toString()));
    }
  }
}
