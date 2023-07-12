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
        errorBuilder: (p0, p1, p2) {
          return const Center(child: Text('Произошла ошибка'));
        },
        loadingBuilder: (p0) {
          return const Center(child: CircularProgressIndicator());
        },
        builder: (context, snapshot) {
          return Text('12');
        },
      ),
    );
  }
}
