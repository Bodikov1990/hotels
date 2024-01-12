// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomEntity _$RoomEntityFromJson(Map<String, dynamic> json) => RoomEntity(
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
      id: json['id'] as String?,
      hotelId: json['hotel_id'] as String?,
      name: json['name'] as String?,
      price: json['price'] as String?,
      count: json['count'] as String?,
      fuelPrice: json['fuel_price'] as String?,
      servicePrice: json['service_price'] as String?,
      mainFeature: json['main_feature'] as String?,
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$RoomEntityToJson(RoomEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'hotel_id': instance.hotelId,
      'name': instance.name,
      'main_feature': instance.mainFeature,
      'price': instance.price,
      'count': instance.count,
      'fuel_price': instance.fuelPrice,
      'service_price': instance.servicePrice,
      'images': instance.images,
      'features': instance.features,
    };
