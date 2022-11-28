import 'package:auto_route/auto_route.dart';
import 'package:city_weather/common/data/local_storage.dart';
import 'package:city_weather/feature/weather/domain/notifier/weather_notifier.dart';
import 'package:city_weather/generated/l10n.dart';
import 'package:city_weather/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class LocationList extends ConsumerStatefulWidget {
  final List locationList;
  const LocationList({
    super.key,
    required this.locationList,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _LocationListState();
}

class _LocationListState extends ConsumerState<LocationList> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(
              S.current.location_list,
              style: const TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 24,
                  color: Colors.black),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: RawScrollbar(
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
                            _onSwipe(index, context);
                          },
                          backgroundColor: const Color(0xFFFE4A49),
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
                        title: Text(
                          widget.locationList[index].toString(),
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              fontWeight: FontWeight.w500, fontSize: 18),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _onSwipe(int index, BuildContext context) {
    setState(() {
      SnackBar snackBar = SnackBar(
        content: Text(
          '${widget.locationList[index]} removed from the list!',
          textAlign: TextAlign.center,
        ),
      );
      widget.locationList.removeAt(index);
      ref
          .read(localStorageProvider)
          .setStringList(widget.locationList as List<String>);
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }

  void _onTap(int index) {
    ref
        .read(weatherNotifierProvider.notifier)
        .getCityWeather(widget.locationList[index]);
    context.router.pushNamed(const WeatherScreen().path);
  }
}
