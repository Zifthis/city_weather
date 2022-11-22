import 'package:auto_route/auto_route.dart';
import 'package:city_weather/generated/l10n.dart';
import 'package:city_weather/router/app_router.gr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Home extends ConsumerWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(S.current.city_weather),
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => context.router.pushNamed(const WeatherScreen().path),
          child: Text(S.current.weather_screen),
        ),
      ),
    );
  }
}
