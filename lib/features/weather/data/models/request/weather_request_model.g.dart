// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_request_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherRequestModel _$WeatherRequestModelFromJson(Map<String, dynamic> json) =>
    WeatherRequestModel(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      currentVariables: json['current'] as String?,
      hourlyVariables: json['hourly'] as String?,
      dailyVariables: json['daily'] as String?,
      timezone: json['timezone'] as String? ?? 'auto',
      forecastDays: json['forecast_days'] as int? ?? 1,
    );

Map<String, dynamic> _$WeatherRequestModelToJson(
        WeatherRequestModel instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'current': instance.currentVariables,
      'hourly': instance.hourlyVariables,
      'daily': instance.dailyVariables,
      'timezone': instance.timezone,
      'forecast_days': instance.forecastDays,
    };
