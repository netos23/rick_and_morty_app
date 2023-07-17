// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i10;
import 'package:elementary/elementary.dart' as _i12;
import 'package:flutter/material.dart' as _i11;
import 'package:rick_and_morty/data/model/character.dart' as _i13;
import 'package:rick_and_morty/data/model/episode.dart' as _i14;
import 'package:rick_and_morty/data/model/location.dart' as _i15;
import 'package:rick_and_morty/navigation/app_router.dart' as _i1;
import 'package:rick_and_morty/screens/character_main_screen/character_main_screen_widget.dart'
    as _i4;
import 'package:rick_and_morty/screens/characters_list_screen/characters_list_screen_widget.dart'
    as _i2;
import 'package:rick_and_morty/screens/characters_list_screen/characters_list_screen_wm.dart';
import 'package:rick_and_morty/screens/episode_screen/episode_screen_widget.dart'
    as _i6;
import 'package:rick_and_morty/screens/episode_screen/episode_screen_wm.dart';
import 'package:rick_and_morty/screens/episodes_list_screen/episodes_list_screen_widget.dart'
    as _i5;
import 'package:rick_and_morty/screens/episodes_list_screen/episodes_list_screen_wm.dart';
import 'package:rick_and_morty/screens/find_screen/find_screen_widget.dart'
    as _i3;
import 'package:rick_and_morty/screens/find_screen/find_screen_wm.dart';
import 'package:rick_and_morty/screens/location_list_screen/location_list_screen_widget.dart'
    as _i7;
import 'package:rick_and_morty/screens/location_list_screen/location_list_screen_wm.dart';
import 'package:rick_and_morty/screens/location_screen/location_screen_widget.dart'
    as _i8;
import 'package:rick_and_morty/screens/location_screen/location_screen_wm.dart';
import 'package:rick_and_morty/screens/main_screen_widget.dart' as _i9;

abstract class $AppRouter extends _i10.RootStackRouter {
  $AppRouter({super.navigatorKey});

