import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_base/core/base/failures.dart';
import 'package:weather_base/core/base/usecase.dart';
import 'package:weather_base/features/weather/data/models/request/weather_request_model.dart';
import 'package:weather_base/features/weather/data/models/response/weather_data_response_model.dart';
import 'package:weather_base/features/weather/domain/repositories/weather_repo.dart';

import '../dto/location_dto.dart';
import '../dto/weather_data_dto.dart';

@lazySingleton
class GetWeatherDataUseCase extends EitherUseCase<WeatherDataDto, LocationDto> {
  final WeatherRepo repo;

  GetWeatherDataUseCase(this.repo);

  @override
  Future<Either<Failure, WeatherDataDto>> call(LocationDto param) {
    final request = WeatherRequestModel(
      latitude: param.latitude,
      longitude: param.longitude,
      currentVariables: [
        'temperature_2m',
        'relativehumidity_2m',
        'precipitation',
        'rain',
        'weathercode',
        'windspeed_10m',
      ].join(','),
      hourlyVariables: [
        'temperature_2m',
        'is_day',
      ].join(','),
      dailyVariables: [
        'weathercode',
        'temperature_2m_max',
        'temperature_2m_min',
      ].join(','),
      forecastDays: 4,
    );

    return handleRepoResult(
      repoResult: repo.getWeatherData(request),
      onSuccess: (WeatherDataResponseModel model) async {
        return WeatherDataDto.fromModel(model);
      },
    );
  }
}
