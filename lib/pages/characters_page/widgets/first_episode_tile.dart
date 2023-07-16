import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/util/path_id.dart';

class FirstEpisodeTile extends StatelessWidget {
  const FirstEpisodeTile({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'First seen in:',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
            //Временное решение для отображения персонажей на странице эпизодов
            character.firstEpisodeName != null
                ? Text(
                    character.firstEpisodeName!,
                  )
                : Text(
                    (character.episode.first.id).toString() ?? '',
                  ),
          ],
        ),
        const Icon(Icons.navigate_next)
      ],
    );
  }
}
