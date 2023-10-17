// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'weather_data_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WeatherDataResponseModel _$WeatherDataResponseModelFromJson(
        Map<String, dynamic> json) =>
    WeatherDataResponseModel(
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      generationTimeMs: (json['generationtime_ms'] as num?)?.toDouble(),
      utcOffsetSeconds: json['utc_offset_seconds'] as int?,
      timezone: json['timezone'] as String?,
      timezoneAbbreviation: json['timezone_abbreviation'] as String?,
      elevation: (json['elevation'] as num?)?.toDouble(),
      currentUnits: json['current_units'] == null
          ? null
          : WeatherDataCurrentUnits.fromJson(
              json['current_units'] as Map<String, dynamic>),
      current: json['current'] == null
          ? null
          : WeatherDataCurrent.fromJson(
              json['current'] as Map<String, dynamic>),
      hourlyUnits: json['hourly_units'] == null
          ? null
          : WeatherDataHourlyUnits.fromJson(
              json['hourly_units'] as Map<String, dynamic>),
      hourly: json['hourly'] == null
          ? null
          : WeatherDataHourly.fromJson(json['hourly'] as Map<String, dynamic>),
      dailyUnits: json['daily_units'] == null
          ? null
          : WeatherDataDailyUnits.fromJson(
              json['daily_units'] as Map<String, dynamic>),
      daily: json['daily'] == null
          ? null
          : WeatherDataDaily.fromJson(json['daily'] as Map<String, dynamic>),
    );

WeatherDataCurrentUnits _$WeatherDataCurrentUnitsFromJson(
        Map<String, dynamic> json) =>
    WeatherDataCurrentUnits(
      time: json['time'] as String?,
      interval: json['interval'] as String?,
      temperature2m: json['temperature_2m'] as String?,
      relativeHumidity2m: json['relativehumidity_2m'] as String?,
      precipitation: json['precipitation'] as String?,
      rain: json['rain'] as String?,
      weatherCode: json['weathercode'] as String?,
      windSpeed10m: json['windspeed_10m'] as String?,
    );

WeatherDataCurrent _$WeatherDataCurrentFromJson(Map<String, dynamic> json) =>
    WeatherDataCurrent(
      time: json['time'] as String?,
      interval: json['interval'] as int?,
      temperature2m: (json['temperature_2m'] as num?)?.toDouble(),
      relativeHumidity2m: (json['relativehumidity_2m'] as num?)?.toDouble(),
      precipitation: (json['precipitation'] as num?)?.toDouble(),
      rain: (json['rain'] as num?)?.toDouble(),
      weatherCode: json['weathercode'] as int?,
      windSpeed10m: (json['windspeed_10m'] as num?)?.toDouble(),
    );

WeatherDataHourlyUnits _$WeatherDataHourlyUnitsFromJson(
        Map<String, dynamic> json) =>
    WeatherDataHourlyUnits(
      time: json['time'] as String?,
      temperature2m: json['temperature_2m'] as String?,
    );

WeatherDataHourly _$WeatherDataHourlyFromJson(Map<String, dynamic> json) =>
    WeatherDataHourly(
      time: (json['time'] as List<dynamic>?)?.map((e) => e as String).toList(),
      temperature2m: (json['temperature_2m'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      isDay: (json['is_day'] as List<dynamic>?)?.map((e) => e as int).toList(),
    );

WeatherDataDailyUnits _$WeatherDataDailyUnitsFromJson(
        Map<String, dynamic> json) =>
    WeatherDataDailyUnits(
      time: json['time'] as String?,
      temperature2mMax: json['temperature_2m_max'] as String?,
      temperature2mMin: json['temperature_2m_min'] as String?,
    );

WeatherDataDaily _$WeatherDataDailyFromJson(Map<String, dynamic> json) =>
    WeatherDataDaily(
      time: (json['time'] as List<dynamic>?)?.map((e) => e as String).toList(),
      temperature2mMax: (json['temperature_2m_max'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      temperature2mMin: (json['temperature_2m_min'] as List<dynamic>?)
          ?.map((e) => (e as num).toDouble())
          .toList(),
      weatherCode: (json['weathercode'] as List<dynamic>?)
          ?.map((e) => e as int)
          .toList(),
    );
