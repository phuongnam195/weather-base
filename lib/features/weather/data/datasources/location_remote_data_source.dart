import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:retrofit/retrofit.dart';
import 'package:weather_base/features/weather/data/models/locations_response_model.dart';

part 'location_remote_data_source.g.dart';

@module
abstract class LocationRemoteDataSourceProvider {
  @singleton
  LocationRemoteDataSource provide(Dio dio) => _LocationRemoteDataSource(dio);
}

@RestApi()
abstract class LocationRemoteDataSource {
  @GET('https://geocoding-api.open-meteo.com/v1/search')
  Future<LocationsResponseModel> searchLocations(@Query('name') String name);
}