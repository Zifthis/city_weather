import 'package:city_weather/common/storage/notifier/city_list_notifier.dart';
import 'package:city_weather/feature/search/domain/entities/location.dart';
import 'package:city_weather/feature/weather/domain/notifier/weather_notifier.dart';
import 'package:city_weather/feature/weather/presentation/weather_screen.dart';
import 'package:city_weather/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class CityLocationList extends ConsumerWidget {
  const CityLocationList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final listState = ref.watch(cityListNotifierProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Center(
              child: Text(
                S.current.location_list,
                style: const TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 24,
                    color: Colors.black),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: listState.maybeWhen(
              orElse: () => null,
              error: (error) => Center(
                  child: Text(
                '${S.current.error_search} \n$error',
                textAlign: TextAlign.center,
              )),
              loaded: (value) => ListOfCities(locationList: value),
            ),
          ),
        ],
      ),
    );
  }
}

class ListOfCities extends ConsumerStatefulWidget {
  final List<Location> locationList;
  const ListOfCities({
    super.key,
    required this.locationList,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _ListOfCitiesState();
}

class _ListOfCitiesState extends ConsumerState<ListOfCities> {
  @override
  Widget build(BuildContext context) {
    return RawScrollbar(
      thumbColor: Colors.blueGrey,
      radius: const Radius.circular(20),
      thickness: 4,
      child: ListView.builder(
        shrinkWrap: true,
        padding: EdgeInsets.zero,
        itemCount: widget.locationList.length,
        itemBuilder: (context, index) {
          return Slidable(
            endActionPane: ActionPane(
              motion: const ScrollMotion(),
              children: [
                SlidableAction(
                  borderRadius: BorderRadius.circular(10),
                  onPressed: (context) {
                    _onSwipe(index, widget.locationList[index]);
                  },
                  backgroundColor: Colors.grey,
                  foregroundColor: Colors.white,
                  icon: Icons.delete,
                  label: S.current.delete,
                ),
              ],
            ),
            child: Container(
              margin: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.black12,
              ),
              child: ListTile(
                onTap: () => _onTap(index),
                trailing: const Icon((Icons.more_vert_rounded)),
                title: Text(
                  widget.locationList[index].name ?? '',
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 18),
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  void _onSwipe(int index, Location city) {
    SnackBar snackBar = SnackBar(
      content: Text(
        '${widget.locationList[index].name.toString()} ${S.current.removed_from}',
        textAlign: TextAlign.center,
      ),
    );
    ref.read(cityListNotifierProvider.notifier).deleteCity(city, index);
    ref.read(cityListNotifierProvider.notifier).getCityList();
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void _onTap(int index) {
    ref
        .read(weatherNotifierProvider.notifier)
        .getCityWeather(widget.locationList[index].name.toString());
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const WeatherScreen()),
    );
  }
}
