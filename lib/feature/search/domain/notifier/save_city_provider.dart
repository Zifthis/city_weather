import 'package:city_weather/common/storage/notifier/city_list_notifier.dart';
import 'package:city_weather/feature/search/domain/entities/location.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final saveCityProvider = FutureProvider.autoDispose.family<String, Location>(
  (ref, location) async {
    final box = await ref.read(cityListNotifierProvider.notifier).getBox();
    final label = location.name ?? '';
    if (box.values
        .cast<Location>()
        .any((element) => element.name!.contains(label))) {
    } else {
      ref.read(cityListNotifierProvider.notifier).addCity(location);
    }

    return label;
  },
);
