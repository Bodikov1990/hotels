// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'room_entity.g.dart';

@JsonSerializable()
class RoomEntity extends Equatable {
  final String? id;
  final String? hotelId;
  final String? name;
  final String? mainFeature;

  const RoomEntity({
    this.id,
    this.hotelId,
    this.name,
    this.mainFeature,
  });

  @override
  List<Object?> get props => [id, hotelId];

  factory RoomEntity.fromJson(Map<String, dynamic> json) =>
      _$RoomEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RoomEntityToJson(this);
}
