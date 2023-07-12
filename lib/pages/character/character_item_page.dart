import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/network/model/character/character.dart';
import 'package:rick_and_morty/pages/character/widgets/arrow_back_tilet.dart';
import 'package:rick_and_morty/pages/character/widgets/char_info_list_tile.dart';
import 'package:rick_and_morty/pages/character/widgets/circle_avatar.dart';
import 'package:rick_and_morty/pages/widgets/app_bar_widget.dart';

class CharacterItemPage extends StatefulWidget {
  const CharacterItemPage(
      {Key? key, required this.character, required this.index})
      : super(key: key);

  final Character character;
  final int index;

  @override
  State<CharacterItemPage> createState() => _CharacterItemPageState();
}

class _CharacterItemPageState extends State<CharacterItemPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24),
        child: Column( // здесь нужно скроллить всю страницу по мере заполняемости контентом
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
            Container(
              margin: const EdgeInsets.only(top: 32, bottom: 16),
              alignment: Alignment.centerLeft,
              child: Text(
                'Informations',
                style: GoogleFonts.roboto(
                  fontSize: 20,
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w500,
                  color: const Color(0xFF8E8E93),
                ),
              ),
            ),
            Expanded(
                // прокручиватся этот список, а не содержимое страницы
                child: CharInfoListTile(
              character: widget.character,
            )),
          ],
        ),
      ),
    );
  }
}
