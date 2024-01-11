import 'package:get_it/get_it.dart';
import 'package:hotels/core/usecase/usecase.dart';
import 'package:hotels/core/utils/typedef.dart';
import 'package:hotels/src/hotel_list/data/models/hotel_model.dart';
import 'package:hotels/src/hotel_list/repository/hotel_repository.dart';

class GetHotelsUseCase extends UsecaseWithoutParams<List<HotelModel>> {
  final HotelRepository _repository = GetIt.instance<HotelRepository>();

  @override
  ResultFuture<List<HotelModel>> call() async => _repository.getHotels();
}
