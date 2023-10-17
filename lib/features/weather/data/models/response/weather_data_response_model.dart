import 'package:json_annotation/json_annotation.dart';

part 'weather_data_response_model.g.dart';

@JsonSerializable(createToJson: false)
class WeatherDataResponseModel {
  final double? latitude;
  final double? longitude;
  @JsonKey(name: 'generationtime_ms')
  final double? generationTimeMs;
  @JsonKey(name: 'utc_offset_seconds')
  final int? utcOffsetSeconds;
  final String? timezone;
  @JsonKey(name: 'timezone_abbreviation')
  final String? timezoneAbbreviation;
  final double? elevation;
  @JsonKey(name: 'current_units')
  final WeatherDataCurrentUnits? currentUnits;
  final WeatherDataCurrent? current;
  @JsonKey(name: 'hourly_units')
  final WeatherDataHourlyUnits? hourlyUnits;
  final WeatherDataHourly? hourly;
  @JsonKey(name: 'daily_units')
  final WeatherDataDailyUnits? dailyUnits;
  final WeatherDataDaily? daily;

  const WeatherDataResponseModel({
    this.latitude,
    this.longitude,
    this.generationTimeMs,
    this.utcOffsetSeconds,
    this.timezone,
    this.timezoneAbbreviation,
    this.elevation,
    this.currentUnits,
    this.current,
    this.hourlyUnits,
    this.hourly,
    this.dailyUnits,
    this.daily,
  });

  factory WeatherDataResponseModel.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataResponseModelFromJson(json);
}

@JsonSerializable(createToJson: false)
class WeatherDataCurrentUnits {
  final String? time;
  final String? interval;
  @JsonKey(name: 'temperature_2m')
  final String? temperature2m;
  @JsonKey(name: 'relativehumidity_2m')
  final String? relativeHumidity2m;
  final String? precipitation;
  final String? rain;
  @JsonKey(name: 'weathercode')
  final String? weatherCode;
  @JsonKey(name: 'windspeed_10m')
  final String? windSpeed10m;

  const WeatherDataCurrentUnits({
    this.time,
    this.interval,
    this.temperature2m,
    this.relativeHumidity2m,
    this.precipitation,
    this.rain,
    this.weatherCode,
    this.windSpeed10m,
  });

  factory WeatherDataCurrentUnits.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataCurrentUnitsFromJson(json);
}

@JsonSerializable(createToJson: false)
class WeatherDataCurrent {
  final String? time;
  final int? interval;
  @JsonKey(name: 'temperature_2m')
  final double? temperature2m;
  @JsonKey(name: 'relativehumidity_2m')
  final double? relativeHumidity2m;
  final double? precipitation;
  final double? rain;
  @JsonKey(name: 'weathercode')
  final int? weatherCode;
  @JsonKey(name: 'windspeed_10m')
  final double? windSpeed10m;

  const WeatherDataCurrent({
    this.time,
    this.interval,
    this.temperature2m,
    this.relativeHumidity2m,
    this.precipitation,
    this.rain,
    this.weatherCode,
    this.windSpeed10m,
  });

  factory WeatherDataCurrent.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataCurrentFromJson(json);
}

@JsonSerializable(createToJson: false)
class WeatherDataHourlyUnits {
  final String? time;
  @JsonKey(name: 'temperature_2m')
  final String? temperature2m;

  const WeatherDataHourlyUnits({
    this.time,
    this.temperature2m,
  });

  factory WeatherDataHourlyUnits.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataHourlyUnitsFromJson(json);
}

@JsonSerializable(createToJson: false)
class WeatherDataHourly {
  final List<String>? time;
  @JsonKey(name: 'temperature_2m')
  final List<double>? temperature2m;
  @JsonKey(name: 'is_day')
  final List<int>? isDay;

  const WeatherDataHourly({
    this.time,
    this.temperature2m,
    this.isDay,
  });

  factory WeatherDataHourly.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataHourlyFromJson(json);
}

@JsonSerializable(createToJson: false)
class WeatherDataDailyUnits {
  final String? time;
  @JsonKey(name: 'temperature_2m_max')
  final String? temperature2mMax;
  @JsonKey(name: 'temperature_2m_min')
  final String? temperature2mMin;

  const WeatherDataDailyUnits({
    this.time,
    this.temperature2mMax,
    this.temperature2mMin,
  });

  factory WeatherDataDailyUnits.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataDailyUnitsFromJson(json);
}

@JsonSerializable(createToJson: false)
class WeatherDataDaily {
  final List<String>? time;
  @JsonKey(name: 'temperature_2m_max')
  final List<double>? temperature2mMax;
  @JsonKey(name: 'temperature_2m_min')
  final List<double>? temperature2mMin;
  @JsonKey(name: 'weathercode')
  final List<int>? weatherCode;

  const WeatherDataDaily({
    this.time,
    this.temperature2mMax,
    this.temperature2mMin,
    this.weatherCode,
  });

  factory WeatherDataDaily.fromJson(Map<String, dynamic> json) =>
      _$WeatherDataDailyFromJson(json);
}