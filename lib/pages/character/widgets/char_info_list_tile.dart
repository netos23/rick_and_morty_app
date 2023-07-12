import 'package:flutter/material.dart';
import 'package:rick_and_morty/network/model/character/character.dart';
import 'package:rick_and_morty/pages/character/widgets/list_tile_item.dart';

class CharInfoListTile extends StatelessWidget {
  const CharInfoListTile({Key? key, required this.character}) : super(key: key);

  final Character character;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ListTileItem(
            title: 'Gender', subtitle: character.gender),
        ListTileItem(
            title: 'Status', subtitle: character.status),
        ListTileItem(
            title: 'Specie', subtitle: character.species),
        ListTileItem(
            title: 'Origin', subtitle: character.origin.name),
        ListTileItem(title: 'Type', subtitle: character.type),
        ListTileItem(
            title: 'Location',
            subtitle: character.location.name),
      ],
    );
  }
}
