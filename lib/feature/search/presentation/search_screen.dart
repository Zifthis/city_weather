import 'package:city_weather/feature/search/domain/notifier/search_list_state_provider.dart';
import 'package:city_weather/feature/search/domain/notifier/search_notifier.dart';
import 'package:city_weather/feature/search/presentation/widget/dropdown_list.dart';
import 'package:city_weather/feature/search/presentation/widget/location_list.dart';
import 'package:city_weather/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  final myController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final userLocationList = ref.watch(searchListStateProvider);
    final searchState = ref.watch(searchNotifierProvider);

    return Scaffold(
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          myController.clear();
        },
        child: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/location.jpg"),
              opacity: -40,
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(60.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const SizedBox(
                      height: 32,
                    ),
                    TextField(
                      controller: myController,
                      decoration: InputDecoration(
                          enabledBorder: const OutlineInputBorder(
                            borderSide: BorderSide(width: 3.0),
                          ),
                          focusedBorder: const OutlineInputBorder(
                            borderSide: BorderSide(width: 3.0),
                          ),
                          border: const OutlineInputBorder(
                              borderSide: BorderSide(width: 3.0)),
                          labelText: S.current.search_city,
                          labelStyle: const TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                          )),
                      onChanged: (input) => ref
                          .read(searchNotifierProvider.notifier)
                          .getSearchResult(input),
                    ),
                    searchState.maybeWhen(
                      orElse: () => const SizedBox(),
                      loading: () => const CircularProgressIndicator.adaptive(),
                      loaded: (searchResult) => DropDownList(
                        searchResult: searchResult,
                        userLocationList: userLocationList,
                      ),
                    ),
                  ],
                ),
              ),
              userLocationList.isEmpty
                  ? Padding(
                      padding: const EdgeInsets.only(bottom: 68.0),
                      child: Text(
                        S.current.error_search,
                        style: const TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: 15.0,
                        ),
                      ),
                    )
                  : LocationList(
                      locationList: userLocationList,
                    )
            ],
          ),
        ),
      ),
    );
  }
}
