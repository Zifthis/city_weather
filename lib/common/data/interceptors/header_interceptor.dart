import 'package:dio/dio.dart';

class HeaderInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['X-RapidAPI-Key'] =
        'ef06280094mshb395136875b8c88p1adb62jsnc4b985f0169e';
    return super.onRequest(options, handler);
  }
}
