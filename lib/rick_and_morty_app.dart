import 'package:flutter/material.dart';
import 'package:rick_and_morty/pages/character/character_page.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CharacterPage(),
    );
  }
}
