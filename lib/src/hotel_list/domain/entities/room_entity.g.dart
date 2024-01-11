// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomEntity _$RoomEntityFromJson(Map<String, dynamic> json) => RoomEntity(
      id: json['id'] as String?,
      hotelId: json['hotelId'] as String?,
      name: json['name'] as String?,
      mainFeature: json['mainFeature'] as String?,
    );

Map<String, dynamic> _$RoomEntityToJson(RoomEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hotelId': instance.hotelId,
      'name': instance.name,
      'mainFeature': instance.mainFeature,
    };
