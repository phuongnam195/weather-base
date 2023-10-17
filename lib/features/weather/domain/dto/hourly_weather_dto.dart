import 'package:weather_base/features/weather/data/models/response/weather_data_response_model.dart';

class HourlyWeatherDto {
  final DateTime time;
  final double temperature;
  final bool isDay;

  const HourlyWeatherDto({
    required this.time,
    required this.temperature,
    required this.isDay,
  });

  static List<HourlyWeatherDto> fromModel(WeatherDataHourly model) {
    final result = <HourlyWeatherDto>[];
    for (int i = 0; i < (model.time?.length ?? 0); i++) {
      final datetime = DateTime.parse(model.time![i]);
      final temp = model.temperature2m?[i] ?? 0;
      final isDay = model.isDay?[i] != 0;
      result.add(HourlyWeatherDto(
        time: datetime,
        temperature: temp,
        isDay: isDay,
      ));
    }
    return result;
  }
}
