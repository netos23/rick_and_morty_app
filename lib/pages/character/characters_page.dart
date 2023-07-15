import 'package:flutter/material.dart';
import 'package:rick_and_morty/network/dto/pagination/pagination.dart';
import 'package:rick_and_morty/network/model/character/character.dart';
import 'package:rick_and_morty/network/model/episode/episode.dart';
import 'package:rick_and_morty/network/repository/character_repository.dart';
import 'package:rick_and_morty/network/utils/dio_util.dart';
import 'package:rick_and_morty/pages/character/character_item_page.dart';
import 'package:rick_and_morty/pages/character/widgets/character_list.dart';
import 'package:rick_and_morty/pages/widgets/app_bar_widget.dart';
import 'package:rick_and_morty/network/utils/path_id.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  final CharacterRepository _characterRepository =
      DioUtil().characterRepository;

  late Pagination<Character> _characterList;

  @override
  void initState() {
    super.initState();
  }

  Future<Pagination<Character>> getCharacters() async {
    final res = await _characterRepository.getCharacters();
    return res;
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: FutureBuilder<Pagination<Character>>(
        future: getCharacters(),
        builder: (context, snapshot) {
          final characters = snapshot.data;
          if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          } else if (characters == null) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: Column(
              // не знаю, как сделать так чтобы картинка улетала вверх при сколле списка без использования CustomScrollView
              children: [
                Image.asset(
                  'assets/images/Rick_and_Morty.png',
                  fit: BoxFit.fitWidth,
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: characters.results.length,
                    itemBuilder: (BuildContext context, int index) {
                      final char = characters.results[index];
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) =>
                                    CharacterItemPage(character: char),
                              ),
                            );
                          },
                          child: CharacterItem(character: char));
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
