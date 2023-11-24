import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/pages/charaacter_page/character_page.dart';
import 'package:rick_and_morty/pages/characters_page/characters_page.dart';

import 'assets/color_schemes.g.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.dark,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      // home: CharacterPage(
      //   id: 1,
      //   characterClient: context.read(),
      //   episodeClient: context.read(),
      // ),
      // home: LocationsPage(
      //   locationClient: context.read(),
      // ),
      // home: EpisodesPage(
      //   episodeClient: context.read(),
      // ),
      home: ChangeNotifierProvider(
        create: (_) => ValueNotifier<int?>(null),
        builder: (context, _) {
          final idController = context.watch<ValueNotifier<int?>>();
          final id = idController.value;
          return Navigator(
            onPopPage: (route, val) => true,
            pages: [
              MaterialPage(
                child: CharactersPage(
                  characterClient: context.read(),
                  episodeClient: context.read(),
                ),
              ),
              if (id != null)
                MaterialPage(
                  child: CharacterPage(
                    id: id,
                    characterClient: context.read(),
                    episodeClient: context.read(),
                  ),
                ),
            ],
          );
        },
      ),
    );
  }
}
