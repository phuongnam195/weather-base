import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:weather_base/core/base/failures.dart';
import 'package:dartz/dartz.dart';

abstract class BaseRepo {
  Future<Either<Failure, T>> handleServerErrors<T>({
    required Future<T?> datasourceResponse,
  }) async {
    try {
      T? response = await datasourceResponse;
      return Right(response as T);
    } on DioException catch (e, stackTrace) {
      log('$e', stackTrace: stackTrace);
      return Left(ServerError(e.response?.data['message']));
    } catch (e, stackTrace) {
      log('$e', stackTrace: stackTrace);
      return Left(UnexpectedError());
    }
  }
}
