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
    SearchRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i1.SearchScreen(),
      );
    },
    WeatherRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i2.WeatherScreen(),
      );
    },
    CurrentLocationRoute.name: (routeData) {
      return _i4.MaterialPageX<dynamic>(
        routeData: routeData,
        child: const _i3.CurrentLocationScreen(),
      );
    },
  };

  @override
  List<_i4.RouteConfig> get routes => [
        _i4.RouteConfig(
          SearchRoute.name,
          path: '/',
        ),
        _i4.RouteConfig(
          WeatherRoute.name,
          path: '/weather_screen',
        ),
        _i4.RouteConfig(
          CurrentLocationRoute.name,
          path: '/current_location_screen',
        ),
      ];
}

/// generated route for
/// [_i1.SearchScreen]
class SearchRoute extends _i4.PageRouteInfo<void> {
  const SearchRoute()
      : super(
          SearchRoute.name,
          path: '/',
        );

  static const String name = 'SearchRoute';
}

/// generated route for
/// [_i2.WeatherScreen]
class WeatherRoute extends _i4.PageRouteInfo<void> {
  const WeatherRoute()
      : super(
          WeatherRoute.name,
          path: '/weather_screen',
        );

  static const String name = 'WeatherRoute';
}

/// generated route for
/// [_i3.CurrentLocationScreen]
class CurrentLocationRoute extends _i4.PageRouteInfo<void> {
  const CurrentLocationRoute()
      : super(
          CurrentLocationRoute.name,
          path: '/current_location_screen',
        );

  static const String name = 'CurrentLocationRoute';
}
