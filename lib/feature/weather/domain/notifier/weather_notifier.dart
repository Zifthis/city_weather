import 'package:city_weather/common/data/repository/city_weather_repository.dart';
import 'package:city_weather/common/data/repository/i_city_weather_repository.dart';
import 'package:city_weather/feature/weather/domain/notifier/weather_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final weatherNotifierProvider =
    StateNotifierProvider<WeatherNotifier, WeatherState>(
  (ref) => WeatherNotifier(
    ref.read(cityWeatherRepositoryProvider),
  ),
);

class WeatherNotifier extends StateNotifier<WeatherState> {
  final ICityWeatherRepository _repository;

  WeatherNotifier(
    this._repository,
  ) : super(const WeatherState.initial());

  Future<void> getCityWeather(String cityName) async {
    state = const WeatherState.loading();
    final response = await _repository.fetchWeatherResponse(cityName);

    state = await response.fold(
      (error) => WeatherState.error(error),
      (data) => WeatherState.loaded(data),
    );
  }
}
