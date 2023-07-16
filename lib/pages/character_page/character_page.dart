import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/model/episode.dart';
import 'package:rick_and_morty/pages/components/default_app_bar.dart';
import 'package:rick_and_morty/pages/components/information_list_tile.dart';
import 'package:rick_and_morty/repositories/episode_rep.dart';

@RoutePage()
class CharacterPage extends StatelessWidget {
  const CharacterPage({
    Key? key,
    required this.character,
  }) : super(key: key);
  final Character character;

  Future<List<Episode>> _getEpisodes(List<String> episodes) async {
    try {
      final result = await EpisodeRepository().getEpisodesByUrl(episodes);
      return result;
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: DefaultAppBar(),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 16, right: 16),
          child: CustomScrollView(slivers: [
            const SliverToBoxAdapter(
              child: SizedBox(
                height: 16,
              ),
            ),
            CharacterInformation(character: character),
            FutureBuilder(
              future: _getEpisodes(character.episode),
              builder: (context, snapshot) {
                final episodes = snapshot.data;
                if (episodes == null) {
                  return SliverToBoxAdapter(child: Container());
                }
                return SliverList(
                    delegate: SliverChildBuilderDelegate(
                  childCount: episodes.length,
                  (context, index) {
                    return InformationListTile(
                      title: episodes[index].episode,
                      subtitle: episodes[index].name,
                    );
                  },
                ));
              },
            )
          ]),
        ),
      ),
    );
  }
}

class CharacterInformation extends StatelessWidget {
  const CharacterInformation({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return SliverList.list(
      children: [
        Center(
          child: Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey.shade300, width: 4),
              shape: BoxShape.circle,
              image: DecorationImage(
                image: NetworkImage(character.image),
              ),
            ),
          ),
        ),
        Center(
          child: Text(
            character.name,
            style: theme.textTheme.headlineLarge?.copyWith(color: Colors.black),
          ),
        ),
        Text(
          'Informations',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.secondary.withOpacity(0.54),
            fontSize: 24,
          ),
        ),
        Column(
          children: [
            InformationListTile(title: 'Gender', subtitle: character.gender),
            const Divider(height: 0),
            InformationListTile(title: 'Status', subtitle: character.status),
            const Divider(height: 0),
            InformationListTile(title: 'Specie', subtitle: character.species),
            const Divider(height: 0),
            InformationListTile(
                title: 'Origin', subtitle: character.origin.name),
            const Divider(height: 0),
            InformationListTile(
                title: 'Type',
                subtitle: character.type == '' ? 'Unknown' : character.type),
            const Divider(height: 0),
            InformationListTile(
                title: 'Location', subtitle: character.location.name),
          ],
        ),
        Text(
          'Episodes',
          style: theme.textTheme.bodySmall?.copyWith(
            color: theme.colorScheme.secondary.withOpacity(0.54),
            fontSize: 24,
          ),
        ),
      ],
    );
  }
}
