import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/service/service.dart';
import 'package:rick_and_morty/model/character/character.dart';
import 'package:rick_and_morty/model/episode/episode.dart';
import 'package:rick_and_morty/model/location/location.dart';
import 'package:rick_and_morty/pages/character_page/character_page.dart';
import 'package:rick_and_morty/pages/characters_page/characters_page.dart';
import 'package:rick_and_morty/pages/episode_page/episode_page.dart';
import 'package:rick_and_morty/pages/episodes_page/episodes_page.dart';
import 'package:rick_and_morty/pages/home_page/home_page.dart';
import 'package:rick_and_morty/pages/location_page/location_page.dart';
import 'package:rick_and_morty/pages/locations_page/locations_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: HomeRoute.page,
          children: [
            AutoRoute(initial: true, page: CharacterTab.page, children: [
              AutoRoute(
                initial: true,
                page: CharactersRoute.page,
              ),
              AutoRoute(
                page: CharacterRoute.page,
              ),
            ]),
            AutoRoute(page: EpisodeTab.page, children: [
              AutoRoute(
                initial: true,
                page: EpisodesRoute.page,
              ),
              AutoRoute(
                page: EpisodeRoute.page,
              ),
            ]),
            AutoRoute(
              page: LocationTab.page,
              children: [
                AutoRoute(
                  initial: true,
                  page: LocationsRoute.page,
                ),
                AutoRoute(
                  page: LocationRoute.page,
                ),
              ],
            ),
          ],
        ),
      ];
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
