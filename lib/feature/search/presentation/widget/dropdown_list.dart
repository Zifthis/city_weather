import 'package:city_weather/common/storage/model/city_model.dart';
import 'package:city_weather/common/storage/notifier/city_list_notifier.dart';
import 'package:city_weather/feature/search/domain/entities/search.dart';
import 'package:city_weather/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'card_list.dart';

class DropDownList extends ConsumerWidget {
  final List<Search> searchResult;

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
          onTap: () => _onTap(index, context, ref),
          child: CardList(title: searchResult[index].name ?? ''),
        );
      },
    );
  }

  void _onTap(int index, BuildContext context, WidgetRef ref) async {
    {
      SnackBar snackBar = SnackBar(
        content: Text(
          '${searchResult[index].name} ${S.current.added_to}',
          textAlign: TextAlign.center,
        ),
      );
      final cityModel = CityModel();
      ref
          .read(cityListNotifierProvider.notifier)
          .addCity(cityModel..cityName = searchResult[index].name ?? '');
      ref.read(cityListNotifierProvider.notifier).getCityList();
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }
}
