import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';

import 'info_board.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.character,
    this.onTap,
    required this.isFavourites,
    this.onFavouriteTap,
  });

  final bool isFavourites;
  final VoidCallback? onFavouriteTap;
  final Character character;
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    return Hero(
      tag: character.url,
      child: InkResponse(
        onTap: onTap,
        child: AspectRatio(
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
              style: TextStyle(),
              child: Column(
                children: [
                  Expanded(
                    flex: 3,
                    child: CachedNetworkImage(
                      imageUrl: character.image,
                      fit: BoxFit.fitWidth,
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: InfoBoard(
                      isFavourites: isFavourites,
                      onFavouriteTap: onFavouriteTap,
                      character: character,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
