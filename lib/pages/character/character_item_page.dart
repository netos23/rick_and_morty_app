import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/network/data/repository/episode_repository.dart';
import 'package:rick_and_morty/network/model/character/character.dart';
import 'package:rick_and_morty/network/model/episode/episode.dart';
import 'package:rick_and_morty/network/util/dio_util.dart';
import 'package:rick_and_morty/network/util/path_id.dart';
import 'package:rick_and_morty/pages/character/widgets/arrow_back_tile.dart';
import 'package:rick_and_morty/pages/character/widgets/char_episodes_list_tile.dart';
import 'package:rick_and_morty/pages/character/widgets/char_info_list_tile.dart';
import 'package:rick_and_morty/pages/character/widgets/circle_avatar.dart';
import 'package:rick_and_morty/pages/widgets/app_bar_widget.dart';

class CharacterItemPage extends StatefulWidget {
  const CharacterItemPage({
    Key? key,
    required this.character,
  }) : super(key: key);

  final Character character;

  @override
  State<CharacterItemPage> createState() => _CharacterItemPageState();
}

class _CharacterItemPageState extends State<CharacterItemPage> {
  final EpisodeRepository _episodeRepository = DioUtil().episodeRepository;

  @override
  void initState() {
    super.initState();
  }

  Future<List<Episode>> getCharacterEpisodes() async {
    final ids = widget.character.episode.map((e) => e.id).join(',');
    List<Episode> episodesList =
        await _episodeRepository.getMultipleEpisode(ids);
    return episodesList;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                children: [
                  const ArrowBackTile(),
                  CircleAvatarWidget(
                    image: widget.character.image,
                  ),
                  Text(
                    widget.character.name,
                    style: GoogleFonts.roboto(
                      fontSize: 32,
                      fontWeight: FontWeight.w400,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                ],
              ),
            ),
            CharInfoList(
              character: widget.character,
            ),
            CharEpisodesListTile(
              episodes: widget.character.episode,
            ),
          ],
        ),
      ),
    );
  }
}
