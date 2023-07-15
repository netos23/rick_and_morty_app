import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';

class LastLocationTile extends StatelessWidget {
  const LastLocationTile({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final locationName = character.location.name;
    return Row(
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Last known location:',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
                fontWeight: FontWeight.w600,
              ),
            ),
            Text(
              locationName.length <= 20 ? locationName : '${locationName.substring(0, 20)}...',
              overflow: TextOverflow.ellipsis,
              style: theme.textTheme.bodySmall?.copyWith(
                color: theme.colorScheme.onSurfaceVariant,
              ),
            ),
          ],
        ),
        const Spacer(),
        const Icon(Icons.navigate_next),
      ],
    );
  }
}
