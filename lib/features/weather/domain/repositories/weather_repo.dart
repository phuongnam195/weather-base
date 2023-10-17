import 'package:dartz/dartz.dart';
import 'package:weather_base/core/base/base_repository.dart';
import 'package:weather_base/core/base/failures.dart';
import 'package:weather_base/features/weather/data/models/request/weather_request_model.dart';
import 'package:weather_base/features/weather/data/models/response/weather_data_response_model.dart';

abstract class WeatherRepo extends BaseRepo {
  Future<Either<Failure, WeatherDataResponseModel>> getWeatherData(WeatherRequestModel params);
}