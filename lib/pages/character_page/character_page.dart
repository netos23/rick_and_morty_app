import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/pages/components/rick_and_morty_app_bar.dart';
import 'package:rick_and_morty/repositories/character_rep.dart';
import 'package:rick_and_morty/updater/futureUpdater.dart';

@RoutePage()
class CharacterPage extends StatefulWidget {
  const CharacterPage({Key? key, required this.character, }) : super(key: key);
  final Character character;

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: RickAndMortyAppBar(),
      ),
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              Image.network(widget.character.image),
              Text(widget.character.name),
              Text(widget.character.status),
            ],
          ),
        ),
      ),
    );
  }
}
