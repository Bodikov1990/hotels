import 'package:dartz/dartz.dart';
import 'package:get_it/get_it.dart';
import 'package:hotels/core/errors/exeptions.dart';
import 'package:hotels/core/errors/failure.dart';
import 'package:hotels/core/utils/typedef.dart';

import 'package:hotels/src/hotels_page/data/datasource/hotels_remote_datasource.dart';
import 'package:hotels/src/hotels_page/data/models/hotel_model.dart';
import 'package:hotels/src/hotels_page/repository/hotel_repository.dart';

class HotelRepositoryImpl implements HotelRepository {
  final HotelsRemoteDataSource _dataSource =
      GetIt.instance<HotelsRemoteDataSource>();

  @override
  ResultFuture<List<HotelModel>> getHotels() async {
    try {
      final result = await _dataSource.getHotels();

      return Right(result
          .map((hotel) => HotelModel(
              id: hotel.id,
              name: hotel.name,
              address: hotel.address,
              description: hotel.description,
              category: hotel.category,
              price: hotel.price,
              cityFrom: hotel.cityFrom,
              cityTo: hotel.cityTo,
              dateFrom: hotel.dateFrom,
              dateTo: hotel.dateTo,
              images: hotel.images,
              features: hotel.features,
              rooms: hotel.rooms))
          .toList());
    } on APIExeption catch (e) {
      return Left(APIFailure.fromExeption(e));
    }
  }
}
