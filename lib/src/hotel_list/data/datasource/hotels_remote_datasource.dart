import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hotels/core/errors/exeptions.dart';
import 'package:hotels/src/hotel_list/domain/entities/hotel_entity.dart';

abstract class HotelsRemoteDataSource {
  Future<List<HotelEntity>> getHotels();
}

class HotelsRemoteDataSourceImpl implements HotelsRemoteDataSource {
  final Dio _dio = GetIt.instance<Dio>();

  @override
  Future<List<HotelEntity>> getHotels() async {
    try {
      Response response =
          await _dio.get('v1/5c30000e-852f-4035-9bf4-a2c1032d8a26');

      if (response.statusCode != 200) {
        throw APIExeption(
            message: response.statusMessage ??
                "Exception from HotelsRemoteDataSourceImpl",
            statusCode: response.statusCode ?? 0);
      }

      return (response.data as List<dynamic>)
          .map((raw) => HotelEntity.fromJson(raw))
          .toList();
    } on APIExeption {
      rethrow;
    } catch (e) {
      debugPrint("getHotels ${e.toString()} ");
      if (e is DioException) {
        debugPrint("${e.message} ${e.response?.statusMessage ?? ""}");

        throw APIExeption(
            message: e.message ?? "-------",
            statusCode: e.response?.statusCode ?? -1);
      }
      throw APIExeption(message: e.toString(), statusCode: -1);
    }
  }
}
