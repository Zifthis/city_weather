import 'package:city_weather/feature/search/data/models/search_response.dart';
import 'package:city_weather/feature/weather/data/models/weather_response.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(Dio dio, {String baseUrl}) = _ApiClient;

  @GET("/forecast.json")
  Future<WeatherResponse> getCityWeather(
    @Query('q') String cityName,
  );

  @GET("/search.json")
  Future<List<SearchResponse>> getSearchResults(
    @Query('q') String search,
  );
}