  @override
  final Map<String, _i10.PageFactory> pagesMap = {
    CharTabPage.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.CharTab(),
      );
    },
    LocationsTabPage.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.LocationsTab(),
      );
    },
    EpisodeTabPage.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i1.EpisodeTab(),
      );
    },
    CharactersListRoute.name: (routeData) {
      final args = routeData.argsAs<CharactersListRouteArgs>(
          orElse: () => const CharactersListRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i2.CharactersListScreenWidget(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    FindRoute.name: (routeData) {
      final args =
          routeData.argsAs<FindRouteArgs>(orElse: () => const FindRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i3.FindScreenWidget(
          key: args.key,
          id: args.id,
          preview: args.preview,
          wmFactory: args.wmFactory,
        ),
      );
    },
    CharacterMainRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i4.CharacterMainScreenWidget(),
      );
    },
    EpisodesListRoute.name: (routeData) {
      final args = routeData.argsAs<EpisodesListRouteArgs>(
          orElse: () => const EpisodesListRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i5.EpisodesListScreenWidget(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    EpisodeRoute.name: (routeData) {
      final args = routeData.argsAs<EpisodeRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i6.EpisodeScreenWidget(
          args.episode,
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    LocationListRoute.name: (routeData) {
      final args = routeData.argsAs<LocationListRouteArgs>(
          orElse: () => const LocationListRouteArgs());
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i7.LocationListScreenWidget(
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    LocationRoute.name: (routeData) {
      final args = routeData.argsAs<LocationRouteArgs>();
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: _i8.LocationScreenWidget(
          id: args.id,
          preview: args.preview,
          key: args.key,
          wmFactory: args.wmFactory,
        ),
      );
    },
    MainRoute.name: (routeData) {
      return _i10.AutoRoutePage<dynamic>(
        routeData: routeData,
        child: const _i9.MainScreenWidget(),
      );
    },
  };
}

/// generated route for
/// [_i1.CharTab]
class CharTabPage extends _i10.PageRouteInfo<void> {
  const CharTabPage({List<_i10.PageRouteInfo>? children})
      : super(
          CharTabPage.name,
          initialChildren: children,
        );

  static const String name = 'CharTabPage';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i1.LocationsTab]
class LocationsTabPage extends _i10.PageRouteInfo<void> {
  const LocationsTabPage({List<_i10.PageRouteInfo>? children})
      : super(
          LocationsTabPage.name,
          initialChildren: children,
        );

  static const String name = 'LocationsTabPage';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i1.EpisodeTab]
class EpisodeTabPage extends _i10.PageRouteInfo<void> {
  const EpisodeTabPage({List<_i10.PageRouteInfo>? children})
      : super(
          EpisodeTabPage.name,
          initialChildren: children,
        );

  static const String name = 'EpisodeTabPage';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i2.CharactersListScreenWidget]
class CharactersListRoute extends _i10.PageRouteInfo<CharactersListRouteArgs> {
  CharactersListRoute({
    _i11.Key? key,
    _i12.WidgetModel<_i12.ElementaryWidget<_i12.IWidgetModel>,
                _i12.ElementaryModel>
            Function(_i11.BuildContext)
        wmFactory = defaultCharactersListScreenWidgetModelFactory,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          CharactersListRoute.name,
          args: CharactersListRouteArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'CharactersListRoute';

  static const _i10.PageInfo<CharactersListRouteArgs> page =
      _i10.PageInfo<CharactersListRouteArgs>(name);
}

class CharactersListRouteArgs {
  const CharactersListRouteArgs({
    this.key,
    this.wmFactory = defaultCharactersListScreenWidgetModelFactory,
  });

  final _i11.Key? key;

  final _i12.WidgetModel<_i12.ElementaryWidget<_i12.IWidgetModel>,
          _i12.ElementaryModel>
      Function(_i11.BuildContext) wmFactory;

  @override
  String toString() {
    return 'CharactersListRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [_i3.FindScreenWidget]
class FindRoute extends _i10.PageRouteInfo<FindRouteArgs> {
  FindRoute({
    _i11.Key? key,
    int? id,
    _i13.Character? preview,
    _i12.WidgetModel<_i12.ElementaryWidget<_i12.IWidgetModel>,
                _i12.ElementaryModel>
            Function(_i11.BuildContext)
        wmFactory = defaultFindScreenWidgetModelFactory,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          FindRoute.name,
          args: FindRouteArgs(
            key: key,
            id: id,
            preview: preview,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'FindRoute';

  static const _i10.PageInfo<FindRouteArgs> page =
      _i10.PageInfo<FindRouteArgs>(name);
}

class FindRouteArgs {
  const FindRouteArgs({
    this.key,
    this.id,
    this.preview,
    this.wmFactory = defaultFindScreenWidgetModelFactory,
  });

  final _i11.Key? key;

  final int? id;

  final _i13.Character? preview;

  final _i12.WidgetModel<_i12.ElementaryWidget<_i12.IWidgetModel>,
          _i12.ElementaryModel>
      Function(_i11.BuildContext) wmFactory;

  @override
  String toString() {
    return 'FindRouteArgs{key: $key, id: $id, preview: $preview, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [_i4.CharacterMainScreenWidget]
class CharacterMainRoute extends _i10.PageRouteInfo<void> {
  const CharacterMainRoute({List<_i10.PageRouteInfo>? children})
      : super(
          CharacterMainRoute.name,
          initialChildren: children,
        );

  static const String name = 'CharacterMainRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}

/// generated route for
/// [_i5.EpisodesListScreenWidget]
class EpisodesListRoute extends _i10.PageRouteInfo<EpisodesListRouteArgs> {
  EpisodesListRoute({
    _i11.Key? key,
    _i12.WidgetModel<_i12.ElementaryWidget<_i12.IWidgetModel>,
                _i12.ElementaryModel>
            Function(_i11.BuildContext)
        wmFactory = defaultEpisodesListScreenWidgetModelFactory,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          EpisodesListRoute.name,
          args: EpisodesListRouteArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'EpisodesListRoute';

  static const _i10.PageInfo<EpisodesListRouteArgs> page =
      _i10.PageInfo<EpisodesListRouteArgs>(name);
}

class EpisodesListRouteArgs {
  const EpisodesListRouteArgs({
    this.key,
    this.wmFactory = defaultEpisodesListScreenWidgetModelFactory,
  });

  final _i11.Key? key;

  final _i12.WidgetModel<_i12.ElementaryWidget<_i12.IWidgetModel>,
          _i12.ElementaryModel>
      Function(_i11.BuildContext) wmFactory;

  @override
  String toString() {
    return 'EpisodesListRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [_i6.EpisodeScreenWidget]
class EpisodeRoute extends _i10.PageRouteInfo<EpisodeRouteArgs> {
  EpisodeRoute({
    required _i14.Episode episode,
    _i11.Key? key,
    _i12.WidgetModel<_i12.ElementaryWidget<_i12.IWidgetModel>,
                _i12.ElementaryModel>
            Function(_i11.BuildContext)
        wmFactory = defaultEpisodeScreenWidgetModelFactory,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          EpisodeRoute.name,
          args: EpisodeRouteArgs(
            episode: episode,
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'EpisodeRoute';

  static const _i10.PageInfo<EpisodeRouteArgs> page =
      _i10.PageInfo<EpisodeRouteArgs>(name);
}

class EpisodeRouteArgs {
  const EpisodeRouteArgs({
    required this.episode,
    this.key,
    this.wmFactory = defaultEpisodeScreenWidgetModelFactory,
  });

  final _i14.Episode episode;

  final _i11.Key? key;

  final _i12.WidgetModel<_i12.ElementaryWidget<_i12.IWidgetModel>,
          _i12.ElementaryModel>
      Function(_i11.BuildContext) wmFactory;

  @override
  String toString() {
    return 'EpisodeRouteArgs{episode: $episode, key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [_i7.LocationListScreenWidget]
class LocationListRoute extends _i10.PageRouteInfo<LocationListRouteArgs> {
  LocationListRoute({
    _i11.Key? key,
    _i12.WidgetModel<_i12.ElementaryWidget<_i12.IWidgetModel>,
                _i12.ElementaryModel>
            Function(_i11.BuildContext)
        wmFactory = defaultLocationListScreenWidgetModelFactory,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          LocationListRoute.name,
          args: LocationListRouteArgs(
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'LocationListRoute';

  static const _i10.PageInfo<LocationListRouteArgs> page =
      _i10.PageInfo<LocationListRouteArgs>(name);
}

class LocationListRouteArgs {
  const LocationListRouteArgs({
    this.key,
    this.wmFactory = defaultLocationListScreenWidgetModelFactory,
  });

  final _i11.Key? key;

  final _i12.WidgetModel<_i12.ElementaryWidget<_i12.IWidgetModel>,
          _i12.ElementaryModel>
      Function(_i11.BuildContext) wmFactory;

  @override
  String toString() {
    return 'LocationListRouteArgs{key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [_i8.LocationScreenWidget]
class LocationRoute extends _i10.PageRouteInfo<LocationRouteArgs> {
  LocationRoute({
    required int id,
    _i15.Location? preview,
    _i11.Key? key,
    _i12.WidgetModel<_i12.ElementaryWidget<_i12.IWidgetModel>,
                _i12.ElementaryModel>
            Function(_i11.BuildContext)
        wmFactory = defaultLocationScreenWidgetModelFactory,
    List<_i10.PageRouteInfo>? children,
  }) : super(
          LocationRoute.name,
          args: LocationRouteArgs(
            id: id,
            preview: preview,
            key: key,
            wmFactory: wmFactory,
          ),
          initialChildren: children,
        );

  static const String name = 'LocationRoute';

  static const _i10.PageInfo<LocationRouteArgs> page =
      _i10.PageInfo<LocationRouteArgs>(name);
}

class LocationRouteArgs {
  const LocationRouteArgs({
    required this.id,
    this.preview,
    this.key,
    this.wmFactory = defaultLocationScreenWidgetModelFactory,
  });

  final int id;

  final _i15.Location? preview;

  final _i11.Key? key;

  final _i12.WidgetModel<_i12.ElementaryWidget<_i12.IWidgetModel>,
          _i12.ElementaryModel>
      Function(_i11.BuildContext) wmFactory;

  @override
  String toString() {
    return 'LocationRouteArgs{id: $id, preview: $preview, key: $key, wmFactory: $wmFactory}';
  }
}

/// generated route for
/// [_i9.MainScreenWidget]
class MainRoute extends _i10.PageRouteInfo<void> {
  const MainRoute({List<_i10.PageRouteInfo>? children})
      : super(
          MainRoute.name,
          initialChildren: children,
        );

  static const String name = 'MainRoute';

  static const _i10.PageInfo<void> page = _i10.PageInfo<void>(name);
}
