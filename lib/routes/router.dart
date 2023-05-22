import 'package:flutter/material.dart';
import 'package:todoshka/pages/enter_page.dart';
import 'package:todoshka/pages/main_page.dart';

class AppRouter {
  const AppRouter._();

  static MaterialPageRoute generateRoutes(RouteSettings settings) {
    WidgetBuilder _builder;

    switch (settings.name) {
      case EntrancePage.routeName:
        _builder = (_) => const EntrancePage();
        break;
      case MainPage.routeName:
        _builder = (_) => const MainPage();
        break;
      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(
      builder: _builder,
      settings: settings,
    );
  }
}
