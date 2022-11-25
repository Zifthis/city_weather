import 'package:city_weather/common/data/repository/city_weather_repository.dart';
import 'package:city_weather/common/data/repository/i_city_weather_repository.dart';
import 'package:city_weather/feature/search/domain/notifier/search_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchNotifierProvider =
    StateNotifierProvider<SearchNotifier, SearchState>(
  (ref) => SearchNotifier(
    ref.read(cityWeatherRepositoryProvider),
  ),
);

class SearchNotifier extends StateNotifier<SearchState> {
  final ICityWeatherRepository _repository;

  SearchNotifier(
    this._repository,
  ) : super(const SearchState.initial());

  Future<void> getSearchResult(String search) async {
    state = const SearchState.loading();
    final response = await _repository.fetchSearchResponse(search);

    state = await response.fold(
      (error) => SearchState.error(error),
      (data) => SearchState.loaded(data),
    );
  }

  Future<void> setInitSearch() async {
    state = const SearchState.initial();
  }
}
