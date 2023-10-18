import 'package:dartz/dartz.dart';
import 'package:weather_base/core/base/base_repository.dart';
import 'package:weather_base/core/base/failures.dart';
import 'package:weather_base/features/weather/data/models/response/locations_response_model.dart';

abstract class LocationRepo extends BaseRepo {
  Future<Either<Failure, LocationsResponseModel>> searchLocations(String param);
}
