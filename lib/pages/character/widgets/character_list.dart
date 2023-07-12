import 'package:flutter/material.dart';
import 'package:rick_and_morty/network/model/character/character.dart';

class CharacterItem extends StatelessWidget {
  final Character character;

  const CharacterItem({super.key, required this.character});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 3,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.network(
              character.image,
              fit: BoxFit.cover,
              height: 300,
            ),
            ListTile(
              title: Text(
                character.name,
                style: const TextStyle(fontWeight: FontWeight.bold),
              ),
              subtitle: Text(character.species),
            ),
          ],
        ),
      ),
    );
  }
}
