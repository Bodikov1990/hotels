// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

String _baseUrl() {
  return 'https://659ec78d47ae28b0bd36ade2.mockapi.io/api/booking_hotel/hotels';
}

void init() async {
  // Register Dio
  final Dio dio = Dio(BaseOptions(baseUrl: _baseUrl()));
  getIt.registerLazySingleton<Dio>(() => dio);
}
