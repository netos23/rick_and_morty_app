/*
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/pages/charaacter_page/character_page.dart';
import 'package:rick_and_morty/pages/characters_page/characters_page.dart';
import 'package:rick_and_morty/pages/episode_page/episode_page.dart';
import 'package:rick_and_morty/pages/episodes_page/episodes_page.dart';
import 'package:rick_and_morty/pages/home_page/home_page.dart';
import 'package:rick_and_morty/pages/location_page/location_page.dart';
import 'package:rick_and_morty/pages/locations_page/locations_page.dart';

class GenerateNavigator {
  static final GlobalKey<TabNavigator> tabNavigator = GlobalKey();
  static final List<GlobalKey<NavigatorState>> locationNavigator = [
    GlobalKey(),
    GlobalKey(),
    GlobalKey(),
  ];

  static NavigatorState? currentNavigator() {
    final currentIndex = tabNavigator.currentState?.tab ?? 0;
    return locationNavigator[currentIndex].currentState;
  }

  static Route<dynamic>? onGenerateRouteCharacter(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(
          settings: settings,
          builder: (_) => const CharactersPage(),
        );
      case '/character':
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => CharacterPage(
            id: settings.arguments as int,
            characterClient: context.read(),
            episodeClient: context.read(),
          ),
        );
      default:
        return CupertinoPageRoute(
          settings: settings,
          builder: (_) => const Text('Error'),
        );
    }
  }

  static Route<dynamic>? onGenerateRouteEpisode(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(
          settings: settings,
          builder: (_) => const EpisodesPage(),
        );
      case '/episode':
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => EpisodePage(
            id: settings.arguments as int,
            characterClient: context.read(),
            episodeClient: context.read(),
          ),
        );
      default:
        return CupertinoPageRoute(
          settings: settings,
          builder: (_) => const Text('Error'),
        );
    }
  }

  static Route<dynamic>? onGenerateRouteLocation(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(
          settings: settings,
          builder: (_) => const LocationsPage(),
        );
      case '/location':
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => LocationPage(
            id: settings.arguments as int,
            locationClient: context.read(),
          ),
        );
      default:
        return CupertinoPageRoute(
          settings: settings,
          builder: (_) => const Text('Error'),
        );
    }
  }
}
*/
