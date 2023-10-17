part of 'weather_bloc.dart';

abstract class WeatherEvent extends BaseEvent {}

class OnSearchLocations extends WeatherEvent {
  final String keyword;

  OnSearchLocations(this.keyword);

  @override
  List<Object?> get props => [keyword];
}

class OnSelectLocation extends WeatherEvent {
  final LocationDto location;

  OnSelectLocation(this.location);

  @override
  List<Object?> get props => [location];
}

class OnFetchWeatherData extends WeatherEvent {
  final LocationDto location;

  OnFetchWeatherData(this.location);

  @override
  List<Object?> get props => [location];
}