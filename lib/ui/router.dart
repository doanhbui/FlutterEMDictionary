import 'package:emdictionary/models/definition.dart';
import 'package:emdictionary/ui/screens/definition/definition_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../constants/route_names.dart';
import 'screens/home/home_view.dart';

Route<dynamic> generateRoute(RouteSettings settings) {
  var args = settings.arguments;
  switch (settings.name) {
    case HomeViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: HomeView(),
      );
    case DefinitionViewRoute:
      return _getPageRoute(
        routeName: settings.name,
        viewToShow: DefinitionView(
          definition: args,
        ),
      );
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('No Route defined for ${settings.name}'),
          ),
        ),
      );
  }
}

PageRoute _getPageRoute({String routeName, Widget viewToShow}) {
  return MaterialPageRoute(
    settings: RouteSettings(name: routeName),
    builder: (_) => viewToShow,
  );
}
