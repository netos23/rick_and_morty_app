import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key, required this.controller}) : super(key: key);

  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorScheme = Theme.of(context).colorScheme;
    return TextField(
      controller: controller,
      style: textTheme.bodyLarge?.copyWith(color: colorScheme.onBackground),
      decoration: InputDecoration(
        fillColor: colorScheme.secondary,
        filled: true,
        icon: Icon(
          Icons.search,
          color: colorScheme.onBackground,
        ),
      ),
    );
  }
}
