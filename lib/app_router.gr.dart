// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i4;
import 'package:flutter/cupertino.dart' as _i5;
import 'package:rick_and_morty/dashboard_page.dart' as _i1;
import 'package:rick_and_morty/models/character.dart' as _i6;
import 'package:rick_and_morty/ui/details_page.dart' as _i2;
import 'package:rick_and_morty/ui/home_page.dart' as _i3;

abstract class $AppRouter extends _i4.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i4.PageFactory> pagesMap = {
    BottomNavigationBarRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.BottomNavigationBarWidget(),
      );
    },
    DetailsRoute.name: (routeData) {
      final args = routeData.argsAs<DetailsRouteArgs>();
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.DetailsPage(
          key: args.key,
          character: args.character,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return _i4.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i3.HomePage(),
      );
    },
  };
}

/// generated route for
/// [_i1.BottomNavigationBarWidget]
class BottomNavigationBarRoute extends _i4.PageRouteInfo<void> {
  const BottomNavigationBarRoute({List<_i4.PageRouteInfo>? children})
      : super(
          BottomNavigationBarRoute.name,
          initialChildren: children,
        );

  static const String name = 'BottomNavigationBarRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}

/// generated route for
/// [_i2.DetailsPage]
class DetailsRoute extends _i4.PageRouteInfo<DetailsRouteArgs> {
  DetailsRoute({
    _i5.Key? key,
    required _i6.Character character,
    List<_i4.PageRouteInfo>? children,
  }) : super(
          DetailsRoute.name,
          args: DetailsRouteArgs(
            key: key,
            character: character,
          ),
          initialChildren: children,
        );

  static const String name = 'DetailsRoute';

  static const _i4.PageInfo<DetailsRouteArgs> page =
      _i4.PageInfo<DetailsRouteArgs>(name);
}

class DetailsRouteArgs {
  const DetailsRouteArgs({
    this.key,
    required this.character,
  });

  final _i5.Key? key;

  final _i6.Character character;

  @override
  String toString() {
    return 'DetailsRouteArgs{key: $key, character: $character}';
  }
}

/// generated route for
/// [_i3.HomePage]
class HomeRoute extends _i4.PageRouteInfo<void> {
  const HomeRoute({List<_i4.PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const _i4.PageInfo<void> page = _i4.PageInfo<void>(name);
}
