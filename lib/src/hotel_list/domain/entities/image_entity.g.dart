// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ImageEntity _$ImageEntityFromJson(Map<String, dynamic> json) => ImageEntity(
      image: json['image'] as String?,
      id: json['id'] as String?,
      hotelId: json['hotelId'] as String?,
      roomId: json['roomId'] as String?,
    );

Map<String, dynamic> _$ImageEntityToJson(ImageEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hotelId': instance.hotelId,
      'roomId': instance.roomId,
      'image': instance.image,
    };
