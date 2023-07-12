import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/model/character.dart';

class CharCard extends StatelessWidget {
  const CharCard({Key? key, required this.char}) : super(key: key);

  final Character? char;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final character = char;

    if (character == null) {
      return const Center(
        child: Text("По такому id ничего не найдено"),
      );
    }
    return Column(
      children: [
        Image.network(character.image),
        Text(
          "name: ${character.name}",
          style: textTheme.bodyLarge?.copyWith(color: Colors.black),
        ),
        Text("status: ${character.status}",
          style: textTheme.bodyLarge?.copyWith(color: Colors.black),
        ),
        Text("species: ${character.species}",
          style: textTheme.bodyLarge?.copyWith(color: Colors.black),
        ),
      ],
    );
  }
}
