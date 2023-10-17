import 'package:json_annotation/json_annotation.dart';

import 'location_model.dart';

part 'locations_response_model.g.dart';

@JsonSerializable(createToJson: false)
class LocationsResponseModel {
  final List<LocationModel>? results;
  final double? generationtimeMs;

  const LocationsResponseModel(this.results, this.generationtimeMs);

  factory LocationsResponseModel.fromJson(Map<String, dynamic> json) => _$LocationsResponseModelFromJson(json);
}