import 'package:flutter/material.dart';
import 'package:rick_and_morty/network/data/repository/episode_repository.dart';
import 'package:rick_and_morty/network/model/episode/episode.dart';
import 'package:rick_and_morty/network/util/dio_util.dart';
import 'package:rick_and_morty/network/util/path_id.dart';

class CharEpisodesListTile extends StatelessWidget {
  CharEpisodesListTile({super.key, required this.episodes});

  final List<String> episodes;

  final EpisodeRepository _episodeRepository = DioUtil().episodeRepository;

  Future<List<Episode>> getCharacterEpisodes() async {
    final ids = episodes.map((e) => e.id).join(',');
    List<Episode> episodesList =
        await _episodeRepository.getMultipleEpisode(ids);
    return episodesList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Episode>>(
      future: getCharacterEpisodes(),
      builder: (context, snapshot) {
        final episodes = snapshot.data;
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else if (episodes == null || episodes.isEmpty) {
          return const SliverToBoxAdapter(
            child: Center(
              child: CircularProgressIndicator(),
            ),
          );
        }
        return SliverList(
          delegate: SliverChildBuilderDelegate(
            (BuildContext context, int index) {
              final episode = episodes[index];
              return ListTile(
                title: Text(episode.episode),
                subtitle: Text(episode.name),
              );
            },
            childCount: episodes.length,
          ),
        );
      },
    );
  }
}
