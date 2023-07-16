import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/pages/charaacter_page/character_page.dart';
import 'package:rick_and_morty/pages/characters_page/characters_page.dart';
import 'package:rick_and_morty/pages/episode_page/episode_page.dart';
import 'package:rick_and_morty/pages/episodes_page/episodes_page.dart';
import 'package:rick_and_morty/pages/home_page/home_page.dart';
import 'package:rick_and_morty/pages/location_page/location_page.dart';
import 'package:rick_and_morty/pages/locations_page/locations_page.dart';

class NavigationGenerator {
  static final GlobalKey<HomePageState> tabNavigator = GlobalKey();

  static final List<GlobalKey<NavigatorState>> inPageNavigation = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  static NavigatorState? currentTabNavigator() {
    final currentIndex = tabNavigator.currentState?.tab ?? 0;
    return inPageNavigation[currentIndex].currentState;
  }

  static Route<dynamic> onGenRouteCharacter(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const CharactersPage(),
        );
      case '/character':
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => CharacterPage(
            id: settings.arguments as int,
            characterClient: context.read(),
            episodeClient: context.read(),
          ),
        );
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const Center(
            child: Text(
              'Something went wrond\n Error: 404',
            ),
          ),
        );
    }
  }

  static Route<dynamic> onGenRouteEpisode(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => const EpisodesPage(),
        );
      case '/episode':
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => EpisodePage(
            id: settings.arguments as int,
            characterClient: context.read(),
            episodeClient: context.read(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Center(
            child: Text(
              'Something went wrond\n Error: 404',
            ),
          ),
        );
    }
  }

  static Route<dynamic> onGenRouteLocation(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          builder: (_) => const LocationsPage(),
        );
      case '/location':
        return MaterialPageRoute(
          builder: (context) => LocationPage(
            id: settings.arguments as int,
            locationClient: context.read(),
          ),
        );
      default:
        return MaterialPageRoute(
          builder: (_) => const Center(
            child: Text(
              'Something went wrond\n Error: 404',
            ),
          ),
        );
    }
  }
}
