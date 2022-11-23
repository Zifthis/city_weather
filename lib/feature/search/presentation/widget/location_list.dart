import 'package:auto_route/auto_route.dart';
import 'package:city_weather/feature/search/presentation/widget/card_list.dart';
import 'package:city_weather/feature/weather/domain/notifier/weather_notifier.dart';
import 'package:city_weather/generated/l10n.dart';
import 'package:city_weather/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

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
            padding: const EdgeInsets.all(8.0),
            child: Text(
              S.current.location_list,
              style: const TextStyle(
                  fontWeight: FontWeight.w700,
                  fontSize: 24,
                  color: Colors.black),
            ),
          ),
          Container(
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey)),
            height: 200,
            width: MediaQuery.of(context).size.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.builder(
                padding: EdgeInsets.zero,
                itemCount: widget.locationList.length,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      ref
                          .read(weatherNotifierProvider.notifier)
                          .getCityWeather(widget.locationList[index]);
                      context.router.pushNamed(const WeatherScreen().path);
                    },
                    onLongPress: () => setState(() {
                      widget.locationList.removeAt(index);
                    }),
                    child: CardList(
                      title: widget.locationList[index].toString(),
                    ),
                  );
                },
              ),
            ),
          ),
          const SizedBox(
            height: 48,
          ),
        ],
      ),
    );
  }
}
