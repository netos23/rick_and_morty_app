import 'dart:async';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/data/service/character_client.dart';
import 'package:rick_and_morty/data/service/episode_client.dart';
import 'package:rick_and_morty/favourites/favourites.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/model/episode.dart';
import 'package:rick_and_morty/navigation/app_router.dart';
import 'package:rick_and_morty/pages/characters_page/widgets/character_card.dart';
import 'package:rick_and_morty/util/pagination_builder.dart';
import 'package:rick_and_morty/util/path_id.dart';

@RoutePage()
class FavouritesPage extends StatefulWidget {
  const FavouritesPage({
    super.key,
  });

  @override
  State<FavouritesPage> createState() => _FavouritesPageState();
}

class _FavouritesPageState extends State<FavouritesPage> {
  CharacterClient get characterClient => context.read();

  Future<List<Character>> _loadCharacters(List<int> characters) async {
    final ids = characters.map((ch) => ch).join(',');
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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Favourites'),
      ),
      body: StoreConnector<Set<int>, Set<int>>(
        builder: (context, state) {
          return FutureBuilder(
            future: _loadCharacters(state.toList()),
            builder: (context, snapshot) {
              final characters = snapshot.data;

              if (characters == null) {
                return const Center(
                  child: CupertinoActivityIndicator(),
                );
              }

              return ListView.separated(
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                itemBuilder: (context, index) {
                  final character = characters[index];
                  return StoreConnector<Set<int>, bool>(
                    builder: (context, isFavourites) {
                      return StoreConnector<Set<int>, VoidCallback>(
                        builder: (context, callback) {
                          return CharacterCard(
                            onFavouriteTap: callback,
                            isFavourites: isFavourites,
                            onTap: () {
                              // before
                              context.router.navigate(
                                CharacterRoute(
                                  id: character.id,
                                  preview: character,
                                ),
                              );
                              // after
                            },
                            character: character,
                          );
                        },
                        converter: (store) => () {
                          final favourite = store.state.contains(character.id);
                          if (favourite) {
                            store.dispatch(RemoveAction(character.id));
                          } else {
                            store.dispatch(AddAction(character.id));
                          }
                        },
                      );
                    },
                    converter: (store) => store.state.contains(character.id),
                  );
                },
                separatorBuilder: (_, __) => const SizedBox(
                  height: 20,
                ),
                itemCount: characters.length,
              );
            },
          );
        },
        converter: (store) => store.state,
      ),
    );
  }
}
