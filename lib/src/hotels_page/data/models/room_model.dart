import 'package:hotels/src/hotels_page/domain/entities/room_entity.dart';

class RoomModel extends RoomEntity {
  const RoomModel(
      {required List<String> images,
      required String id,
      required String hotelId,
      required String name,
      required String price,
      required String count,
      required String fuelPrice,
      required String servicePrice,
      required String mainFeature,
      required List<String> features})
      : super(
            images: images,
            id: id,
            hotelId: hotelId,
            name: name,
            price: price,
            count: count,
            fuelPrice: fuelPrice,
            servicePrice: servicePrice,
            mainFeature: mainFeature,
            features: features);
}
