import 'package:city_weather/common/data/local_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'card_list.dart';

class DropDownList extends ConsumerWidget {
  final List searchResult;
  final List userLocationList;
  const DropDownList({
    super.key,
    required this.searchResult,
    required this.userLocationList,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ListView.builder(
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: searchResult.length,
      itemBuilder: (context, index) {
        return InkWell(
          onTap: () async {
            SnackBar snackBar = SnackBar(
              content: Text(
                '${searchResult[index].name} is already in the list!',
                textAlign: TextAlign.center,
              ),
            );

            if (userLocationList.any((element) =>
                element.contains(searchResult[index].name ?? ''))) {
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            } else {
              userLocationList.add(searchResult[index].name.toString());
              ref
                  .read(localStorageProvider)
                  .setStringList(userLocationList as List<String>);
            }

            /* userLocationList.any((element) =>
                    element.contains(searchResult[index].name ?? ''))
                ? ScaffoldMessenger.of(context).showSnackBar(snackBar)
                : userLocationList.add(searchResult[index].name.toString());*/
          },
          child: CardList(title: searchResult[index].name ?? ''),
        );
      },
    );
  }
}
