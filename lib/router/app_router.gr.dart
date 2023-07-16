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
    HomePageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const HomePage(),
      );
    },
    EpisodesPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const EpisodesPage(),
      );
    },
    EpisodeItemPageRoute.name: (routeData) {
      final args = routeData.argsAs<EpisodeItemPageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: EpisodeItemPage(
          key: args.key,
          id: args.id,
          episode: args.episode,
        ),
      );
    },
    CharactersPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const CharactersPage(),
      );
    },
    CharacterItemPageRoute.name: (routeData) {
      final args = routeData.argsAs<CharacterItemPageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: CharacterItemPage(
          key: args.key,
          id: args.id,
          preview: args.preview,
        ),
      );
    },
    LocationsPageRoute.name: (routeData) {
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const LocationsPage(),
      );
    },
    LocationItemPageRoute.name: (routeData) {
      final args = routeData.argsAs<LocationItemPageRouteArgs>();
      return AutoRoutePage<dynamic>(
        routeData: routeData,
        child: LocationItemPage(
          key: args.key,
          id: args.id,
          location: args.location,
        ),
      );
    },
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
  };
}

/// generated route for
/// [HomePage]
class HomePageRoute extends PageRouteInfo<void> {
  const HomePageRoute({List<PageRouteInfo>? children})
      : super(
          HomePageRoute.name,
          initialChildren: children,
        );

  static const String name = 'HomePageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EpisodesPage]
class EpisodesPageRoute extends PageRouteInfo<void> {
  const EpisodesPageRoute({List<PageRouteInfo>? children})
      : super(
          EpisodesPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'EpisodesPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [EpisodeItemPage]
class EpisodeItemPageRoute extends PageRouteInfo<EpisodeItemPageRouteArgs> {
  EpisodeItemPageRoute({
    Key? key,
    required int id,
    Episode? episode,
    List<PageRouteInfo>? children,
  }) : super(
          EpisodeItemPageRoute.name,
          args: EpisodeItemPageRouteArgs(
            key: key,
            id: id,
            episode: episode,
          ),
          initialChildren: children,
        );

  static const String name = 'EpisodeItemPageRoute';

  static const PageInfo<EpisodeItemPageRouteArgs> page =
      PageInfo<EpisodeItemPageRouteArgs>(name);
}

class EpisodeItemPageRouteArgs {
  const EpisodeItemPageRouteArgs({
    this.key,
    required this.id,
    this.episode,
  });

  final Key? key;

  final int id;

  final Episode? episode;

  @override
  String toString() {
    return 'EpisodeItemPageRouteArgs{key: $key, id: $id, episode: $episode}';
  }
}

/// generated route for
/// [CharactersPage]
class CharactersPageRoute extends PageRouteInfo<void> {
  const CharactersPageRoute({List<PageRouteInfo>? children})
      : super(
          CharactersPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CharactersPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [CharacterItemPage]
class CharacterItemPageRoute extends PageRouteInfo<CharacterItemPageRouteArgs> {
  CharacterItemPageRoute({
    Key? key,
    required int id,
    Character? preview,
    List<PageRouteInfo>? children,
  }) : super(
          CharacterItemPageRoute.name,
          args: CharacterItemPageRouteArgs(
            key: key,
            id: id,
            preview: preview,
          ),
          initialChildren: children,
        );

  static const String name = 'CharacterItemPageRoute';

  static const PageInfo<CharacterItemPageRouteArgs> page =
      PageInfo<CharacterItemPageRouteArgs>(name);
}

class CharacterItemPageRouteArgs {
  const CharacterItemPageRouteArgs({
    this.key,
    required this.id,
    this.preview,
  });

  final Key? key;

  final int id;

  final Character? preview;

  @override
  String toString() {
    return 'CharacterItemPageRouteArgs{key: $key, id: $id, preview: $preview}';
  }
}

/// generated route for
/// [LocationsPage]
class LocationsPageRoute extends PageRouteInfo<void> {
  const LocationsPageRoute({List<PageRouteInfo>? children})
      : super(
          LocationsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LocationsPageRoute';

  static const PageInfo<void> page = PageInfo<void>(name);
}

/// generated route for
/// [LocationItemPage]
class LocationItemPageRoute extends PageRouteInfo<LocationItemPageRouteArgs> {
  LocationItemPageRoute({
    Key? key,
    required int id,
    Location? location,
    List<PageRouteInfo>? children,
  }) : super(
          LocationItemPageRoute.name,
          args: LocationItemPageRouteArgs(
            key: key,
            id: id,
            location: location,
          ),
          initialChildren: children,
        );

  static const String name = 'LocationItemPageRoute';

  static const PageInfo<LocationItemPageRouteArgs> page =
      PageInfo<LocationItemPageRouteArgs>(name);
}

class LocationItemPageRouteArgs {
  const LocationItemPageRouteArgs({
    this.key,
    required this.id,
    this.location,
  });

  final Key? key;

  final int id;

  final Location? location;

  @override
  String toString() {
    return 'LocationItemPageRouteArgs{key: $key, id: $id, location: $location}';
  }
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
