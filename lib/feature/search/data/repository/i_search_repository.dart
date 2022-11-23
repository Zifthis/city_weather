import 'package:city_weather/common/domain/error_handling/either_failure_or.dart';
import 'package:city_weather/feature/search/domain/entities/search.dart';

abstract class ISearchRepository {
  EitherAppFailureOr<List<Search>> fetchSearchResponse(String search);
}
