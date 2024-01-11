// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:hotels/src/hotel_list/domain/entities/feature_entity.dart';
import 'package:hotels/src/hotel_list/domain/entities/room_entity.dart';
import 'package:json_annotation/json_annotation.dart';

part 'hotel_entity.g.dart';

@JsonSerializable()
class HotelEntity extends Equatable {
  final String? id;
  final String? name;
  final String? address;
  final String? description;
  final String? category;
  final String? price;
  @JsonKey(name: 'city_from')
  final String? cityFrom;
  @JsonKey(name: 'city_to')
  final String? cityTo;
  @JsonKey(name: 'date_from')
  final String? dateFrom;
  @JsonKey(name: 'date_to')
  final String? dateTo;
  final List<String>? images;
  final List<FeatureEntity>? features;
  final List<RoomEntity>? rooms;

  const HotelEntity({
    this.id,
    this.name,
    this.address,
    this.description,
    this.category,
    this.price,
    this.cityFrom,
    this.cityTo,
    this.dateFrom,
    this.dateTo,
    this.images,
    this.features,
    this.rooms,
  });

  @override
  List<Object?> get props => [
        id,
        name,
        address,
        category,
        price,
        cityFrom,
        cityTo,
        dateFrom,
        dateTo,
        images,
        features,
        rooms
      ];

  factory HotelEntity.fromJson(Map<String, dynamic> json) =>
      _$HotelEntityFromJson(json);

  Map<String, dynamic> toJson() => _$HotelEntityToJson(this);
}
