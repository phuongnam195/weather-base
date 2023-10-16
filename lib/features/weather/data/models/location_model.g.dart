// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationModel _$LocationModelFromJson(Map<String, dynamic> json) =>
    LocationModel(
      id: json['id'] as int?,
      name: json['name'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      elevation: (json['elevation'] as num?)?.toDouble(),
      featureCode: json['feature_code'] as String?,
      countryCode: json['country_code'] as String?,
      admin1Id: json['admin1_id'] as int?,
      timezone: json['timezone'] as String?,
      countryId: json['country_id'] as int?,
      country: json['country'] as String?,
      admin1: json['admin1'] as String?,
    );
