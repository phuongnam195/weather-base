import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:weather_base/core/base/base_bloc.dart';
import 'package:weather_base/core/base/failures.dart';
import 'package:weather_base/core/constants/assets.dart';
import 'package:weather_base/core/constants/enums.dart';
import 'package:weather_base/core/theme/app_colors.dart';
import 'package:weather_base/features/weather/domain/dto/hourly_weather_dto.dart';
import 'package:weather_base/features/weather/domain/dto/location_dto.dart';
import 'package:weather_base/features/weather/domain/dto/weather_data_dto.dart';
import 'package:weather_base/features/weather/domain/usecases/get_weather_data_use_case.dart';
import 'package:weather_base/features/weather/presentation/bloc/location/location_bloc.dart';

part 'weather_event.dart';
part 'weather_state.dart';

@lazySingleton
class WeatherBloc extends Bloc<WeatherEvent, BaseState> {
  final GetWeatherDataUseCase _getWeatherDataUseCase;

  WeatherBloc(
    this._getWeatherDataUseCase,
  ) : super(InitialState()) {
    on<OnFetchWeatherData>(_onFetchWeatherData);
  }

  Future<void> _onFetchWeatherData(OnFetchWeatherData event, Emitter<BaseState> emit) async {
    emit(LocationSelected(event.location));
    emit(LoadingState());

    final either = await _getWeatherDataUseCase.call(event.location);
    either.fold(
      (Failure failure) => emit(ErrorState(failure)),
      (WeatherDataDto data) {
        final condition = data.current.condition ?? WeatherCondition.sunny;
        emit(WeatherConditionState(condition));
        emit(CurrentWeatherState(
          condition: condition,
          temperature: data.current.temperature ?? 0,
          rain: data.current.rain ?? 0,
          humidity: data.current.humidity ?? 0,
          wind: data.current.wind ?? 0,
        ));

        final currentHour = DateTime.now().copyWith(minute: 0, second: 0, millisecond: 0);
        List<HourlyWeatherDto> nextHourlyWeather = [];
        for (int i = 1; i <= 4; i++) {
          final hourlyWeather = data.hourlyData.firstWhere((e) => e.time.difference(currentHour).inHours == i);
          nextHourlyWeather.add(hourlyWeather);
        }
        emit(TodayWeatherState(currentCondition: condition, nextHourlyWeather: nextHourlyWeather));
      },
    );
  }
}
