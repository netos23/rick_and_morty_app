import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ThemeSwatch extends StatelessWidget {
  const ThemeSwatch({super.key});

  @override
  Widget build(BuildContext context) {
    final thmeNotifer = context.watch<ValueNotifier<ThemeMode>>();
    return IconButton(
      onPressed: () {
        thmeNotifer.value = thmeNotifer.value == ThemeMode.dark
            ? ThemeMode.light
            : ThemeMode.dark;
      },
      icon: Icon(thmeNotifer.value == ThemeMode.dark
          ? Icons.dark_mode
          : Icons.light_mode),
    );
  }
}
