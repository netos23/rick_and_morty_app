import 'package:auto_route/auto_route.dart';

import 'package:rick_and_morty/navigation/app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Tab|ScreenWidget,Route")
class AppRouter extends $AppRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          initial: true,
          page: MainRoute.page,
          children: [
            AutoRoute(
              initial: true,
              page: CharTabPage.page,
              children: [
                AutoRoute(
                  initial: true,
                  page: CharacterMainRoute.page,
                ),
                AutoRoute(
                  page: CharactersListRoute.page,
                ),
                AutoRoute(page: FindRoute.page),
              ],
            ),
            AutoRoute(
              page: LocationsTabPage.page,
              children: [
                AutoRoute(page: LocationRoute.page),
                AutoRoute(initial: true, page: LocationListRoute.page),
              ],
            ),
            AutoRoute(
              page: EpisodeTabPage.page,
              children: [
                AutoRoute(page: EpisodeRoute.page),
                AutoRoute(initial: true, page: EpisodesListRoute.page),
              ],
            ),
          ],
        ),
      ];
}

@RoutePage(name: 'CharTabPage')
class CharTab extends AutoRouter {
  const CharTab({super.key});
}

@RoutePage(name: 'LocationsTabPage')
class LocationsTab extends AutoRouter {
  const LocationsTab({super.key});
}

@RoutePage(name: 'EpisodeTabPage')
class EpisodeTab extends AutoRouter {
  const EpisodeTab({super.key});
}
