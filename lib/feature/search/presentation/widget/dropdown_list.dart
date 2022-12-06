import 'package:city_weather/common/storage/notifier/city_list_notifier.dart';
import 'package:city_weather/feature/search/domain/entities/location.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'card_list.dart';

class DropDownList extends ConsumerWidget {
  final List<Location> searchResult;

  const DropDownList({
    super.key,
    required this.searchResult,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      padding: const EdgeInsets.symmetric(horizontal: 60),
      itemCount: searchResult.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async {
            //addCity()
            ref
                .read(cityListNotifierProvider.notifier)
                .addCity(searchResult[index]);
          },
          child: CardList(title: searchResult[index].name ?? ''),
        );
      },
    );
  }
}
