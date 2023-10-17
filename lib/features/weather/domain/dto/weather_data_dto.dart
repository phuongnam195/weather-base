import 'package:weather_base/core/constants/enums.dart';
import 'package:weather_base/features/weather/data/models/response/weather_data_response_model.dart';
import 'package:weather_base/features/weather/domain/dto/daily_weather_dto.dart';
import 'package:weather_base/features/weather/domain/dto/hourly_weather_dto.dart';

import 'weather_dto.dart';

class WeatherDataDto {
  final TemperatureUnit temperatureUnit;
  final WeatherDto current;
  final List<HourlyWeatherDto> hourlyData;
  final List<DailyWeatherDto> dailyData;

  const WeatherDataDto({
    required this.temperatureUnit,
    required this.current,
    required this.hourlyData,
    required this.dailyData,
  });

  factory WeatherDataDto.fromModel(WeatherDataResponseModel model) {
    return WeatherDataDto(
      temperatureUnit: model.currentUnits?.temperature2m == '°F' ? TemperatureUnit.fahrenheit : TemperatureUnit.celsius,
      current: WeatherDto(
        condition: WeatherCondition.fromWeatherCode(model.current?.weatherCode ?? 0),
        temperature: model.current?.temperature2m ?? 0,
        rain: model.current?.rain ?? 0,
        humidity: model.current?.relativeHumidity2m ?? 0,
        wind: model.current?.windSpeed10m ?? 0,
      ),
      hourlyData: HourlyWeatherDto.fromModel(model.hourly!),
      dailyData: DailyWeatherDto.fromModel(model.daily!),

    );
  }


}

