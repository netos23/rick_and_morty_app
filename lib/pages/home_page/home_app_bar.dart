import 'package:flutter/material.dart';

class HomeAppBar extends StatefulWidget {
  const HomeAppBar({super.key});

  @override
  State<HomeAppBar> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends State<HomeAppBar> {
  bool light = false;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    //TODO: Search, filter
    return AppBar(
      titleSpacing: 60,
      title: Image.asset('assets/icons/title.png'),
      backgroundColor: theme.colorScheme.background,
      leading: Padding(
        padding: const EdgeInsets.only(left: 8),
        child: IconButton(
          onPressed: () {
            setState(() {
              light = !light;
            });
            //TODO: Здесь ловлю ошибку, что toggleThemeMode() должен быть внутри класса, а не стейта.
            // Был бы очень признателен, если поможешь разобраться!
            //RickAndMortyApp app = context.findAncestorWidgetOfExactType<RickAndMortyApp>()!;
            //app.toggleThemeMode();
          },
          icon: Image.asset(light
              ? 'assets/icons/logo_light.png'
              : 'assets/icons/logo_dark.png'),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.only(right: 2, top: 5),
          child: IconButton(
            onPressed: () {},
            icon: const Icon(Icons.search),
          ),
        ),
      ],
    );
  }
}
