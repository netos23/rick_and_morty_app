import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';

import 'first_episode_tile.dart';
import 'last_location_tile.dart';
import 'status_tile.dart';

class InfoBoard extends StatelessWidget {
  const InfoBoard({
    super.key,
    required this.character,
    required this.isFavourites,
    this.onFavouriteTap,
  });

  final bool isFavourites;
  final VoidCallback? onFavouriteTap;
  final Character character;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: DefaultTextStyle(
        style: theme.textTheme.bodyLarge?.copyWith(
              color: theme.colorScheme.onSurface,
            ) ??
            const TextStyle(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            StatusTile(
              character: character,
              isFavourites: isFavourites,
              onFavouriteTap: onFavouriteTap,
            ),
            LastLocationTile(
              character: character,
            ),
            FirstEpisodeTile(
              character: character,
            ),
          ],
        ),
      ),
    );
  }
}
