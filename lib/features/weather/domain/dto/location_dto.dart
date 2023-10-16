import 'package:weather_base/features/weather/data/models/location_model.dart';

class LocationDto {
  final int id;
  final String name;
  final double latitude;
  final double longitude;

  const LocationDto({
    required this.id,
    required this.name,
    required this.latitude,
    required this.longitude,
  });

  factory LocationDto.fromModel(LocationModel model) {
    return LocationDto(
      id: model.id!,
      name: model.name!,
      latitude: model.latitude!,
      longitude: model.longitude!,
    );
  }
}