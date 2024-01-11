// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_entity.g.dart';

@JsonSerializable()
class RoomEntity extends Equatable {
  final String? id;
  @JsonKey(name: 'hotel_id')
  final String? hotelId;
  final String? name;
  @JsonKey(name: 'main_feature')
  final String? mainFeature;
  final String? price;
  final String? count;
  @JsonKey(name: 'fuel_price')
  final String? fuelPrice;
  @JsonKey(name: 'service_price')
  final String? servicePrice;
  final List<String>? images;
  final List<String>? features;

  const RoomEntity(this.images,
      {this.id,
      this.hotelId,
      this.name,
      this.price,
      this.count,
      this.fuelPrice,
      this.servicePrice,
      this.mainFeature,
      this.features});

  @override
  List<Object?> get props => [id, hotelId];

  factory RoomEntity.fromJson(Map<String, dynamic> json) =>
      _$RoomEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RoomEntityToJson(this);
}
