import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_base/core/base/failures.dart';
import 'package:weather_base/features/weather/data/models/response/weather_data_response_model.dart';
import 'package:weather_base/features/weather/domain/repositories/weather_repo.dart';

import '../datasources/weather_remote_data_source.dart';
import '../models/request/weather_request_model.dart';

@LazySingleton(as: WeatherRepo)
class WeatherRepoRepoImpl extends WeatherRepo {
  final WeatherRemoteDataSource datasource;

  WeatherRepoRepoImpl(this.datasource);

  @override
  Future<Either<Failure, WeatherDataResponseModel>> getWeatherData(WeatherRequestModel params) {
    return handleServerErrors(
      datasourceResponse: datasource.getWeatherData(params),
    );
  }
}
