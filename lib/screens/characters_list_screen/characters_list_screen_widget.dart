import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/model/character.dart';
import 'package:rick_and_morty/navigation/app_router.gr.dart';
import 'package:rick_and_morty/utils/pagination_builder.dart';
import 'characters_list_screen_wm.dart';
import 'widgets/short_char_card.dart';

@RoutePage()
class CharactersListScreenWidget
    extends ElementaryWidget<ICharactersListScreenWidgetModel> {
  const CharactersListScreenWidget({
    Key? key,
    WidgetModelFactory wmFactory =
        defaultCharactersListScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(ICharactersListScreenWidgetModel wm) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Персонажи"),
      ),
      backgroundColor: wm.colorScheme.background,
      body: PaginationBuilder<Character>(
        paginationCallback: wm.loadMore,
        builder: (context, controller, snapshot) {
          final characters = snapshot.data;
          if (characters == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (characters.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return GridView.builder(
            controller: controller,
            gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
              maxCrossAxisExtent: 200,
              childAspectRatio: 7 / 10,
            ),
            itemCount: characters.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  context.tabsRouter.navigate(
                    FindRoute(
                      id: characters[index].id,
                      preview: characters[index],
                    ),
                  );
                },
                child: ShortCharCard(
                  char: characters[index],
                ),
              );
            },
          );
        },
      ),
    );
  }
}
