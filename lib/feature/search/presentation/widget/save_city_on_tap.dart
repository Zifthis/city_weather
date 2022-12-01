import 'package:city_weather/common/storage/notifier/box_provider.dart';
import 'package:city_weather/common/storage/notifier/city_list_notifier.dart';
import 'package:city_weather/feature/search/domain/entities/location.dart';
import 'package:city_weather/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

void saveCityOnTap(
  int index,
  BuildContext context,
  WidgetRef ref,
  Location searchResult,
) async {
  final box = ref.read(hiveBoxProvider);
  SnackBar snackBar = SnackBar(
    content: Text(
      '${searchResult.name} ${S.current.added_to}',
      textAlign: TextAlign.center,
    ),
  );

  if (box.value!.values
      .cast<Location>()
      .any((element) => element.name!.contains(searchResult.name ?? ''))) {
  } else {
    ref
        .read(cityListNotifierProvider.notifier)
        .addCity(Location(name: searchResult.name ?? ''));
    ref.read(cityListNotifierProvider.notifier).getCityList();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
