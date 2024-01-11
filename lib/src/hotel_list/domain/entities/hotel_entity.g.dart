// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelEntity _$HotelEntityFromJson(Map<String, dynamic> json) => HotelEntity(
      id: json['id'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      category: json['category'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      cityFrom: json['cityFrom'] as String?,
      cityTo: json['cityTo'] as String?,
      dateFrom: json['dateFrom'] as String?,
      dateTo: json['dateTo'] as String?,
      images: (json['images'] as List<dynamic>?)
          ?.map((e) => ImageEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      features: (json['features'] as List<dynamic>?)
          ?.map((e) => FeatureEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
      rooms: (json['rooms'] as List<dynamic>?)
          ?.map((e) => RoomEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$HotelEntityToJson(HotelEntity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'address': instance.address,
      'category': instance.category,
      'price': instance.price,
      'cityFrom': instance.cityFrom,
      'cityTo': instance.cityTo,
      'dateFrom': instance.dateFrom,
      'dateTo': instance.dateTo,
      'images': instance.images,
      'features': instance.features,
      'rooms': instance.rooms,
    };
