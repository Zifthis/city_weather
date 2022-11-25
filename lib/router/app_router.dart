import 'package:auto_route/auto_route.dart';
import 'package:city_weather/feature/search/presentation/search_screen.dart';
import 'package:city_weather/feature/weather/presentation/weather_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: SearchScreen, initial: true),
    AutoRoute(page: WeatherScreen, path: '/weather_screen'),
  ],
)
class $AppRouter {}
