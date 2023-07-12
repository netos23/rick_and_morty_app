import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/dto/rick_and_morty_dto.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/pages/components/rick_and_morty_app_bar.dart';
import 'package:rick_and_morty/repositories/character_rep.dart';

class CharactersPage extends StatefulWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  final List<Character> data = [];
  int page = 1;

  @override
  void initState() {
    super.initState();
    CharacterRepository()
        .getCharactersByPage(page)
        .then((value) => data.addAll(value.results));
  }

  Future<RickAndMortyDto> getData() async {
    page++;

    return CharacterRepository().getCharactersByPage(page);
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
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 32),
              child: Image.asset('assets/title.png'),
            ),
            const FilterTextForm(),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: FilterButton(onPressedCallBack: () {
                getData();
              }),
            ),
            Expanded(
              child: FutureBuilder(
                future: getData(),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    return ListView.builder(
                      itemCount: data.length,
                      itemBuilder: (context, index) {
                        return Text(data[index].name);
                      },
                    );
                  } else if (snapshot.hasError) {
                    return const Center(
                      child: Text('Ошибка загрузки данных'),
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FilterButton extends StatelessWidget {
  const FilterButton({
    super.key,
    required this.onPressedCallBack,
  });

  final VoidCallback onPressedCallBack;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: theme.colorScheme.tertiary,
        minimumSize: Size.fromHeight(56),
      ),
      onPressed: onPressedCallBack,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Icon(
              Icons.filter_list,
              color: theme.colorScheme.secondary.withOpacity(0.54),
            ),
          ),
          Align(
            child: Text(
              "ADVANCED FILTERS",
              style: theme.textTheme.headlineSmall?.copyWith(
                fontSize: 14,
                color: theme.colorScheme.primary,
              ),
            ),
          )
        ],
      ),
    );
  }
}

class FilterTextForm extends StatelessWidget {
  const FilterTextForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onFieldSubmitted: (value) {
        // при завершении начинаем искать
      },
      decoration: const InputDecoration(
          prefixIcon: Icon(Icons.search),
          hintText: 'Fitler by name...',
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(8)))),
    );
  }
}
