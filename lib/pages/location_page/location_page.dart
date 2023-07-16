import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/model/location.dart';
import 'package:rick_and_morty/pages/components/character_card.dart';
import 'package:rick_and_morty/pages/components/default_app_bar.dart';
import 'package:rick_and_morty/pages/components/information_list_tile.dart';
import 'package:rick_and_morty/repositories/character_rep.dart';

@RoutePage()
class LocationPage extends StatelessWidget {
  const LocationPage({Key? key, required this.location}) : super(key: key);

  final Location location;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: DefaultAppBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: CustomScrollView(
            slivers: [
              SliverList.list(children: [
                const SizedBox(
                  height: 16,
                ),
                Image.asset('assets/location.png'),
                // у локации нет своей картинки :(
                const SizedBox(
                  height: 16,
                ),
                Text(
                  'Informations',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.secondary.withOpacity(0.54),
                    fontSize: 24,
                  ),
                ),
                InformationListTile(
                  title: 'Type',
                  subtitle: location.type,
                ),
                const Divider(height: 0),
                InformationListTile(
                  title: 'Dimension',
                  subtitle: location.dimension,
                ),
                Text(
                  'Residents',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.secondary.withOpacity(0.54),
                    fontSize: 24,
                  ),
                ),
              ]),
              FutureBuilder(
                future: _getCharacters(location.residents),
                builder: (context, snapshot) {
                  final characters = snapshot.data;
                  if (characters == null) {
                    return SliverToBoxAdapter(child: Container());
                  }
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      childCount: characters.length,
                      (context, index) {
                        return CharacterCard(character: characters[index]);
                      },
                    ),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Future<List<Character>> _getCharacters(List<String> characters) async {
    try {
      final result = await CharacterRepository().getCharactersByUrl(characters);
      return result;
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }
}
