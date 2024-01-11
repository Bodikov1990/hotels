import 'package:hotels/core/utils/typedef.dart';
import 'package:hotels/src/hotel_list/data/models/hotel_model.dart';

abstract class HotelRepository {
  ResultFuture<List<HotelModel>> getHotels();
}
