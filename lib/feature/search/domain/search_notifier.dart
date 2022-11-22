import 'package:city_weather/feature/search/data/repository/i_search_repository.dart';
import 'package:city_weather/feature/search/data/repository/search_repository.dart';
import 'package:city_weather/feature/search/domain/search_state.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchNotifierProvider =
    StateNotifierProvider<SearchNotifier, SearchState>(
  (ref) => SearchNotifier(
    ref.read(searchRepositoryProvider),
  ),
);

class SearchNotifier extends StateNotifier<SearchState> {
  final ISearchRepository _iSearchRepository;

  SearchNotifier(
    this._iSearchRepository,
  ) : super(const SearchState.initial());

  Future<void> getSearchResult(String search) async {
    state = const SearchState.loading();
    final response = await _iSearchRepository.fetchSearchResponse(search);

    state = await response.fold(
      (error) => SearchState.error(error),
      (data) => SearchState.loaded(data),
    );
  }
}
