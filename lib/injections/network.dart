// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

String _baseUrl() {
  return 'https://mocki.io/';
}

void init() async {
  // Register Dio
  final Dio dio = Dio(BaseOptions(baseUrl: _baseUrl()));
  getIt.registerLazySingleton<Dio>(() => dio);
}
