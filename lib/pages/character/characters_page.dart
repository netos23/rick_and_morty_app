import 'package:flutter/material.dart';
import 'package:rick_and_morty/network/dto/character/character_list.dart';
import 'package:rick_and_morty/network/model/character/character.dart';
import 'package:rick_and_morty/network/repository/character_repository.dart';
import 'package:rick_and_morty/network/utils/dio_util.dart';
import 'package:rick_and_morty/pages/character/character_item_page.dart';
import 'package:rick_and_morty/pages/character/widgets/character_list.dart';
import 'package:rick_and_morty/pages/widgets/app_bar_widget.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  final CharacterRepository _characterRepository =
      DioUtil().characterRepository;

  late Future<CharacterList> _characterList;
  late List<Character> _characters;

  @override
  void initState() {
    super.initState();
    _characterList = getCharacters();
  }

  Future<CharacterList> getCharacters() async {
    final res = await _characterRepository.getCharacters();
    _characters = res.results;
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: FutureBuilder(
        future: _characterList,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
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
                      itemCount: _characters.length,
                      itemBuilder: (BuildContext context, int index) {
                        final char = _characters[index];
                        return GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (_) =>  CharacterItemPage(
                                        index: index, character: char),
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
          } else if (snapshot.hasError) {
            return Center(child: Text(snapshot.error.toString()));
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}
