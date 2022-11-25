import 'package:city_weather/feature/search/presentation/widget/location_list.dart';
import 'package:city_weather/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ListWidget extends ConsumerWidget {
  final List<String> userLocationList;
  const ListWidget({
    super.key,
    required this.userLocationList,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return userLocationList.isNotEmpty
        ? LocationList(
            locationList: userLocationList,
          )
        : Padding(
            padding: const EdgeInsets.only(top: 28.0),
            child: Text(
              S.current.error_search,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15.0,
              ),
            ),
          );
  }
}
