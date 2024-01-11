// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'feature_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FeatureEntity _$FeatureEntityFromJson(Map<String, dynamic> json) =>
    FeatureEntity(
      name: json['name'] as String?,
      id: json['id'] as String?,
      hotelId: json['hotelId'] as String?,
    );

Map<String, dynamic> _$FeatureEntityToJson(FeatureEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hotelId': instance.hotelId,
      'name': instance.name,
    };
