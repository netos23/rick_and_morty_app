import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/data/service/location_client.dart';
import 'package:rick_and_morty/model/location.dart';
import 'package:rick_and_morty/util/path_id.dart';

import '../../data/service/character_client.dart';
import '../../model/character.dart';
import '../../navigation/app_router.dart';
import '../character/widgets/character_card.dart';

@RoutePage()
class LocationPage extends StatefulWidget {
  const LocationPage({
    super.key,
    this.preview,
    required this.id,
  });

  final Location? preview;
  final int id;

  @override
  State<LocationPage> createState() => _LocationPageState();
}

class _LocationPageState extends State<LocationPage> {
  LocationClient get locationClient => context.read();

  Future<Location> _loadLocation(int id) async {
    try {
      final location = await locationClient.getLocation(id);
      return location;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  CharacterClient get characterClient => context.read();

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

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Scaffold(
      body: FutureBuilder(
        initialData: widget.preview,
        future: _loadLocation(widget.id),
        builder: (context, snapshot) {
          final location = snapshot.data;
          if (location == null) {
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
                    title: Text(location.name),
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
                        subtitle: Text(location.url),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Type'),
                        subtitle: Text(location.type),
                      ),
                      const Divider(),
                      ListTile(
                        title: const Text('Dimension'),
                        subtitle: Text(location.dimension),
                      ),
                      const Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Text(
                          'Residents',
                          style: theme.textTheme.headlineSmall?.copyWith(
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                      ),
                    ],
                  ),
                  FutureBuilder(
                    future: _loadCharacter(location.residents),
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
                            return GestureDetector(
                              onTap: () {
                                context.router.navigate(
                                  CharacterTab(children: [
                                    CharacterRoute(
                                      id: character.id,
                                    ),
                                  ]),
                                );
                              },
                              child: CharacterCard(
                                character: character,
                              ),
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
