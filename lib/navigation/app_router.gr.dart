// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

abstract class _$AppRouter extends RootStackRouter {
  // ignore: unused_element
  _$AppRouter({super.navigatorKey});

  @override
  final Map<String, PageFactory> pagesMap = {
    CharacterTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CharacterTabPage(),
      );
    },
    EpisodeTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EpisodeTabPage(),
      );
    },
    LocationTab.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LocationTabPage(),
      );
    },
    CharactersRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CharactersPage(),
      );
    },
    CharacterRoute.name: (routeData) {
      final args = routeData.argsAs<CharacterRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CharacterPage(
          key: args.key,
          preview: args.preview,
          id: args.id,
        ),
      );
    },
    EpisodesRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EpisodesPage(),
      );
    },
    EpisodeRoute.name: (routeData) {
      final args = routeData.argsAs<EpisodeRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EpisodePage(
          key: args.key,
          preview: args.preview,
          id: args.id,
        ),
      );
    },
    LocationsRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LocationsPage(),
      );
    },
    LocationRoute.name: (routeData) {
      final args = routeData.argsAs<LocationRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LocationPage(
          key: args.key,
          preview: args.preview,
          id: args.id,
        ),
      );
    },
    HomeRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
  };
}

/// generated route for
/// [CharacterTabPage]
class CharacterTab extends PageRouteInfo<void> {
  const CharacterTab({List<PageRouteInfo>? children})
      : super(
          CharacterTab.name,
          initialChildren: children,
        );

  static const String name = 'CharacterTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EpisodeTabPage]
class EpisodeTab extends PageRouteInfo<void> {
  const EpisodeTab({List<PageRouteInfo>? children})
      : super(
          EpisodeTab.name,
          initialChildren: children,
        );

  static const String name = 'EpisodeTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LocationTabPage]
class LocationTab extends PageRouteInfo<void> {
  const LocationTab({List<PageRouteInfo>? children})
      : super(
          LocationTab.name,
          initialChildren: children,
        );

  static const String name = 'LocationTab';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CharactersPage]
class CharactersRoute extends PageRouteInfo<void> {
  const CharactersRoute({List<PageRouteInfo>? children})
      : super(
          CharactersRoute.name,
          initialChildren: children,
        );

  static const String name = 'CharactersRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CharacterPage]
class CharacterRoute extends PageRouteInfo<CharacterRouteArgs> {
  CharacterRoute({
    Key? key,
    Character? preview,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          CharacterRoute.name,
          args: CharacterRouteArgs(
            key: key,
            preview: preview,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'CharacterRoute';

  static const PageInfo<CharacterRouteArgs> page =
      PageInfo<CharacterRouteArgs>(name);
}

class CharacterRouteArgs {
  const CharacterRouteArgs({
    this.key,
    this.preview,
    required this.id,
  });

  final Key? key;

  final Character? preview;

  final int id;

  @override
  String toString() {
    return 'CharacterRouteArgs{key: $key, preview: $preview, id: $id}';
  }
}

/// generated route for
/// [EpisodesPage]
class EpisodesRoute extends PageRouteInfo<void> {
  const EpisodesRoute({List<PageRouteInfo>? children})
      : super(
          EpisodesRoute.name,
          initialChildren: children,
        );

  static const String name = 'EpisodesRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EpisodePage]
class EpisodeRoute extends PageRouteInfo<EpisodeRouteArgs> {
  EpisodeRoute({
    Key? key,
    Episode? preview,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          EpisodeRoute.name,
          args: EpisodeRouteArgs(
            key: key,
            preview: preview,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'EpisodeRoute';

  static const PageInfo<EpisodeRouteArgs> page =
      PageInfo<EpisodeRouteArgs>(name);
}

class EpisodeRouteArgs {
  const EpisodeRouteArgs({
    this.key,
    this.preview,
    required this.id,
  });

  final Key? key;

  final Episode? preview;

  final int id;

  @override
  String toString() {
    return 'EpisodeRouteArgs{key: $key, preview: $preview, id: $id}';
  }
}

/// generated route for
/// [LocationsPage]
class LocationsRoute extends PageRouteInfo<void> {
  const LocationsRoute({List<PageRouteInfo>? children})
      : super(
          LocationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationsRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LocationPage]
class LocationRoute extends PageRouteInfo<LocationRouteArgs> {
  LocationRoute({
    Key? key,
    Location? preview,
    required int id,
    List<PageRouteInfo>? children,
  }) : super(
          LocationRoute.name,
          args: LocationRouteArgs(
            key: key,
            preview: preview,
            id: id,
          ),
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const PageInfo<LocationRouteArgs> page =
      PageInfo<LocationRouteArgs>(name);
}

class LocationRouteArgs {
  const LocationRouteArgs({
    this.key,
    this.preview,
    required this.id,
  });

  final Key? key;

  final Location? preview;

  final int id;

  @override
  String toString() {
    return 'LocationRouteArgs{key: $key, preview: $preview, id: $id}';
  }
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute({List<PageRouteInfo>? children})
      : super(
          HomeRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomeRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}
