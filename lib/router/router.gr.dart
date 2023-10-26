// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CreatingRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CreatingPage(),
      );
    },
    EditRoute.name: (routeData) {
      final args = routeData.argsAs<EditRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EditPage(
          key: args.key,
          tasks: args.tasks,
        ),
      );
    },
    EntranceRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EntrancePage(),
      );
    },
    MainRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const MainPage(),
      );
    },
  };
}

/// generated route for
/// [CreatingPage]
class CreatingRoute extends PageRouteInfo<void> {
  const CreatingRoute({List<PageRouteInfo>? children})
      : super(
          CreatingRoute.name,
          initialChildren: children,
        );

  static const String name = 'CreatingRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EditPage]
class EditRoute extends PageRouteInfo<EditRouteArgs> {
  EditRoute({
    Key? key,
    required Tasks tasks,
    List<PageRouteInfo>? children,
  }) : super(
          EditRoute.name,
          args: EditRouteArgs(
            key: key,
            tasks: tasks,
          ),
          initialChildren: children,
        );

  static const String name = 'EditRoute';

  static const PageInfo<EditRouteArgs> page = PageInfo<EditRouteArgs>(name);
}

class EditRouteArgs {
  const EditRouteArgs({
    this.key,
    required this.tasks,
  });

  final Key? key;

  final Tasks tasks;

  @override
  String toString() {
    return 'EditRouteArgs{key: $key, tasks: $tasks}';
  }
}

/// generated route for
/// [EntrancePage]
class EntranceRoute extends PageRouteInfo<void> {
  const EntranceRoute({List<PageRouteInfo>? children})
      : super(
          EntranceRoute.name,
          initialChildren: children,
        );

  static const String name = 'EntranceRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [MainPage]
class MainRoute extends PageRouteInfo<void> {
  const MainRoute({List<PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
