import 'package:get_it/get_it.dart';
import 'package:hotels/router/auto_routes.dart';
import 'package:hotels/src/hotels_page/data/datasource/hotels_remote_datasource.dart';
import 'package:hotels/src/hotels_page/data/repositories/hotel_repository_impl.dart';
import 'package:hotels/src/hotels_page/repository/hotel_repository.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerLazySingleton<AppRouter>(
    () => AppRouter(),
  );

  getIt.registerLazySingleton<HotelRepository>(
    () => HotelRepositoryImpl(),
  );

  getIt.registerLazySingleton<HotelsRemoteDataSource>(
    () => HotelsRemoteDataSourceImpl(),
  );
}
