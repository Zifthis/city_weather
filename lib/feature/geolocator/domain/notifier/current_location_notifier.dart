import 'package:city_weather/common/data/repository/city_weather_repository.dart';
import 'package:city_weather/common/data/repository/i_city_weather_repository.dart';
import 'package:city_weather/feature/geolocator/domain/notifier/current_location_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final currentLocationWeatherNotifierProvider =
    StateNotifierProvider<CurrentLocationNotifier, CurrentLocationState>(
  (ref) => CurrentLocationNotifier(
    ref.read(cityWeatherRepositoryProvider),
  ),
);

class CurrentLocationNotifier extends StateNotifier<CurrentLocationState> {
  final ICityWeatherRepository _repository;

  CurrentLocationNotifier(
    this._repository,
  ) : super(const CurrentLocationState.initial());

  Future<void> getCurrentLocationWeather(List<double> current) async {
    state = const CurrentLocationState.loading();
    final response = await _repository.fetchCurrentLocationWeather(current);

    state = await response.fold(
      (error) => CurrentLocationState.error(error),
      (data) => CurrentLocationState.loaded(data),
    );
  }
}
