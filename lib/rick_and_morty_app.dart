import 'package:flutter/material.dart';
import 'package:rick_and_morty/pages/character/characters_page.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          background: Colors.white,
        ),
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            height: 24 / 16,
          ),
        ),
      ),
      home: CharacterPage(),
    );
  }
}
