import 'package:get_it/get_it.dart';
import 'package:hotels/router/auto_routes.dart';

final getIt = GetIt.instance;

void init() {
  getIt.registerLazySingleton<AppRouter>(
    () => AppRouter(),
  );
}
