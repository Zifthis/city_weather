import 'package:city_weather/common/domain/error_handling/either_failure_or.dart';
import 'package:city_weather/feature/search/data/models/search_response.dart';

abstract class ISearchRepository {
  EitherAppFailureOr<List<SearchResponse>> fetchSearchResponse(String search);
}
