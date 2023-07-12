import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/repositories/character_rep.dart';
import 'package:rick_and_morty/updater/futureUpdater.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({Key? key, required this.id}) : super(key: key);
  final int id; // специально передаем id, чтобы протестить futureUpdater

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureUpdater<Character>(
        future: CharacterRepository().getCharacterById(widget.id),
        errorBuilder: (_, __, ___) {
          return const Center(child: Text('Произошла ошибка'));
        },
        loadingBuilder: (_) => const Center(
          child: CircularProgressIndicator(),
        ),
        builder: (context, snapshot) {
          return Column(
            children: [
              Image.network('${snapshot?.image}'),
              Text('${snapshot?.name}'),
              Text('${snapshot?.status}'),
            ],
          );
        },
      ),
    );
  }
}
