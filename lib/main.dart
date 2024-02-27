import 'package:flutter/material.dart';
import 'package:nexaya/app/app.locator.dart';
import 'package:nexaya/app/app.router.dart';
import 'package:stacked_services/stacked_services.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocator();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: StackedRouter().onGenerateRoute,
      navigatorKey: StackedService.navigatorKey,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xff51024E),
      ),
      navigatorObservers: [
        StackedService.routeObserver,
      ],
    );
  }
}
