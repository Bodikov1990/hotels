import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'feature_entity.g.dart';

@JsonSerializable()
class FeatureEntity extends Equatable {
  final String? id;
  final String? hotelId;
  final String? name;

  const FeatureEntity({
    this.name,
    this.id,
    this.hotelId,
  });

  @override
  List<Object?> get props => [id, hotelId];

  factory FeatureEntity.fromJson(Map<String, dynamic> json) =>
      _$FeatureEntityFromJson(json);

  Map<String, dynamic> toJson() => _$FeatureEntityToJson(this);
}
