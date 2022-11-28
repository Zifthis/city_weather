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
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/material.dart' as _i5;

import '../feature/geolocator/presentation/current_location_screen.dart' as _i3;
import '../feature/search/presentation/search_screen.dart' as _i1;
import '../feature/weather/presentation/weather_screen.dart' as _i2;

class AppRouter extends _i4.RootStackRouter {
  AppRouter([_i5.GlobalKey<_i5.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    SearchScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SearchScreen(),
      );
    },
    WeatherScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.WeatherScreen(),
      );
    },
    CurrentLocationScreen.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.CurrentLocationScreen(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          SearchScreen.name,
          path: '/',
        ),
        _i4.RouteConfig(
          WeatherScreen.name,
          path: '/weather_screen',
        ),
        _i4.RouteConfig(
          CurrentLocationScreen.name,
          path: '/current_location_screen',
        ),
      ];
}

/// generated route for
/// [_i1.SearchScreen]
class SearchScreen extends _i4.PageRouteInfo<void> {
  const SearchScreen()
      : super(
          SearchScreen.name,
          path: '/',
        );

  static const String name = 'SearchScreen';
}

/// generated route for
/// [_i2.WeatherScreen]
class WeatherScreen extends _i4.PageRouteInfo<void> {
  const WeatherScreen()
      : super(
          WeatherScreen.name,
          path: '/weather_screen',
        );

  static const String name = 'WeatherScreen';
}

/// generated route for
/// [_i3.CurrentLocationScreen]
class CurrentLocationScreen extends _i4.PageRouteInfo<void> {
  const CurrentLocationScreen()
      : super(
          CurrentLocationScreen.name,
          path: '/current_location_screen',
        );

  static const String name = 'CurrentLocationScreen';
}
