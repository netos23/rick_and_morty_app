import 'package:flutter/material.dart';

class SearchTile extends StatelessWidget {
  const SearchTile({super.key});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
        height: 50,
        child: TextFormField(
          style: TextStyle(
            fontSize: 20,
            height: 20 / 16,
            color: theme.colorScheme.onSurface,
          ),
          decoration: const InputDecoration(
            alignLabelWithHint: true,
            hintText: 'Search',
            prefixIcon: Icon(Icons.search),
            border: OutlineInputBorder(),
          ),
        ),
    );
  }
}
