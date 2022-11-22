import 'package:auto_route/auto_route.dart';
import 'package:city_weather/common/presentation/home.dart';
import 'package:city_weather/feature/search/presentation/search_screen.dart';
import 'package:city_weather/feature/weather/presentation/weather_screen.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AutoRoute(page: Home, initial: true),
    AutoRoute(page: WeatherScreen, path: '/weather_screen'),
    AutoRoute(page: SearchScreen, path: '/search_screen'),
  ],
)
class $AppRouter {}
