part of 'location_bloc.dart';

class LocationSearched extends BaseState {
  final List<LocationDto> locations;

  LocationSearched(this.locations);

  @override
  List<Object?> get props => [locations];
}

class LocationSelected extends BaseState {
  final LocationDto location;

  LocationSelected(this.location);

  @override
  List<Object?> get props => [location];
}

class CurrentLocationLoaded extends BaseState {
  final LocationDto location;

  CurrentLocationLoaded(this.location);

  @override
  List<Object?> get props => [location];
}
