import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hotels/router/auto_routes.dart';
import 'package:hotels/injections/di.dart' as di;
import 'package:hotels/theme/app_theme.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(const HotelsApp());
}

class HotelsApp extends StatefulWidget {
  const HotelsApp({super.key});

  @override
  State<HotelsApp> createState() => _HotelsAppState();
}

class _HotelsAppState extends State<HotelsApp> {
  final _appRouter = GetIt.instance<AppRouter>();
  @override
  Widget build(BuildContext context) {
    return Builder(builder: (context) {
      return MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig: _appRouter.config(),
        theme: AppTheme.lightTheme,
      );
    });
  }
}
