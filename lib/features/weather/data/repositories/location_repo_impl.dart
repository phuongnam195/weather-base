import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_base/core/base/failures.dart';
import 'package:weather_base/features/weather/data/datasources/location_remote_data_source.dart';
import 'package:weather_base/features/weather/domain/repositories/location_repo.dart';

import '../models/response/locations_response_model.dart';

@LazySingleton(as: LocationRepo)
class LocationRepoRepoImpl extends LocationRepo {
  final LocationRemoteDataSource datasource;

  LocationRepoRepoImpl(this.datasource);

  @override
  Future<Either<Failure, LocationsResponseModel>> searchLocations(String param) {
    return handleServerErrors(
      datasourceResponse: datasource.searchLocations(param),
    );
  }
}
