// ignore_for_file: constant_identifier_names
import 'package:dio/dio.dart';

import 'package:get_it/get_it.dart';

final getIt = GetIt.instance;

String _baseUrl() {
  return 'https://mocki.io';
}

void init() async {
  // Register Dio
  final Dio dio = Dio(BaseOptions(baseUrl: _baseUrl()));

  // Add an interceptor to print out request URL
  dio.interceptors.add(InterceptorsWrapper(
    onRequest: (options, handler) {
      print('Sending request to ${options.baseUrl}${options.path}');
      return handler.next(options); // Continue with the request
    },
  ));

  getIt.registerLazySingleton<Dio>(() => dio);
}
