import 'package:flutter/material.dart';
import 'package:rick_and_morty/network/model/episode/episode.dart';
import 'package:rick_and_morty/network/repository/episode_repository.dart';
import 'package:rick_and_morty/network/utils/dio_util.dart';

class CharEpisodesListTile extends StatelessWidget {
   CharEpisodesListTile({super.key, required this.episodes});

  final List<String> episodes;

  final EpisodeRepository _episodeRepository = DioUtil().episodeRepository;

  Future<List<Episode>> getCharacterEpisodes() async {
    List<Episode> episodesList = [];
    for (final episode in episodes) {
      final res = (await _episodeRepository
          .getEpisode(int.parse(episode[episode.length - 1])));
      episodesList.add(res);
    }
    print('aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa');
    return episodesList;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Episode>>(
      future: getCharacterEpisodes(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(child: Text(snapshot.error.toString()));
        } else if (!snapshot.hasData && !snapshot.hasError) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return ListView.builder(
          itemCount: snapshot.data!.length,
          itemBuilder: (BuildContext context, int index) {
            final episode = snapshot.data![index];
            return ListTile(
              title: Text(episode.episode),
              subtitle: Text(episode.name),
            );
          },
        );
      },
    );
  }
}
