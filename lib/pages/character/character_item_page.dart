import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/network/model/character/character.dart';
import 'package:rick_and_morty/pages/character/widgets/arrow_back_tile.dart';
import 'package:rick_and_morty/pages/character/widgets/char_episodes_list_tile.dart';
import 'package:rick_and_morty/pages/character/widgets/char_info_list_tile.dart';
import 'package:rick_and_morty/pages/character/widgets/circle_avatar.dart';
import 'package:rick_and_morty/pages/widgets/app_bar_widget.dart';


@RoutePage()
class CharacterItemPage extends StatefulWidget {
  const CharacterItemPage({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  State<CharacterItemPage> createState() => _CharacterItemPageState();
}

class _CharacterItemPageState extends State<CharacterItemPage> {
  @override
  void initState() {
    super.initState();
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
