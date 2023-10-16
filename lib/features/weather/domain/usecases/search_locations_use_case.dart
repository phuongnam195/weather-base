import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_base/core/base/failures.dart';
import 'package:weather_base/core/base/usecase.dart';
import 'package:weather_base/features/weather/data/models/locations_response_model.dart';

import '../dto/location_dto.dart';
import '../repositories/location_repo.dart';

@lazySingleton
class SearchLocationsUseCase extends EitherUseCase<List<LocationDto>, String> {
  final LocationRepo repo;

  SearchLocationsUseCase(this.repo);

  @override
  Future<Either<Failure, List<LocationDto>>> call(String param) {
    return handleRepoResult(
      repoResult: repo.searchLocations(param),
      onSuccess: (LocationsResponseModel model) async {
        return model.results?.map((e) => LocationDto.fromModel(e)).toList() ?? [];
      },
    );
  }
}
