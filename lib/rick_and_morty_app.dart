import 'package:flutter/material.dart';
import 'package:rick_and_morty/future_updater.dart';
import 'package:rick_and_morty/service/service.dart';
import 'package:dio/dio.dart';

import 'model/character.dart';

Future<Character> getCharacter(int id) async {
  final dio = Dio();
  dio.options.baseUrl = 'https//rickandmortyapi.com';
  final api = RestClient(dio);
  try {
    final character = await api.getCharacter(id);
    return character;
  } catch (error) {
    throw Exception('Failed to get character: $error');
  }
}

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Contacts'),
      ),
      body: Column(
        children: [
          FutureUpdater<Character>(
            future: getCharacter(2),
            loadingBuilder: (context) => const CircularProgressIndicator(),
            errorBuilder: (context, error, data) => Text('Error: $error'),
            builder: (context, data) {
              final character = data;
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      character!.image), // force легален, тк данные точно есть
                ),
                title: Text(character.name),
                subtitle: Text('Status: ${character.status}'),
              );
            },
          ),
        ],
      ),
    );
  }
}
