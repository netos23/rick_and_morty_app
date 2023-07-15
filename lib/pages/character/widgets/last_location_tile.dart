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
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          'Last known loction:',
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        ),
        Text(
          character.location.name,
          style: theme.textTheme.bodyLarge?.copyWith(
            color: theme.colorScheme.onSurfaceVariant,
            fontWeight: FontWeight.w600,
          ),
          textAlign: TextAlign.left,
        ),
      ],
    );
  }
}