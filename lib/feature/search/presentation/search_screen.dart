import 'package:auto_route/auto_route.dart';
import 'package:city_weather/feature/search/domain/entities/search.dart';
import 'package:city_weather/feature/search/domain/notifier/search_list_state_provider.dart';
import 'package:city_weather/feature/search/domain/notifier/search_notifier.dart';
import 'package:city_weather/feature/weather/domain/notifier/weather_notifier.dart';
import 'package:city_weather/generated/l10n.dart';
import 'package:city_weather/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SearchScreen extends ConsumerStatefulWidget {
  const SearchScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SearchScreenState();
}

class _SearchScreenState extends ConsumerState<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final userLocationList = ref.watch(searchListStateProvider);
    final searchState = ref.watch(searchNotifierProvider);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(58.0),
        child: Column(
          children: [
            TextField(
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: S.current.search_city,
              ),
              onChanged: (input) => ref
                  .read(searchNotifierProvider.notifier)
                  .getSearchResult(input),
            ),
            searchState.maybeWhen(
              orElse: () => const SizedBox(),
              loading: () => const CircularProgressIndicator.adaptive(),
              loaded: (searchResult) =>
                  _dropDownSearchList(searchResult, userLocationList),
            ),
            const SizedBox(
              height: 58,
            ),
            userLocationList.isEmpty
                ? Text(S.current.error_search)
                : _userLocations(context, userLocationList),
          ],
        ),
      ),
    );
  }

  _dropDownSearchList(List<Search> searchResult, List<String> userList) {
    return SizedBox(
      height: 200,
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: searchResult.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () => userList.any((element) =>
                    element.contains(searchResult[index].name ?? ''))
                ? null
                : userList.add(searchResult[index].name.toString()),
            child: Card(
              child: Text(searchResult[index].name ?? ''),
            ),
          );
        },
      ),
    );
  }

  //RESPONZIVNO REFRESANJE LIST UKOLIKO JE DODAN ITEM
  _userLocations(BuildContext ctx, List<String> locationList) {
    return Expanded(
      child: ListView.builder(
        padding: EdgeInsets.zero,
        itemCount: locationList.length,
        itemBuilder: (context, index) {
          return InkWell(
            onTap: () {
              ref
                  .read(weatherNotifierProvider.notifier)
                  .getCityWeather(locationList[index]);
              ctx.router.pushNamed(const WeatherScreen().path);
            },
            onLongPress: () => setState(() {
              locationList.removeAt(index);
            }),
            child: Card(
              child: Text(locationList[index].toString()),
            ),
          );
        },
      ),
    );
  }
}
