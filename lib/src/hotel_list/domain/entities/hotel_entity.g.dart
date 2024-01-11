// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'hotel_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HotelEntity _$HotelEntityFromJson(Map<String, dynamic> json) => HotelEntity(
      id: json['id'] as String?,
      name: json['name'] as String?,
      address: json['address'] as String?,
      description: json['description'] as String?,
      category: json['category'] as String?,
      price: json['price'] as String?,
      cityFrom: json['city_from'] as String?,
      cityTo: json['city_to'] as String?,
      dateFrom: json['date_from'] as String?,
      dateTo: json['date_to'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
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
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
      'city_from': instance.cityFrom,
      'city_to': instance.cityTo,
      'date_from': instance.dateFrom,
      'date_to': instance.dateTo,
      'images': instance.images,
      'features': instance.features,
      'rooms': instance.rooms,
    };
