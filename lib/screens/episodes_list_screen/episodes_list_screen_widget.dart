import 'package:auto_route/auto_route.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/model/episode.dart';
import 'package:rick_and_morty/navigation/app_router.gr.dart';
import 'package:rick_and_morty/screens/components/other_type_tile.dart';
import 'package:rick_and_morty/utils/pagination_builder.dart';
import 'episodes_list_screen_wm.dart';

@RoutePage()
class EpisodesListScreenWidget extends ElementaryWidget<IEpisodesListScreenWidgetModel> {
  const EpisodesListScreenWidget({
    Key? key,
    WidgetModelFactory wmFactory = defaultEpisodesListScreenWidgetModelFactory,
  }) : super(wmFactory, key: key);

  @override
  Widget build(IEpisodesListScreenWidgetModel wm) {
    return  Scaffold(
        appBar: AppBar(
          title: const Text("Локации"),
        ),
        body: PaginationBuilder<Episode>(
          paginationCallback: wm.loadMore,
          builder: (context, controller, snapshot) {
            final episodes = snapshot.data;
            if (episodes == null || episodes.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return ListView.builder(
                itemCount: episodes.length,
                controller: controller,
                itemBuilder: (context, index) {
                  return OtherTypeTile(
                    name: episodes[index].name,
                    onTap: () => context.router
                        .navigate(EpisodeRoute(episode: episodes[index])),
                  );
                });
          },
        ));

  }
}
