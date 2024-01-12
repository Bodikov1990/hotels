// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'auto_routes.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    BookingRoute.name: (routeData) {
      final args = routeData.argsAs<BookingRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: BookingPage(
          key: args.key,
          hotel: args.hotel,
          room: args.room,
        ),
      );
    },
    HotelsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HotelsPage(),
      );
    },
    PaymentRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const PaymentPage(),
      );
    },
    RoomRoute.name: (routeData) {
      final args = routeData.argsAs<RoomRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: RoomPage(
          key: args.key,
          hotel: args.hotel,
        ),
      );
    },
  };
}

/// generated route for
/// [BookingPage]
class BookingRoute extends PageRouteInfo<BookingRouteArgs> {
  BookingRoute({
    Key? key,
    required HotelModel hotel,
    required RoomModel room,
    List<PageRouteInfo>? children,
  }) : super(
          BookingRoute.name,
          args: BookingRouteArgs(
            key: key,
            hotel: hotel,
            room: room,
          ),
          initialChildren: children,
        );

  static const String name = 'BookingRoute';

  static const PageInfo<BookingRouteArgs> page =
      PageInfo<BookingRouteArgs>(name);
}

class BookingRouteArgs {
  const BookingRouteArgs({
    this.key,
    required this.hotel,
    required this.room,
  });

  final Key? key;

  final HotelModel hotel;

  final RoomModel room;

  @override
  String toString() {
    return 'BookingRouteArgs{key: $key, hotel: $hotel, room: $room}';
  }
}

/// generated route for
/// [HotelsPage]
class HotelsRoute extends PageRouteInfo<void> {
  const HotelsRoute({List<PageRouteInfo>? children})
      : super(
          HotelsRoute.name,
          initialChildren: children,
        );

  static const String name = 'HotelsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [PaymentPage]
class PaymentRoute extends PageRouteInfo<void> {
  const PaymentRoute({List<PageRouteInfo>? children})
      : super(
          PaymentRoute.name,
          initialChildren: children,
        );

  static const String name = 'PaymentRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [RoomPage]
class RoomRoute extends PageRouteInfo<RoomRouteArgs> {
  RoomRoute({
    Key? key,
    required HotelModel hotel,
    List<PageRouteInfo>? children,
  }) : super(
          RoomRoute.name,
          args: RoomRouteArgs(
            key: key,
            hotel: hotel,
          ),
          initialChildren: children,
        );

  static const String name = 'RoomRoute';

  static const PageInfo<RoomRouteArgs> page = PageInfo<RoomRouteArgs>(name);
}

class RoomRouteArgs {
  const RoomRouteArgs({
    this.key,
    required this.hotel,
  });

  final Key? key;

  final HotelModel hotel;

  @override
  String toString() {
    return 'RoomRouteArgs{key: $key, hotel: $hotel}';
  }
}
