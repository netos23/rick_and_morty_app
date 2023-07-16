import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/network/data/repository/episode_repository.dart';
import 'package:rick_and_morty/network/model/episode/episode.dart';
import 'package:rick_and_morty/network/util/dio_util.dart';
import 'package:rick_and_morty/network/util/path_id.dart';
import 'package:rick_and_morty/router/app_router.dart';

class CharEpisodesListTile extends StatelessWidget {
  CharEpisodesListTile({super.key, required this.episodes});

  final List<String> episodes;

  final EpisodeRepository _episodeRepository = DioUtil().episodeRepository;

  Future<List<Episode>> getCharacterEpisodes() async {
    List<Episode> episodesList = [];
    if (episodes.length > 1) {
      final ids = episodes.map((e) => e.id).join(',');
      episodesList = await _episodeRepository.getMultipleEpisode(ids);
    } else {
      final episode = await _episodeRepository.getEpisode(episodes.first.id);
      episodesList.add(episode);
    }
    return episodesList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Episode>>(
      future: getCharacterEpisodes(),
      builder: (context, snapshot) {
        final episodes = snapshot.data;
        if (snapshot.hasError) {
          return SliverToBoxAdapter(child: Center(child: Text(snapshot.error.toString())));
        } else if (episodes == null) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return episodes.isEmpty
            ? const SliverToBoxAdapter(
                child: Text(
                    'episodes are missing'))
            : DividerTheme(
                data: const DividerThemeData(
                  indent: 15,
                  endIndent: 15,
                ),
                child: SliverList.separated(
                  itemCount: episodes.length,
                  itemBuilder: (BuildContext context, int index) {
                    final episode = episodes[index];
                    return ListTile(
                      trailing: IconButton(
                        onPressed: () {
                          context.router.navigate(
                            EpisodeTab(children: [
                              EpisodeItemPageRoute(
                                  id: episode.id, episode: episode),
                            ]),
                          );
                          // не работает, спросить, как сделать в этой же табе
                          // context.router.navigate(
                          //   EpisodeItemPageRoute(episode: episode),
                          // );
                        },
                        icon: const Icon(Icons.keyboard_arrow_right_outlined),
                      ),
                      title: Text(episode.episode),
                      subtitle: Text(episode.name),
                    );
                  },
                  separatorBuilder: (_, __) => const Divider(),
                ),
              );
      },
    );
  }
}
