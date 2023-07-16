import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/network/data/dto/pagination/pagination.dart';
import 'package:rick_and_morty/network/data/repository/character_repository.dart';
import 'package:rick_and_morty/network/model/character/character.dart';
import 'package:rick_and_morty/network/util/dio_util.dart';
import 'package:rick_and_morty/pages/character/widgets/character_list.dart';
import 'package:rick_and_morty/pages/widgets/app_bar_widget.dart';
import 'package:rick_and_morty/router/app_router.dart';
import 'package:rick_and_morty/util/pagination_builder.dart';

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

  Future<(List<Character>, bool)> _loadCharacters(int page) async {
    try {
      final pagination = await _characterRepository.getCharacters(
        page: page,
      );
      return (pagination.results, pagination.info.next != null);
    } catch (e) {
      debugPrint(e.toString());
    }
    return (<Character>[], false);
  }

  // Future<Pagination<Character>> getCharacters(int page) async {
  //   final res = await _characterRepository.getCharacters(page: page);
  //   return res;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const AppBarWidget(),
      body: SafeArea(
        child: PaginationBuilder<Character>(
          paginationCallback: _loadCharacters,
          builder: (context, controller, snapshot) {
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
                    child: Hero(
                      tag: 'character_image',
                      child: Image.asset(
                        'assets/images/rick_and_morty.png',
                        fit: BoxFit.fitWidth,
                      ),
                    ),
                  ),
                  SliverList.builder(
                    itemBuilder: (BuildContext context, int index) {
                      final char = characters[index];
                      return GestureDetector(
                        onTap: () {
                          context.router.push(
                            CharacterItemPageRoute(
                              id: char.id,
                              preview: char,
                            ),
                          );
                        },
                        child: CharacterItem(
                          character: char,
                        ),
                      );
                    },
                    itemCount: characters.length,
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
