import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:hotels/src/hotels_page/data/models/hotel_model.dart';
import 'package:hotels/src/hotels_page/presentation/views/hotels_page.dart';
import 'package:hotels/src/room_page/presentation/views/room_page.dart';

part 'auto_routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HotelsRoute.page, path: '/'),
        AutoRoute(page: RoomRoute.page),
      ];
}
