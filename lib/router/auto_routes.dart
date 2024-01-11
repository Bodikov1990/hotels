import 'package:auto_route/auto_route.dart';
import 'package:hotels/src/hotels_page/presentation/views/hotels_page.dart';

part 'auto_routes.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: HotelsRoute.page, path: '/'),
      ];
}
