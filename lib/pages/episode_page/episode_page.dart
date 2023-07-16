import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/model/episode.dart';
import 'package:rick_and_morty/model/location.dart';
import 'package:rick_and_morty/pages/components/character_card.dart';
import 'package:rick_and_morty/pages/components/default_app_bar.dart';
import 'package:rick_and_morty/pages/components/information_list_tile.dart';
import 'package:rick_and_morty/repositories/character_rep.dart';

@RoutePage()
class EpisodePage extends StatelessWidget {
  const EpisodePage({Key? key, required this.episode}) : super(key: key);

  final Episode episode;

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
                  title: 'Name',
                  subtitle: episode.name,
                ),
                InformationListTile(
                  title: 'Episode',
                  subtitle: episode.episode,
                ),
                InformationListTile(
                  title: 'Date',
                  subtitle: episode.airDate,
                ),
                Text(
                  'Cast',
                  style: theme.textTheme.bodySmall?.copyWith(
                    color: theme.colorScheme.secondary.withOpacity(0.54),
                    fontSize: 24,
                  ),
                ),
              ]),
              FutureBuilder(
                future: _getCharacters(episode.characters),
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
