import 'package:city_weather/common/domain/error_handling/app_failure.dart';
import 'package:dartz/dartz.dart';

typedef EitherFailureOr<T> = Future<Either<Failure, T>>;
typedef EitherAppFailureOr<T> = Future<Either<AppFailure, T>>;
