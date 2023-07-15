import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/model/episode.dart';
import 'package:rick_and_morty/model/location.dart';
import 'package:rick_and_morty/pages/character/character_page.dart';
import 'package:rick_and_morty/pages/character/characters_page.dart';
import 'package:rick_and_morty/pages/episode/episode_page.dart';
import 'package:rick_and_morty/pages/episode/episodes_page.dart';
import 'package:rick_and_morty/pages/home/home_page.dart';
import 'package:rick_and_morty/pages/location/location_page.dart';
import 'package:rick_and_morty/pages/location/locations_page.dart';

part 'app_router.gr.dart';

@AutoRouterConfig()
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
    AutoRoute(

      initial: true,
      page: HomeRoute.page,
      children: [
        AutoRoute(

            initial: true,
            page: CharacterTab.page,
            children: [
              AutoRoute(

                initial: true,
                page: CharactersRoute.page,
              ),
              AutoRoute(

                page: CharacterRoute.page,
              ),
            ]),
        AutoRoute( page: EpisodeTab.page, children: [
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