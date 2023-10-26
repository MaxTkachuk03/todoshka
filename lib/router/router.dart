import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:todoshka/models/models.dart';
import 'package:todoshka/pages/pages.dart';

part 'router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: CreatingRoute.page),
        AutoRoute(page: EditRoute.page),
        AutoRoute(page: EntranceRoute.page, path: '/'),
        AutoRoute(page: MainRoute.page),
      ];
}
