import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/service/character_client.dart';
import 'package:rick_and_morty/data/service/episode_client.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/model/episode.dart';
import 'package:rick_and_morty/pages/characters_page/widgets/character_card.dart';
import 'package:rick_and_morty/util/path_id.dart';

class EpisodePage extends StatelessWidget {
  const EpisodePage({
    super.key,
    required this.episodeClient,
    required this.characterClient,
    this.preview,
    required this.id,
  });

  final EpisodeClient episodeClient;
  final CharacterClient characterClient;

  final Episode? preview;
  final int id;

  Future<List<Character>> _loadCharacter(List<String> characters) async {
    final ids = characters.map((ch) => ch.id).join(',');
    try {
      final characters = await characterClient.getMultipleCharacters(ids);
      return characters;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<Episode> _loadEpisode(int id) async {
    try {
      final episodes = await episodeClient.getEpisode(id);
      return episodes;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: FutureBuilder(
        initialData: preview,
        future: _loadEpisode(id),
        builder: (context, snapshot) {
          final episode = snapshot.data;
          if (episode == null) {
            return const Center(
              child: CupertinoActivityIndicator(),
            );
          }

          return DividerTheme(
            data: const DividerThemeData(
              indent: 30,
              endIndent: 30,
            ),
            child: ListTileTheme.merge(
              contentPadding: const EdgeInsets.only(left: 30, right: 20),
              titleTextStyle: theme.textTheme.bodyLarge?.copyWith(
                color: theme.colorScheme.onBackground,
              ),
              subtitleTextStyle: theme.textTheme.bodyMedium,
              textColor: theme.colorScheme.onBackground,
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    pinned: true,
                    title: Text(episode.name),
                  ),
                  SliverList.list(
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text(
                          'Informations',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                      ListTile(
                        title: const Text('Url'),
                        subtitle: Text(episode.url),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('AirDate'),
                        subtitle: Text(episode.airDate),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text(
                          'Characters',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                  FutureBuilder(
                    future: _loadCharacter(episode.characters),
                    builder: (context, snapshot) {
                      final characters = snapshot.data;
                      if (characters == null) {
                        return SliverToBoxAdapter(
                          child: Container(),
                        );
                      }

                      return SliverPadding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 20),
                        sliver: SliverList.separated(
                          itemBuilder: (context, index) {
                            final character = characters[index];
                            return CharacterCard(
                              character: character,
                            );
                          },
                          separatorBuilder: (_, __) => const SizedBox(
                            height: 20,
                          ),
                          itemCount: characters.length,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
