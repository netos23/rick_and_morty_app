import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/dto/rick_and_morty_dto.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/pages/components/filter_button.dart';
import 'package:rick_and_morty/pages/components/filter_text_form.dart';
import 'package:rick_and_morty/pages/components/rick_and_morty_app_bar.dart';
import 'package:rick_and_morty/repositories/character_rep.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final List<Character> data = [];
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
      data.addAll(dto.results);
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
                  fetchData();
                }),
              ),
            ),
            Expanded(
              flex: 12,
              child: FutureCharacterListBuilder(future: future, data: data),
            )
          ],
        ),
      ),
    );
  }
}

class FutureCharacterListBuilder extends StatefulWidget {
  const FutureCharacterListBuilder({
    super.key,
    required this.future,
    required this.data,
  });

  final Future<RickAndMortyDto> future;
  final List<Character> data;

  @override
  State<FutureCharacterListBuilder> createState() => _FutureCharacterListBuilderState();
}

class _FutureCharacterListBuilderState extends State<FutureCharacterListBuilder> {
  int page = 1;

  Future<RickAndMortyDto> fetchData() async {
    var dto = await CharacterRepository().getCharactersByPage(page);
    setState(() {
      widget.data.addAll(dto.results);
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
            itemCount: widget.data.length,
            itemBuilder: (context, index) {
              if (index != widget.data.length - 1) {
                return Text(widget.data[index].name);
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.data[index].name),
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

