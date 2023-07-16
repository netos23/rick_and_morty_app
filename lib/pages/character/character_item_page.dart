import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/network/data/repository/character_repository.dart';
import 'package:rick_and_morty/network/model/character/character.dart';
import 'package:rick_and_morty/network/util/dio_util.dart';
import 'package:rick_and_morty/pages/character/widgets/arrow_back_tile.dart';
import 'package:rick_and_morty/pages/character/widgets/char_episodes_list_tile.dart';
import 'package:rick_and_morty/pages/character/widgets/char_info_list_tile.dart';
import 'package:rick_and_morty/pages/character/widgets/circle_avatar.dart';
import 'package:rick_and_morty/pages/widgets/app_bar_widget.dart';

@RoutePage()
class CharacterItemPage extends StatefulWidget {
  const CharacterItemPage({
    super.key,
    required this.id,
    this.preview,
  });

  final int id;
  final Character? preview;

  @override
  State<CharacterItemPage> createState() => _CharacterItemPageState();
}

class _CharacterItemPageState extends State<CharacterItemPage> {
  final CharacterRepository _characterRepository =
      DioUtil().characterRepository;

  @override
  void initState() {
    super.initState();
  }

  Future<Character> getCharacter() async {
    final res = await _characterRepository.getCharacter(widget.id);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: FutureBuilder<Character>(
          initialData: widget.preview,
          future: getCharacter(),
          builder: (context, snapshot) {
            final character = snapshot.data;
            if (character != null) {
              return CustomScrollView(
                slivers: [
                  SliverToBoxAdapter(
                    child: Column(
                      children: [
                        const ArrowBackTile(),
                        Hero(
                          tag: 'character_image',
                          child: CircleAvatarWidget(
                            image: widget.preview?.image,
                          ),
                        ),
                        Text(
                          widget.preview?.name ?? 'unknow',
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
                    character: character,
                  ),
                  CharEpisodesListTile(
                    episodes: character.episode,
                  ),
                ],
              );
            }
            return Center(child: Text(snapshot.error.toString()));
          },
        ),
      ),
    );
  }
}
