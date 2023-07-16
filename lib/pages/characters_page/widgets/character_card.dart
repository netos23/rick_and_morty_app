import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character/character.dart';

import 'info_board.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 3 / 5,
      child: Card(
        clipBehavior: Clip.antiAlias,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(10),
          ),
        ),
        margin: EdgeInsets.zero,
        child: DefaultTextStyle(
          style: const TextStyle(),
          child: Column(
            children: [
              Expanded(
                flex: 3,
                //TODO: Hero
                child: Hero(
                  tag: character.id,
                  child: CachedNetworkImage(
                    imageUrl: character.image,
                    fit: BoxFit.fitWidth,
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: InfoBoard(
                  character: character,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
