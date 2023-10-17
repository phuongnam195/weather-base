import 'package:weather_base/core/constants/enums.dart';

class WeatherDto {
  final WeatherCondition? condition;
  final double? temperature;
  final double? rain;
  final double? humidity;
  final double? wind;

  const WeatherDto({
    this.condition,
    this.temperature,
    this.rain,
    this.humidity,
    this.wind,
  });
}
