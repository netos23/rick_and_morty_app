import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/model/episode.dart';
import 'package:rick_and_morty/model/location.dart';
import 'package:rick_and_morty/pages/character_page/character_page.dart';
import 'package:rick_and_morty/pages/character_page/characters_page.dart';
import 'package:rick_and_morty/pages/dashboard_page.dart';
import 'package:rick_and_morty/pages/episode_page/episode_page.dart';
import 'package:rick_and_morty/pages/episode_page/episodes_page.dart';
import 'package:rick_and_morty/pages/location_page/location_page.dart';
import 'package:rick_and_morty/pages/location_page/locations_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(page: DashboardRoute.page, initial: true, children: [
          AutoRoute(
            page: CharacterTab.page,
            children: [
              AutoRoute(page: CharacterRoute.page),
              AutoRoute(page: CharactersRoute.page),
            ],
          ),
          AutoRoute(page: LocationTab.page, children: [
            AutoRoute(page: LocationsRoute.page),
            AutoRoute(page: LocationRoute.page),
          ]),
          AutoRoute(page: EpisodeTab.page, children: [
            AutoRoute(page: EpisodesRoute.page),
            AutoRoute(page: EpisodeRoute.page),
          ]),
        ]),
      ];
}


// Нужны как своеобразный узел
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
