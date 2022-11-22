import 'package:city_weather/feature/weather/data/repository/i_weather_repository.dart';
import 'package:city_weather/feature/weather/data/repository/weather_repository.dart';
import 'package:city_weather/feature/weather/domain/weather_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final weatherNotifierProvider =
    StateNotifierProvider<WeatherNotifier, WeatherState>(
  (ref) => WeatherNotifier(
    ref.read(weatherRepositoryProvider),
  ),
);

class WeatherNotifier extends StateNotifier<WeatherState> {
  final IWeatherRepository _iWeatherRepository;

  WeatherNotifier(
    this._iWeatherRepository,
  ) : super(const WeatherState.initial());

  Future<void> getCityWeather(String cityName) async {
    state = const WeatherState.loading();
    final response = await _iWeatherRepository.fetchWeatherResponse(cityName);

    state = await response.fold(
      (l) => WeatherState.error(l),
      (r) => WeatherState.loaded(r),
    );
  }
}
