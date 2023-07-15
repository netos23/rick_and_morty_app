import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/util/path_id.dart';
import '../../../navigation/app_router.dart';
import 'first_episode_tile.dart';
import 'last_location_tile.dart';
import 'status_tile.dart';

class InfoBoard extends StatelessWidget {
  const InfoBoard({
    super.key,
    required this.character,
  });

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
            ),
            ListTile(
              trailing: const Icon(Icons.navigate_next),
              onTap: () async{
                context.router.navigate(
                  LocationTab(
                      children: [
                        LocationRoute(
                          id: character.location.url.id,
                        ),
                      ]
                  ),
                );
              },
              title: LastLocationTile(
                character: character,
              ),
            ),
            GestureDetector(
              //TODO
              child: FirstEpisodeTile(
                character: character,
              ),
            ),
          ],
        ),
      ),
    );
  }
}