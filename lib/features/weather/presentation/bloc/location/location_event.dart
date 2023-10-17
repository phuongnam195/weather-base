part of 'location_bloc.dart';

abstract class LocationEvent extends BaseEvent {}

class OnEditSearch extends LocationEvent {
  final String keyword;

  OnEditSearch(this.keyword);

  @override
  List<Object?> get props => [keyword];
}

class OnSearchLocations extends LocationEvent {
  final String keyword;

  OnSearchLocations(this.keyword);

  @override
  List<Object?> get props => [keyword];
}

class OnSelectLocation extends LocationEvent {
  final LocationDto location;

  OnSelectLocation(this.location);

  @override
  List<Object?> get props => [location];
}