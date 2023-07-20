import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/model/episode.dart';
import 'package:rick_and_morty/model/location.dart';
import 'package:rick_and_morty/pages/charaacter_page/character_page.dart';
import 'package:rick_and_morty/pages/characters_page/characters_page.dart';
import 'package:rick_and_morty/pages/episode_page/episode_page.dart';
import 'package:rick_and_morty/pages/episodes_page/episodes_page.dart';
import 'package:rick_and_morty/pages/favourite_page/favourite_page.dart';
import 'package:rick_and_morty/pages/home_page/home_page.dart';
import 'package:rick_and_morty/pages/location_page/location_page.dart';
import 'package:rick_and_morty/pages/locations_page/locations_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          path: '/',
          initial: true,
          page: HomeRoute.page,
          children: [
            AutoRoute(
              path: 'charater-tab',
              initial: true,
              page: CharacterTab.page,
              children: [
                AutoRoute(
                  path: 'favourites',
                  page: FavouritesRoute.page,
                ),
                AutoRoute(
                  path: 'characters',
                  initial: true,
                  page: CharactersRoute.page,
                ),
                CustomRoute(
                  path: 'character:id',
                  customRouteBuilder: buildTransition,
                  page: CharacterRoute.page,
                ),
              ],
            ),
            AutoRoute(
              path: 'episode-tab',
              page: EpisodeTab.page,
              children: [
                AutoRoute(
                  path: 'episodes',
                  initial: true,
                  page: EpisodesRoute.page,
                ),
                AutoRoute(
                  path: 'episode',
                  page: EpisodeRoute.page,
                ),
              ],
            ),
            AutoRoute(
              path: 'location-tab',
              page: LocationTab.page,
              children: [
                AutoRoute(
                  path: 'locations',
                  initial: true,
                  page: LocationsRoute.page,
                ),
                AutoRoute(
                  path: 'location',
                  page: LocationRoute.page,
                ),
              ],
            ),
          ],
        ),
      ];

  Route<T> buildTransition<T>(
    BuildContext context,
    Widget child,
    AutoRoutePage<T> page,
  ) {
    return ModalBottomSheetRoute(
      settings: page,
      builder: (_) => child,
      isScrollControlled: true,
    );
  }
}

@RoutePage(name: 'CharacterTab')
class CharacterTabPage extends AutoRouter {
  const CharacterTabPage({super.key});
}

@RoutePage(name: 'EpisodeTab')
class EpisodeTabPage extends AutoRouter {
  const EpisodeTabPage({super.key});
}

@RoutePage(name: 'LocationTab')
class LocationTabPage extends AutoRouter {
  const LocationTabPage({super.key});
}
