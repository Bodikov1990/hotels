import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:hotels/router/auto_routes.dart';
import 'package:hotels/injections/di.dart' as di;

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
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          scaffoldBackgroundColor: Color.fromARGB(255, 237, 237, 237),
          cardColor: Colors.white,
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue),
              foregroundColor: MaterialStateProperty.all(Colors.white),
              shape: MaterialStateProperty.all(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              minimumSize:
                  MaterialStateProperty.all(const Size(double.infinity, 48)),
            ),
          ),
        ),
      );
    });
  }
}
