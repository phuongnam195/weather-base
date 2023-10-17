import 'package:json_annotation/json_annotation.dart';

part 'weather_request_model.g.dart';

@JsonSerializable()
class WeatherRequestModel {
  final double latitude;
  final double longitude;
  @JsonKey(name: 'current')
  final String? currentVariables;
  @JsonKey(name: 'hourly')
  final  String? hourlyVariables;
  @JsonKey(name: 'daily')
  final  String? dailyVariables;
  @JsonKey(name: 'timezone')
  final String? timezone;
  @JsonKey(name: 'forecast_days')
  final int? forecastDays;

  const WeatherRequestModel({
    required this.latitude,
    required this.longitude,
    this.currentVariables,
    this.hourlyVariables,
    this.dailyVariables,
    this.timezone = 'auto',
    this.forecastDays = 1,
  });

  factory WeatherRequestModel.fromJson(Map<String, dynamic> json) => _$WeatherRequestModelFromJson(json);

  Map<String, dynamic> toJson() => _$WeatherRequestModelToJson(this);
}
