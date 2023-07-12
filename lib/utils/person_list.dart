import 'package:animations/animations.dart';
import 'package:flutter/material.dart';

import '../ui/detailspage.dart';
import '/utils/person_item.dart';
import '/models/character.dart';

class PersonList extends StatelessWidget {
  const PersonList({Key? key, required this.characters}) : super(key: key);

  final List<Character> characters;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (ctx, index) {
        final Character character = characters[index];
        return OpenContainer(
          tappable: false,
          closedElevation: 0,
          transitionDuration: const Duration(milliseconds: 100),
          transitionType: ContainerTransitionType.fadeThrough,
          openBuilder: (ctx, _) => DetailsPage(character: character),
          closedBuilder: (ctx, openContainer) {
            return InkWell(
              onTap: () => openContainer(),
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 2,
                ),
                child: PersonItem(character: character),
              ),
            );
          },
        );
      },
    );
  }
}
