
import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/model/character.dart';
import 'package:rick_and_morty/data/model/episode.dart';
import 'package:rick_and_morty/navigation/app_router.gr.dart';
import 'package:rick_and_morty/screens/components/char_card.dart';
import 'package:rick_and_morty/screens/components/other_type_tile.dart';
import 'package:rick_and_morty/screens/components/search_widget.dart';
import 'find_screen_wm.dart';

@RoutePage()
class FindScreenWidget extends ElementaryWidget<IFindScreenWidgetModel> {
  const FindScreenWidget({
    Key? key,
    this.id,
    this.preview,
    WidgetModelFactory wmFactory = defaultFindScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  final int? id;
  final Character? preview;

  @override
  Widget build(IFindScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Rick and Morty"),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            //очень хотел красивый сливер аппбар с pinned строкой поиска
            //но не разобрался, аппбар много места занимает
            child: SearchWidget(
              controller: wm.searchController,
            ),
          ),
        ),
        centerTitle: true,
      ),
      body: EntityStateNotifierBuilder(
        listenableEntityState: wm.charState,
        loadingBuilder: (context, value) {
          final char = value;
          if (char != null) {
            return CustomScrollView(
              slivers: [
                CharCard(char: char),
              ],
            );
          }
          return const Center(child: CircularProgressIndicator());
        },
        errorBuilder: (context, __, ___) {
          return Center(
            //костыль-заглушка, правильно было бы сделать валидацию
            //у textField, но времени мало с ней возиться(
            child: Text(
              "Неправильный формат id",
              style: wm.textTheme.bodyLarge,
            ),
          );
        },
        builder: (context, char) {
          final character = char;
          if (character == null) {
            return Center(
              child: Text(
                "Персонаж не найден",
                style: wm.textTheme.bodyLarge,
              ),
            );
          }
          return CustomScrollView(
            slivers: [
              CharCard(
                char: character,
              ),
              EntityStateNotifierBuilder(
                listenableEntityState: wm.episodesState,
                builder: (context, episodes) {
                  final episodeList = episodes ?? <Episode>[];

                  return SliverList.builder(
                    itemCount: episodeList.length + 1,
                    itemBuilder: (context, index) {
                      if (index == 0) {
                        return Text(
                          episodeList.isEmpty
                              ? "No episodes found"
                              : "Episodes:",
                          style: wm.textTheme.headlineMedium
                              ?.copyWith(color: wm.colorScheme.onBackground),
                          textAlign: TextAlign.center,
                        );
                      }

                      return OtherTypeTile(
                        name: episodeList[index - 1].name,
                        onTap: () {
                          context.tabsRouter.setActiveIndex(2);
                          context.tabsRouter.navigate(EpisodeRoute(episode: episodeList[index - 1]));
                        },
                      );
                    },
                  );
                },
              ),
            ],
          );
        },
      ),
    );
  }
}
