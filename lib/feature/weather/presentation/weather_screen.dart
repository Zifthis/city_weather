import 'package:city_weather/feature/weather/domain/weather_notifier.dart';
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
        loaded: (value) =>
            Center(child: Text(value.current?.tempC.toString() ?? '')),
      ),
    );
  }
}
