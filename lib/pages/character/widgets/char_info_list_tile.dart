import 'package:flutter/material.dart';
import 'package:rick_and_morty/network/model/character/character.dart';

class CharInfoListTile extends StatelessWidget {
  const CharInfoListTile({Key? key, required this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTile(title: const Text('Gender'), subtitle: Text(character.gender)),
        ListTile(title: const Text('Status'), subtitle: Text(character.status)),
        ListTile(
            title: const Text('Specie'), subtitle: Text(character.species)),
        ListTile(
            title: const Text('Origin'), subtitle: Text(character.origin.name)),
        ListTile(title: const Text('Type'), subtitle: Text(character.type)),
        ListTile(
            title: const Text('Location'),
            subtitle: Text(character.location.name)),
      ],
    );
  }
}
