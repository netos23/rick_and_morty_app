import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';

class StatusTile extends StatelessWidget {
  const StatusTile({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final characterName = character.name;
    final characterStatus = '${character.species} - ${character.status}';
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          characterName.length <= 18 ? characterName : '${characterName.substring(0, 18)}...',
          style: theme.textTheme.bodyLarge?.copyWith(
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
              width: 8,
            ),
            Text(
              characterStatus.length <= 20 ? characterStatus : '${characterStatus.substring(0, 20)}...',
              style: theme.textTheme.bodySmall?.copyWith(
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
