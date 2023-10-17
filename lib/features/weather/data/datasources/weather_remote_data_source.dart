import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_base/features/weather/data/models/request/weather_request_model.dart';

import '../models/response/weather_data_response_model.dart';

part 'weather_remote_data_source.g.dart';

@module
abstract class WeatherRemoteDataSourceProvider {
  @singleton
  WeatherRemoteDataSource provide(Dio dio) => _WeatherRemoteDataSource(dio);
}

@RestApi()
abstract class WeatherRemoteDataSource {
  @GET('https://api.open-meteo.com/v1/forecast')
  Future<WeatherDataResponseModel> getWeatherData(@Queries() WeatherRequestModel params);
}