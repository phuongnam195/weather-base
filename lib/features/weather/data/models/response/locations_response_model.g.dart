// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'locations_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LocationsResponseModel _$LocationsResponseModelFromJson(
        Map<String, dynamic> json) =>
    LocationsResponseModel(
      (json['results'] as List<dynamic>?)
          ?.map((e) => LocationModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      (json['generationtimeMs'] as num?)?.toDouble(),
    );
