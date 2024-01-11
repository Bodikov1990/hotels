// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'image_entity.g.dart';

@JsonSerializable()
class ImageEntity extends Equatable {
  final String? id;
  final String? hotelId;
  final String? roomId;
  final String? image;
  const ImageEntity({this.image, this.id, this.hotelId, this.roomId});

  @override
  List<Object?> get props => [id];

  factory ImageEntity.fromJson(Map<String, dynamic> json) =>
      _$ImageEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ImageEntityToJson(this);
}
