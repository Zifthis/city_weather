import 'package:city_weather/feature/geolocator/domain/notifier/current_location_notifier.dart';
import 'package:city_weather/feature/weather/presentation/widget/weather_display.dart';
import 'package:city_weather/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CurrentLocationScreen extends ConsumerWidget {
  const CurrentLocationScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final coordinateState = ref.watch(currentLocationWeatherNotifierProvider);
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.city_weather),
      ),
      body: coordinateState.maybeWhen(
          orElse: () => _buildPlaceholderWidget(context),
          loaded: (value) => WeatherDisplay(
              location: value.location?.name ?? '',
              title: value.current?.tempC.toString() ?? '')),
    );
  }

  _buildPlaceholderWidget(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/weather.jpg"),
          opacity: 40,
          fit: BoxFit.cover,
        ),
      ),
      child: const SizedBox(),
    );
  }
}
