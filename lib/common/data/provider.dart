import 'package:city_weather/common/data/api_client/api_client.dart';
import 'package:city_weather/common/data/interceptors/header_interceptor.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

final apiClientProvider = Provider<ApiClient>(
  (ref) => ApiClient(ref.read(_dioProvider)),
);

final _dioProvider = _buildDioProviderWith(
  baseUrl: "https://weatherapi-com.p.rapidapi.com",
);

Provider<Dio> _buildDioProviderWith({
  required String baseUrl,
}) =>
    Provider<Dio>(
      (ref) => Dio(
        BaseOptions(baseUrl: baseUrl),
      )..interceptors.addAll(
          [
            PrettyDioLogger(requestHeader: true, requestBody: true),
            HeaderInterceptor()
          ],
        ),
    );
