import 'package:city_weather/common/data/model/error_response.dart';
import 'package:dio/dio.dart';

class AppFailure implements Exception {
  final String title;
  final String? description;

  AppFailure({
    required this.title,
    this.description = " ",
  });

  factory AppFailure.fromFailure(Failure failure) {
    return AppFailure(
      title: failure.title,
      description: failure.description,
    );
  }

  factory AppFailure.fromDioErrorResponse(DioError dioError) {
    final response = ErrorResponse.fromJson(
      dioError.response?.data as Map<String, dynamic>,
    );
    return AppFailure(
      title: response.message ?? 'Dio Error',
    );
  }
}

enum Failure {
  serverError,
}

extension FailureProperties on Failure {
  static final _title = {
    Failure.serverError: 'title',
  };
  static final _description = {
    Failure.serverError: 'description',
  };

  String get title => _title[this]!;

  String get description => _description[this]!;

  AppFailure get toAppFailure =>
      AppFailure(title: title, description: description);
}
