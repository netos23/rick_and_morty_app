import 'package:flutter/material.dart';
import 'package:rick_and_morty/future_updater.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/rick_and_morty_app.dart';

class CharacterContact extends StatelessWidget {
  const CharacterContact({
    super.key,
  });

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
            errorBuilder: (context, error, data) => Text('$error'),
            builder: (context, data) {
              final character = data;
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      character!.image),
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