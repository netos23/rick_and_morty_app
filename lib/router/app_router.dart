import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/router/router.dart';

part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: '')
class AppRouter extends _$AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: HomePageRoute.page,
          children: [
            AutoRoute(initial: true, page: CharacterTab.page, children: [
              AutoRoute(
                initial: true,
                page: CharactersPageRoute.page,
              ),
              AutoRoute(
                page: CharacterItemPageRoute.page,
              ),
            ]),
            AutoRoute(page: EpisodeTab.page, children: [
              AutoRoute(
                initial: true,
                page: EpisodesPageRoute.page,
              ),
              AutoRoute(
                page: EpisodeItemPageRoute.page,
              ),
            ]),
            AutoRoute(
              page: LocationTab.page,
              children: [
                AutoRoute(
                  initial: true,
                  page: LocationsPageRoute.page,
                ),
                AutoRoute(
                  page: LocationItemPageRoute.page,
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
