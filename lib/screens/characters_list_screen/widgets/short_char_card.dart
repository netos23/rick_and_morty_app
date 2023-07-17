import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/model/character.dart';

class ShortCharCard extends StatelessWidget {
  const ShortCharCard({Key? key, required this.char}) : super(key: key);

  final Character char;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final colorTheme = Theme.of(context).colorScheme;
    return Card(
      color: colorTheme.background,
      elevation: 0,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 8,
            child: Hero(
              tag: char.id,
              child: CachedNetworkImage(
                imageUrl: char.image,
                fit: BoxFit.cover,
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Center(
              child: Text(
                maxLines: 2,
                char.name,
                style: textTheme.bodyMedium?.copyWith(
                  height: 1.5
                ),
                textAlign: TextAlign.center,


              ),
            ),
          )
        ],
      ),
    );
  }
}
