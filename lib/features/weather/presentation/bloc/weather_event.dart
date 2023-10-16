part of 'weather_bloc.dart';

abstract class WeatherEvent {}

class OnSearchLocations extends WeatherEvent {
  final String param;

  OnSearchLocations(this.param);
}