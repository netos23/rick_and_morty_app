import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/dto/rick_and_morty_dto.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/pages/components/filter_button.dart';
import 'package:rick_and_morty/pages/components/filter_text_form.dart';
import 'package:rick_and_morty/pages/components/future_character_list_builder.dart';
import 'package:rick_and_morty/pages/components/rick_and_morty_app_bar.dart';
import 'package:rick_and_morty/repositories/character_rep.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final List<Character> characters = [];
  final ScrollController _scrollController = ScrollController();
  late final Future<RickAndMortyDto> future;
  int page = 1;

  @override
  void initState() {
    super.initState();
    future = fetchData();
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  Future<RickAndMortyDto> fetchData() async {
    var dto = await CharacterRepository().getCharactersByPage(page);
    setState(() {
      characters.addAll(dto.results);
    });
    page++;
    return dto;
  }

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: RickAndMortyAppBar(),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, top: 16),
        child: Column(
          children: [
            Flexible(
              flex: 4,
              child: Image.asset('assets/title.png'),
            ),
            const Spacer(),
            Flexible(
                flex: 3,
                child: FilterTextForm(
                  onFieldSubmitted: (_) {},
                )),
            Flexible(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: FilterButton(onPressedCallBack: () {

                }),
              ),
            ),
            Expanded(
              flex: 12,
              child: FutureCharacterListBuilder(future: future, characters: characters),
            )
          ],
        ),
      ),
    );
  }
}
