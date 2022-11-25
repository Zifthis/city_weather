import 'package:city_weather/feature/geolocator/geo_permissions.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:geolocator/geolocator.dart';

final getCurrentLocationProvider = Provider<Future<List>>(
  (ref) async {
    Position pos = await determinePosition();
    final latAndLon = [pos.latitude, pos.longitude];
    return latAndLon;
  },
);
