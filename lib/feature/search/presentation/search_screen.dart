import 'package:city_weather/common/network/network_notifier.dart';
import 'package:city_weather/common/storage/notifier/city_list_notifier.dart';
import 'package:city_weather/feature/geolocator/domain/notifier/current_location.provider.dart';
import 'package:city_weather/feature/geolocator/domain/notifier/current_location_notifier.dart';
import 'package:city_weather/feature/geolocator/presentation/current_location_screen.dart';
import 'package:city_weather/feature/search/domain/notifier/search_notifier.dart';
import 'package:city_weather/feature/search/presentation/widget/dropdown_list.dart';
import 'package:city_weather/feature/search/presentation/widget/location_list.dart';
import 'package:city_weather/feature/search/presentation/widget/text_field_input.dart';
import 'package:city_weather/generated/l10n.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
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
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final searchState = ref.watch(searchNotifierProvider);

    ref.listen<ConnectivityResult?>(
      connectivityProvider,
      (previous, current) {
        if (current == ConnectivityResult.none && previous != null) {
          SnackBar snackBar = SnackBar(
            content: Text(
              S.current.no_internet,
              textAlign: TextAlign.center,
            ),
          );
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
    );

    return Scaffold(
      appBar: AppBar(
        title: Text(
          S.current.city_weather,
        ),
        actions: [
          SizedBox(
            child: IconButton(
              icon: const Icon(Icons.delete_sweep_sharp),
              onPressed: () => _clearList(),
            ),
          ),
          SizedBox(
            child: IconButton(
              icon: const Icon(Icons.gps_fixed_outlined),
              onPressed: () => _currentLocation(context),
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
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const SizedBox(height: 38),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 60),
                    child: TextFieldInput(myController: myController, ref: ref),
                  ),
                  Stack(
                    children: [
                      const CityLocationList(),
                      searchState.maybeWhen(
                        orElse: () => const SizedBox(),
                        loading: () => const Center(
                            child: CircularProgressIndicator.adaptive()),
                        loaded: (searchResult) {
                          return DropDownList(
                            searchResult: searchResult,
                          );
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _clearList() {
    ref.read(cityListNotifierProvider.notifier).deleteAllCities();
    ref.read(cityListNotifierProvider.notifier).getCityList();
  }

  void _currentLocation(BuildContext context) async {
    final loc = await ref.read(getCurrentLocationProvider);
    ref
        .read(currentLocationWeatherNotifierProvider.notifier)
        .getCurrentLocationWeather(loc as List<double>);
    if (!mounted) return;
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const CurrentLocationScreen(),
      ),
    );
  }
}
