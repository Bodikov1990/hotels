import 'package:hotels/src/hotels_page/domain/entities/hotel_entity.dart';

class HotelModel extends HotelEntity {
  const HotelModel(
      {required super.id,
      required super.name,
      required super.address,
      required super.description,
      required super.category,
      required super.price,
      required super.cityFrom,
      required super.cityTo,
      required super.dateFrom,
      required super.dateTo,
      required super.images,
      required super.features,
      required super.rooms});
}
