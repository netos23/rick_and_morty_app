import 'package:flutter/material.dart';
import 'package:rick_and_morty/pages/character_contact_page.dart';
import 'package:rick_and_morty/service/service.dart';
import 'package:dio/dio.dart';

import 'model/character.dart';

Future<Character> getCharacter(int id) async {
  final dio = Dio();
  dio.options.baseUrl = 'https//rickandmortyapi.com';
  final api = CharacterClient(dio);
  try {
    final character = await api.getCharacter(id);
    return character;
  } catch (error, stackTrace) {
    throw Exception('Failed to get character: $error, $stackTrace');
  }
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CharacterContact(),
    );
  }
}