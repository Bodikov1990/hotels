import 'package:hotels/core/utils/typedef.dart';
import 'package:hotels/src/hotels_page/data/models/hotel_model.dart';

abstract class HotelRepository {
  ResultFuture<List<HotelModel>> getHotels();
}
