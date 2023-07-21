import 'package:flutter/material.dart';
import 'package:todoshka/pages/create_page.dart';
import 'package:todoshka/pages/edit_page.dart';
import 'package:todoshka/pages/enter_page.dart';
import 'package:todoshka/pages/main_page.dart';

class AppRouter {
  const AppRouter._();

  static MaterialPageRoute generateRoutes(RouteSettings settings) {
   // final Object? arguments = settings.arguments;

    WidgetBuilder builder;

    switch (settings.name) {
      case EntrancePage.routeName:
        builder = (_) => const EntrancePage();
        break;
      case MainPage.routeName:
        builder = (_) => const MainPage();
        break;
      case CreatingPage.routeName:
        builder = (_) => const CreatingPage();
        break;
      case EditPage.routeName:
        builder = (_) => const EditPage();
        break;
      default:
        throw Exception('Invalid route: ${settings.name}');
    }

    return MaterialPageRoute(
      builder: builder,
      settings: settings,
    );
  }
}
