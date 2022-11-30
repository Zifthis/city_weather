import 'package:city_weather/common/storage/notifier/city_list_notifier.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final hiveBoxProvider = FutureProvider<Box>((ref) async {
  Box box = await ref.read(cityListNotifierProvider.notifier).getBox();
  return box;
});
