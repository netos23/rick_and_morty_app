import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/network/data/dto/pagination/pagination.dart';
import 'package:rick_and_morty/network/data/repository/character_repository.dart';
import 'package:rick_and_morty/network/model/character/character.dart';
import 'package:rick_and_morty/network/util/dio_util.dart';
import 'package:rick_and_morty/pages/character/widgets/character_list.dart';
import 'package:rick_and_morty/pages/widgets/app_bar_widget.dart';
import 'package:rick_and_morty/router/app_router.dart';

@RoutePage()
class CharactersPage extends StatefulWidget {
  const CharactersPage({super.key});

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final CharacterRepository _characterRepository =
      DioUtil().characterRepository;

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
            child: CustomScrollView(
              slivers: [
                SliverToBoxAdapter(
                  child: Image.asset(
                    'assets/images/rick_and_morty.png',
                    fit: BoxFit.fitWidth,
                  ),
                ),
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                      final char = characters.results[index];
                      return GestureDetector(
                        onTap: () {
                          context.router.push(CharacterItemPageRoute(character: char));
                        },
                        child: CharacterItem(
                          character: char,
                        ),
                      );
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
