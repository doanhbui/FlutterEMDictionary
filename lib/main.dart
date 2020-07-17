import 'package:flutter/material.dart';

import 'locator.dart';
import 'services/navigation_service.dart';
import 'ui/router.dart';
import 'ui/screens/home/home_view.dart';

void main() {
  setupLocator();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Dictionary',
      navigatorKey: locator<NavigationService>().navigationKey,
      home: HomeView(),
      onGenerateRoute: generateRoute,
    );
  }
}
