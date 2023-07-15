import 'package:auto_route/auto_route.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/data/service/character_client.dart';
import 'package:rick_and_morty/data/service/episode_client.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/model/episode.dart';
import 'package:rick_and_morty/navigation/app_router.dart';
import 'package:rick_and_morty/pages/episodes_page/episodes_page.dart';
import 'package:rick_and_morty/util/path_id.dart';

@RoutePage()
class CharacterPage extends StatefulWidget {
  const CharacterPage({
    super.key,
    this.preview,
    required this.id,
  });

  final Character? preview;
  final int id;

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  CharacterClient get characterClient => context.read();

  EpisodeClient get episodeClient => context.read();

  Future<Character> _loadCharacter() async {
    try {
      final character = await characterClient.getCharacter(widget.id);
      return character;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  Future<List<Episode>> _loadEpisodes(List<String> characterEpisodes) async {

    final ids = characterEpisodes.map((e) => e.id).join(',');

    try {
      final episodes = await episodeClient.getMultipleEpisode(ids);
      return episodes;
    } catch (e) {
      debugPrint(e.toString());
    }

    return [];
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: FutureBuilder(
        initialData: widget.preview,
        future: _loadCharacter(),
        builder: (context, snapshot) {
          final character = snapshot.data;
          if (character == null) {
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
                    expandedHeight: 400,
                    flexibleSpace: FlexibleSpaceBar(
                      centerTitle: true,
                      title: Text(
                        character.name,
                      ),
                      background: ShaderMask(
                        blendMode: BlendMode.srcATop,
                        shaderCallback: (bounds) => LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Colors.transparent,
                            Colors.black.withOpacity(0.5),
                            Colors.black.withOpacity(0.7),
                            Colors.black,
                          ],
                          stops: const [
                            0.6,
                            0.75,
                            0.8,
                            1.0,
                          ],
                          tileMode: TileMode.mirror,
                        ).createShader(bounds),
                        child: Hero(
                          tag: character.id,
                          child: CachedNetworkImage(
                            fit: BoxFit.fill,
                            imageUrl: character.image,
                          ),
                        ),
                      ),
                    ),
                  ),
                  SliverList.list(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'Informations',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                      ListTile(
                        title: const Text('Gender'),
                        subtitle: Text(character.gender),
                        trailing: Icon(
                          _gender(character.gender),
                          size: 35,
                          color: theme.colorScheme.outline,
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Status'),
                        subtitle: Text(character.status),
                        trailing: Icon(
                          _status(character.status),
                          size: 35,
                          color: theme.colorScheme.outline,
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Specie'),
                        subtitle: Text(character.species),
                        trailing: Icon(
                          _specie(character.species),
                          size: 35,
                          color: theme.colorScheme.outline,
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Origin'),
                        subtitle: Text(character.origin.name),
                        trailing: const Icon(Icons.navigate_next),
                        onTap: () {
                          context.router.navigate(
                            LocationTab(children: [
                              LocationRoute(
                                id: character.origin.url.id,
                              ),
                            ]),
                          );
                        },
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Type'),
                        subtitle: Text(
                          character.type.isNotEmpty
                              ? character.type
                              : 'Missing',
                        ),
                        trailing: Icon(
                          Icons.search,
                          size: 35,
                          color: theme.colorScheme.outline,
                        ),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Location'),
                        subtitle: Text(character.origin.name),
                        trailing: const Icon(Icons.navigate_next),
                        onTap: () {
                          context.router.navigate(
                            LocationTab(children: [
                              LocationRoute(
                                id: character.origin.url.id,
                              ),
                            ]),
                          );
                        },
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.all(20),
                        child: Text(
                          'Episodes',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                  FutureBuilder(
                    future: _loadEpisodes(character.episode),
                    builder: (context, snapshot) {
                      final episodes = snapshot.data;
                      if (episodes == null) {
                        return SliverToBoxAdapter(
                          child: Container(),
                        );
                      }

                      return SliverPadding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16),
                        sliver: SliverGrid.builder(
                          gridDelegate:
                              const SliverGridDelegateWithMaxCrossAxisExtent(
                            maxCrossAxisExtent: 200,
                            childAspectRatio: 5 / 4,
                          ),
                          itemBuilder: (context, index) {
                            final episode = episodes[index];
                            return GestureDetector(
                              onTap: () {
                                context.router.navigate(
                                  EpisodeTab(children: [
                                    EpisodeRoute(
                                      id: character.episode[index].id,
                                    ),
                                  ]),
                                );
                              },
                              child: EpisodeCard(episode: episode),
                            );
                          },
                          itemCount: episodes.length,
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

  IconData? _gender(String gender) {
    return switch (gender) {
      'Male' => Icons.male,
      'Female' => Icons.female,
      _ => Icons.transgender,
    };
  }

  IconData? _status(String status) {
    return switch (status) {
      'Alive' => Icons.tag_faces,
      'Dead' => Icons.sentiment_dissatisfied_outlined,
      _ => Icons.sentiment_neutral,
    };
  }

  IconData? _specie(String specie) {
    return switch (specie) {
      'Alien' => Icons.font_download,
      'Human' => Icons.directions_run,
      'Humanoid' => Icons.android,
      _ => Icons.question_mark,
    };
  }
}
