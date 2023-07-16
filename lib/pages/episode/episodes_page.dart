import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/network/data/dto/pagination/pagination.dart';
import 'package:rick_and_morty/network/data/repository/episode_repository.dart';
import 'package:rick_and_morty/network/model/episode/episode.dart';
import 'package:rick_and_morty/network/util/dio_util.dart';
import 'package:rick_and_morty/pages/widgets/app_bar_widget.dart';
import 'package:rick_and_morty/router/app_router.dart';

@RoutePage()
class EpisodesPage extends StatefulWidget {
  const EpisodesPage({super.key});

  @override
  State<EpisodesPage> createState() => _EpisodesPageState();
}

class _EpisodesPageState extends State<EpisodesPage> {
  final EpisodeRepository _episodeRepository = DioUtil().episodeRepository;

  @override
  void initState() {
    super.initState();
  }

  Future<Pagination<Episode>> getEpisodes() async {
    final res = await _episodeRepository.getEpisodes();
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: FutureBuilder(
        future: getEpisodes(),
        builder: (context, snapshot) {
          final episodes = snapshot.data;
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (episodes == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Image.asset(
                    'assets/images/episode_logo.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    childCount: episodes.results.length,
                    (BuildContext context, int index) {
                      final episode = episodes.results[index];
                      return GestureDetector(
                          onTap: () {
                            context.router.push(
                              EpisodeItemPageRoute(
                                id: episode.id,
                                episode: episode,
                              ),
                            );
                          },
                          child: Card(
                            margin: const EdgeInsets.symmetric(vertical: 10),
                            elevation: 3,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: ListTile(
                                title: Text(
                                  episode.name,
                                  style: const TextStyle(
                                      fontWeight: FontWeight.bold),
                                ),
                                subtitle: Text(episode.episode),
                              ),
                            ),
                          ));
                    },
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
