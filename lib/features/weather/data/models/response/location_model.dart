import 'package:json_annotation/json_annotation.dart';

part 'location_model.g.dart';

@JsonSerializable(createToJson: false)
class LocationModel {
  final int? id;
  final String? name;
  final double? latitude;
  final double? longitude;
  final double? elevation;
  @JsonKey(name: 'feature_code')
  final String? featureCode;
  @JsonKey(name: 'country_code')
  final String? countryCode;
  @JsonKey(name: 'admin1_id')
  final int? admin1Id;
  final String? timezone;
  @JsonKey(name: 'country_id')
  final int? countryId;
  final String? country;
  final String? admin1;

  const LocationModel({
    this.id,
    this.name,
    this.latitude,
    this.longitude,
    this.elevation,
    this.featureCode,
    this.countryCode,
    this.admin1Id,
    this.timezone,
    this.countryId,
    this.country,
    this.admin1,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) => _$LocationModelFromJson(json);
}