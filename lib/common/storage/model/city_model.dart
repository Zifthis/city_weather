import 'package:hive_flutter/hive_flutter.dart';

part 'city_model.g.dart';

@HiveType(typeId: 0)
class CityModel {
  @HiveField(0)
  late String cityName;
}
