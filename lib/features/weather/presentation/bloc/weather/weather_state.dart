part of 'weather_bloc.dart';

class WeatherConditionState extends BaseState {
  final WeatherCondition condition;

  WeatherConditionState(this.condition);

  @override
  List<Object?> get props => [condition];

  List<Color> get gradientColors {
    switch (condition) {
      case WeatherCondition.sunny:
        return [AppColors.sunnyDark, AppColors.sunny, AppColors.sunnyLight];
      case WeatherCondition.rainy:
        return [AppColors.rainyDark, AppColors.rainy, AppColors.rainyLight];
    }
  }

  String get imageAsset {
    switch (condition) {
      case WeatherCondition.sunny:
        return Assets.img.sunny;
      case WeatherCondition.rainy:
        return Assets.img.rainy;
    }
  }
}

class CurrentWeatherState extends BaseState {
  final WeatherCondition condition;
  final double temperature;
  final double rain;
  final double humidity;
  final double wind;

  CurrentWeatherState({
    required this.condition,
    required this.temperature,
    required this.rain,
    required this.humidity,
    required this.wind,
  });

  @override
  List<Object?> get props => [condition, temperature, rain, humidity, wind];
}

class TodayWeatherState extends BaseState {
  final WeatherCondition currentCondition;
  final List<HourlyWeatherDto> nextHourlyWeather;

  TodayWeatherState({
    required this.currentCondition,
    required this.nextHourlyWeather,
  });

  @override
  List<Object?> get props => [currentCondition, nextHourlyWeather];
}

class NextDaysWeatherState extends BaseState {
  final WeatherCondition currentCondition;
  final List<DailyWeatherDto> nextDaysWeather;

  NextDaysWeatherState({
    required this.currentCondition,
    required this.nextDaysWeather,
  });

  @override
  List<Object?> get props => [currentCondition, nextDaysWeather];
}
