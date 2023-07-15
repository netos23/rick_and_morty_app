import 'package:flutter/material.dart';
import 'package:rick_and_morty/network/model/character/character.dart';

class CharInfoList extends StatelessWidget {
  const CharInfoList({super.key, required this.character});

  final Character character;

  @override
  Widget build(BuildContext context) {
    final themeData = Theme.of(context);
    return SliverList.list(
      children: [
        Container(
          margin: const EdgeInsets.only(top: 32, bottom: 25),
          alignment: Alignment.centerLeft,
          child: Text(
            'Informations',
            style: themeData.textTheme.titleMedium,
          ),
        ),
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
        Container(
          margin: const EdgeInsets.only(top: 52, bottom: 26),
          alignment: Alignment.centerLeft,
          child: Text(
            'Episodes',
            style: themeData.textTheme.titleMedium,
          ),
        ),
      ],
    );
  }
}