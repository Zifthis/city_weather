import 'package:city_weather/feature/search/domain/notifier/search_notifier.dart';
import 'package:city_weather/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TextFieldInput extends StatelessWidget {
  const TextFieldInput({
    Key? key,
    required this.myController,
    required this.ref,
  }) : super(key: key);

  final TextEditingController myController;
  final WidgetRef ref;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: myController,
      decoration: InputDecoration(
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 3.0),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(width: 3.0),
          ),
          border: const OutlineInputBorder(borderSide: BorderSide(width: 3.0)),
          labelText: S.current.search_city,
          labelStyle: const TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          )),
      onChanged: (input) =>
          ref.read(searchNotifierProvider.notifier).getSearchResult(input),
    );
  }
}
