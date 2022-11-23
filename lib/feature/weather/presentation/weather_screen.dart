import 'package:city_weather/feature/weather/domain/notifier/weather_notifier.dart';
import 'package:city_weather/feature/weather/presentation/widget/weather_display.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class WeatherScreen extends ConsumerWidget {
  const WeatherScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(weatherNotifierProvider);
    return Scaffold(
      body: state.maybeWhen(
          orElse: () => const Center(
                child: CircularProgressIndicator(),
              ),
          loaded: (value) => WeatherDisplay(
              location: value.location?.name ?? '',
              title: value.current?.tempC.toString() ?? '')),
    );
  }
}
