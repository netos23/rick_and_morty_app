import 'package:elementary/elementary.dart';
import 'package:rick_and_morty/data/dto/character/character_dto.dart';
import 'package:rick_and_morty/data/repo/character/character_repo.dart';

import '../../data/model/character.dart';

// TODO: cover with documentation
/// Default Elementary model for FindScreen module
class FindScreenModel extends ElementaryModel {
  FindScreenModel(ErrorHandler errorHandler, this.repo)
      : super(errorHandler: errorHandler);
  final CharacterRepo repo;
  final List<Character> chars = [];

  Future<List<Character>> getPage(int pageNo) async {
    final data = await repo.getPage(pageNo);
    List<CharacterDto> dtoList = data.results;
    List<Character> characterList =
        dtoList.map((dto) => Character.fromDto(dto)).toList();
    return characterList;
  }

  Future<Character> get(int id) async{
    final dto = repo.get(id);

    return dto.then((value) => Character.fromDto(value));
  }
}
