import 'package:auto_route/auto_route.dart';
import 'package:city_weather/common/data/local_storage.dart';
import 'package:city_weather/feature/geolocator/domain/notifier/current_location.provider.dart';
import 'package:city_weather/feature/geolocator/domain/notifier/current_location_notifier.dart';
import 'package:city_weather/feature/search/domain/notifier/search_list_provider.dart';
import 'package:city_weather/feature/search/domain/notifier/search_notifier.dart';
import 'package:city_weather/feature/search/presentation/widget/dropdown_list.dart';
import 'package:city_weather/feature/search/presentation/widget/list_widget.dart';
import 'package:city_weather/feature/search/presentation/widget/text_field_input.dart';
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
  final myController = TextEditingController();

  @override
  void initState() {
    super.initState();
    init();
  }

  Future init() async {
    final prefs = await ref.read(localStorageProvider).getStringList();
    if (prefs.isEmpty) {
      return;
    } else {
      setState(() {
        ref.read(searchListProvider.notifier).state.addAll(prefs.toList());
      });
    }
  }

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final userLocationList = ref.watch(searchListProvider);
    final searchState = ref.watch(searchNotifierProvider);

    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.city_weather),
        actions: [
          SizedBox(
            height: 50,
            width: 50,
            child: IconButton(
              icon: const Icon(Icons.gps_fixed_outlined),
              onPressed: () => _currentLocation(),
            ),
          ),
        ],
      ),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
          myController.clear();
          ref.read(searchNotifierProvider.notifier).setInitSearch();
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
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 60.0, vertical: 38),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    TextFieldInput(myController: myController, ref: ref),
                    Stack(
                      children: [
                        ListWidget(userLocationList: userLocationList),
                        searchState.maybeWhen(
                          orElse: () => const SizedBox(),
                          loading: () => const Center(
                              child: CircularProgressIndicator.adaptive()),
                          loaded: (searchResult) => DropDownList(
                            searchResult: searchResult,
                            userLocationList: userLocationList,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _currentLocation() async {
    final loc = await ref.read(getCurrentLocationProvider);
    print(loc);
    print('--------------');
    print(loc.toString());
    ref
        .read(currentLocationWeatherNotifierProvider.notifier)
        .getCurrentLocationWeather(loc as List<double>);
    context.router.pushNamed(const CurrentLocationScreen().path);
  }
}
