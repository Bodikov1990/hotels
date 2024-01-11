import 'package:get_it/get_it.dart';

import './network.dart' as network;
import './repositories.dart' as repositories;

final getIt = GetIt.instance;

Future<void> init() async {
  repositories.init();
  network.init();
}
