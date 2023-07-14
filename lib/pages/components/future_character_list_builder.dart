import 'package:flutter/material.dart';
import 'package:rick_and_morty/dto/rick_and_morty_dto.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/pages/character_page.dart';
import 'package:rick_and_morty/repositories/character_rep.dart';

@Deprecated('Старая реализация пагинации') // ну deprecated это же удобно...
class FutureCharacterListBuilder extends StatefulWidget {
  const FutureCharacterListBuilder({
    super.key,
    required this.future,
    required this.characters,
  });

  final Future<RickAndMortyDto> future;
  final List<Character> characters;

  @override
  State<FutureCharacterListBuilder> createState() =>
      _FutureCharacterListBuilderState();
}

class _FutureCharacterListBuilderState
    extends State<FutureCharacterListBuilder> {
  int page = 1;

  Future<RickAndMortyDto> fetchData() async {
    var dto = await CharacterRepository().getCharactersByPage(page);
    setState(() {
      widget.characters.addAll(dto.results as Iterable<Character>);
    });
    page++;
    return dto;
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Ошибка загрузки данных'),
          );
        } else {
          return ListView.builder(
            itemCount: widget.characters.length,
            itemBuilder: (context, index) {
              if (index != widget.characters.length - 1) {
                return CharacterCard(
                  character: widget.characters[index],
                );
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CharacterCard(character: widget.characters[index]),
                    Center(
                      child: TextButton(
                          onPressed: () {
                            fetchData();
                          },
                          child: const Text("Подгрузить данные")),
                    ),
                  ],
                );
              }
            },
          );
        }
      },
    );
  }
}

class CharacterCard extends StatelessWidget {
  const CharacterCard({
    super.key,
    required this.character,
  });

  final Character character;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CharacterPage(id: character.id),
          ));
        },
        child: Text(character.name));
  }
}
