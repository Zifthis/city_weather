import 'package:city_weather/common/data/api_client/api_client.dart';
import 'package:city_weather/common/data/provider.dart';
import 'package:city_weather/common/domain/error_handling/app_failure.dart';
import 'package:city_weather/feature/search/data/models/search_response.dart';
import 'package:city_weather/common/domain/error_handling/either_failure_or.dart';
import 'package:city_weather/feature/search/data/repository/i_search_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final searchRepositoryProvider = Provider<ISearchRepository>(
  (ref) => SearchRepository(
    ref.read(apiClientProvider),
  ),
);

class SearchRepository implements ISearchRepository {
  final ApiClient _apiClient;

  SearchRepository(this._apiClient);

  @override
  EitherAppFailureOr<List<SearchResponse>> fetchSearchResponse(
      String search) async {
    try {
      final response = await _apiClient.getSearchResults(search);
      return Right(response);
    } catch (err) {
      return Left(Failure.serverError.toAppFailure);
    }
  }
}
