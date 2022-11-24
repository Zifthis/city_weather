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
    return SizedBox(
      height: 200,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: searchResult.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              SnackBar snackBar = SnackBar(
                content: Text(
                  '${searchResult[index].name} is already in the list!',
                  textAlign: TextAlign.center,
                ),
              );
              userLocationList.any((element) =>
                      element.contains(searchResult[index].name ?? ''))
                  ? ScaffoldMessenger.of(context).showSnackBar(snackBar)
                  : userLocationList.add(searchResult[index].name.toString());
            },
            child: CardList(title: searchResult[index].name ?? ''),
          );
        },
      ),
    );
  }
}
