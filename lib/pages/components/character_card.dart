import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/route/app_router.dart';

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return InkWell(
      onTap: () {
        AutoRouter.of(context).navigate(
            CharacterTab(children: [CharacterRoute(character: character)]));
      },
      child: Card(
          clipBehavior: Clip.antiAliasWithSaveLayer,
          shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(4))),
          elevation: 4,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AspectRatio(
                aspectRatio: 1.2,
                child: Image.network(
                  character.image,
                  fit: BoxFit.fitWidth,
                  errorBuilder: (_, __, ___) =>
                      Image.asset('assets/noPic.jpeg'),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      character.name,
                      style: theme.textTheme.headlineSmall,
                    ),
                    Text(
                      character.species,
                      style: theme.textTheme.bodySmall,
                    )
                  ],
                ),
              )
            ],
          )),
    );
  }
}
