import 'package:elementary/elementary.dart';
import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty/data/model/character.dart';
import 'package:rick_and_morty/data/repo/character/character_repo.dart';


/// Default Elementary model for CharactersListScreen module
class CharactersListScreenModel extends ElementaryModel {
  CharactersListScreenModel({required super.errorHandler, required this.repo});

  final CharacterRepo repo;
  int _page = 0;
  bool isMore = true;

  Future<(List<Character> content, bool isMore)> getNextPage() async {
    try {
      if (!isMore) {
        return (<Character>[], false);
      }
      final response = await repo.getPage(_page);
      isMore = response.info.next != null;
      _page++;
      return (
        response.results.map((dto) => Character.fromDto(dto)).toList(),
        isMore,
      );
    } catch (e, stacktrace) {
      debugPrintStack(stackTrace: stacktrace);

    }
    return (<Character>[], false);
  }
}
