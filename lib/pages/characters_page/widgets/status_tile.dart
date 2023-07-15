import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character/character.dart';

class StatusTile extends StatelessWidget {
  const StatusTile({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          character.name,
          style: theme.textTheme.headlineSmall?.copyWith(
            color: theme.colorScheme.onSurface,
          ),
        ),
        Row(
          children: [
            Icon(
              Icons.fiber_manual_record,
              color: _mapStatus(character.status),
              size: 15,
            ),
            const SizedBox(
              width: 10,
            ),
            Text(
              '${character.species} - ${character.status}',
              style: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onSurface,
              ),
            ),
          ],
        )
      ],
    );
  }

  Color? _mapStatus(String status) {
    return switch (status) {
      'Dead' => Colors.red,
      'Alive' => Colors.green,
      _ => Colors.blue[900],
    };
  }
}
