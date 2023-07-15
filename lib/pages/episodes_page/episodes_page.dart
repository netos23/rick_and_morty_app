import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/service/service.dart';
import 'package:rick_and_morty/model/episode/episode.dart';
import 'package:rick_and_morty/util/builder/pagination_builder.dart';

class EpisodesPage extends StatelessWidget {
  const EpisodesPage({
    super.key,
    required this.appClient,
  });

  final AppClient appClient;

  Future<(List<Episode>, bool)> _loadEpisodes(int page) async {
    try {
      final pagination = await appClient.getEpisodes(
        page: page,
      );

      return (pagination.results, pagination.info.next != null);
    } catch (e) {
      debugPrint(e.toString());
    }
    return (<Episode>[], false);
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: SafeArea(
        child: PaginationBuilder<Episode>(
          paginationCallback: _loadEpisodes,
          builder: (context, controller, snapshot) {
            final episodes = snapshot.data;

            if (episodes == null) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }

            return GridView.builder(
              controller: controller,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                maxCrossAxisExtent: 200,
                childAspectRatio: 5 / 4,
              ),
              itemBuilder: (context, index) {
                final episode = episodes[index];
                return EpisodeCard(episode: episode);
              },
              itemCount: episodes.length,
            );
          },
        ),
      ),
    );
  }
}

class EpisodeCard extends StatelessWidget {
  const EpisodeCard({
    super.key,
    required this.episode,
  });

  final Episode episode;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(10),
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 4,
            child: CachedNetworkImage(
              imageUrl:
                  'https://avatars.mds.yandex.net/i?id=4e04225c37e203c8277f4bb1eff7c6afa49c4b2d-9036239-images-thumbs&n=13',
              fit: BoxFit.fill,
            ),
          ),
          Expanded(
            child: Center(
              child: Text(
                episode.name,
                textAlign: TextAlign.center,
                style: theme.textTheme.bodyLarge?.copyWith(
                  color: theme.colorScheme.onSurface,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
