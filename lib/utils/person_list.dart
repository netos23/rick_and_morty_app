import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../app_router.gr.dart';
import '../ui/details_page.dart';
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
        return InkWell(
          onTap: () {
            AutoRouter.of(context).push(DetailsRoute(character: character));
          },
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
  }
}
