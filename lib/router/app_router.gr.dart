// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i3;
import 'package:flutter/material.dart' as _i4;

import '../feature/search/presentation/search_screen.dart' as _i1;
import '../feature/weather/presentation/weather_screen.dart' as _i2;

class AppRouter extends _i3.RootStackRouter {
  AppRouter([_i4.GlobalKey<_i4.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i3.PageFactory> pagesMap = {
    SearchScreen.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SearchScreen(),
      );
    },
    WeatherScreen.name: (routeData) {
      return _i3.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.WeatherScreen(),
      );
    },
  };

  @override
  List<_i3.RouteConfig> get routes => [
        _i3.RouteConfig(
          SearchScreen.name,
          path: '/',
        ),
        _i3.RouteConfig(
          WeatherScreen.name,
          path: '/weather_screen',
        ),
      ];
}

/// generated route for
/// [_i1.SearchScreen]
class SearchScreen extends _i3.PageRouteInfo<void> {
  const SearchScreen()
      : super(
          SearchScreen.name,
          path: '/',
        );

  static const String name = 'SearchScreen';
}

/// generated route for
/// [_i2.WeatherScreen]
class WeatherScreen extends _i3.PageRouteInfo<void> {
  const WeatherScreen()
      : super(
          WeatherScreen.name,
          path: '/weather_screen',
        );

  static const String name = 'WeatherScreen';
}
