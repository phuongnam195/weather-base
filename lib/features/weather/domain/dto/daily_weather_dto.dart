import 'package:weather_base/core/constants/enums.dart';
import 'package:weather_base/features/weather/data/models/response/weather_data_response_model.dart';

class DailyWeatherDto {
  final DateTime date;
  final double maxTemperature;
  final double minTemperature;
  final WeatherCondition condition;

  const DailyWeatherDto({
    required this.date,
    required this.maxTemperature,
    required this.minTemperature,
    required this.condition,
  });

  static List<DailyWeatherDto> fromModel(WeatherDataDaily model) {
    final result = <DailyWeatherDto>[];
    for (int i = 0; i < (model.time?.length ?? 0); i++) {
      final datetime = DateTime.parse(model.time![i]);
      final maxTemp = model.temperature2mMax?[i] ?? 0;
      final minTemp = model.temperature2mMin?[i] ?? 0;
      final condition = WeatherCondition.fromWeatherCode(model.weatherCode?[i] ?? 0);
      result.add(DailyWeatherDto(
        date: datetime,
        maxTemperature: maxTemp,
        minTemperature: minTemp,
        condition: condition,
      ));
    }
    return result;
  }
}
