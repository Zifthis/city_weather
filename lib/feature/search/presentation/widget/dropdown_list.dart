import 'package:city_weather/feature/search/domain/entities/location.dart';
import 'package:city_weather/feature/search/domain/notifier/save_city_provider.dart';
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
            ref.read(saveCityProvider(searchResult[index]));
          },
          child: CardList(title: searchResult[index].name ?? ''),
        );
      },
    );
  }
}
