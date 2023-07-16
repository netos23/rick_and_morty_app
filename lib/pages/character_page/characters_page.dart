import 'package:auto_route/auto_route.dart';

import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/pages/components/character_page.dart';
import 'package:rick_and_morty/pages/components/filter_button.dart';
import 'package:rick_and_morty/pages/components/filter_text_form.dart';
import 'package:rick_and_morty/pages/components/pagination_list.dart';
import 'package:rick_and_morty/pages/components/rick_and_morty_app_bar.dart';
import 'package:rick_and_morty/pages/filter/filter_dialog.dart';
import 'package:rick_and_morty/pages/filter/filter_dto.dart';
import 'package:rick_and_morty/repositories/character_rep.dart';

@RoutePage()
class CharactersPage extends StatefulWidget {
  const CharactersPage({Key? key}) : super(key: key);

  @override
  State<CharactersPage> createState() => _CharactersPageState();
}

class _CharactersPageState extends State<CharactersPage> {
  String species = '';
  String gender = '';
  String status = '';
  String name = '';
  int page = 1;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
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
                  onFieldSubmitted: (value) {
                    setState(() {
                      name = value;
                    });
                  },
                )),
            Flexible(
              flex: 4,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 16),
                child: FilterButton(onPressedCallBack: () async {
                  var dto = await showDialog<FilterDto>(
                    context: context,
                    builder: (context) {
                      return const FilterDialog();
                    },
                  );
                  if (dto == null) return;
                  setState(() {
                    status = dto.status;
                    gender = dto.gender;
                    species = dto.species;
                  });
                }),
              ),
            ),
            Expanded(
              flex: 12,
              child: PaginationList<Character>(
                  queries: {
                    "species": species,
                    "status": status,
                    "gender": gender,
                    "name": name,
                  },
                  sliverGridDelegate:
                      const SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 400,
                          childAspectRatio: 0.95,
                          mainAxisSpacing: 16),
                  cardBuilder: (context, character) {
                    return CharacterCard(
                      character: character,
                    );
                  },
                  fetchData: CharacterRepository().getCharactersByFilter),
            )
          ],
        ),
      ),
    );
  }
}
