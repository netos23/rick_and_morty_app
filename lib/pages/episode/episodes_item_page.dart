import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/network/data/repository/episode_repository.dart';
import 'package:rick_and_morty/network/model/episode/episode.dart';
import 'package:rick_and_morty/network/util/dio_util.dart';
import 'package:rick_and_morty/pages/character/widgets/arrow_back_tile.dart';
import 'package:rick_and_morty/pages/widgets/app_bar_widget.dart';

@RoutePage()
class EpisodeItemPage extends StatefulWidget {
  const EpisodeItemPage({
    super.key,
    required this.id,
    this.episode,
  });

  final int id;
  final Episode? episode;

  @override
  State<EpisodeItemPage> createState() => _EpisodeItemPageState();
}

class _EpisodeItemPageState extends State<EpisodeItemPage> {
  final EpisodeRepository _episodeRepository = DioUtil().episodeRepository;

  @override
  void initState() {
    super.initState();
  }

  Future<Episode> getEpisode() async {
    final res = await _episodeRepository.getEpisode(widget.id);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: FutureBuilder<Episode>(
          initialData: widget.episode,
          future: getEpisode(),
          builder: (context, snapshot) {
            final episode = snapshot.data;
            if (episode != null) {
             return Center(child: Text(episode.name),);
            }
            return Center(child: Text(snapshot.error.toString()));
          },
        ),
      ),
    );
  }
}
