import 'package:dio/dio.dart';
import 'package:rick_and_morty/dto/character/character_list.dart';
import 'package:rick_and_morty/model/character/character.dart';
import 'package:rick_and_morty/service/service.dart';

class CharacterRepository {
  CharacterRepository(this._restService);

  final CharacterClient _restService;

  Future<Character> getCharacter(int id) async {
    try {
      final result = await _restService.getCharacter(id);
      return result;
    } on DioException catch (error, stackTrace) {
      throw Exception(
        '$error, $stackTrace',
      );
    }
  }

  Future<CharacterList> getCharacters() async {
    try {
      final result = await _restService.getCharacters();
      return result;
    } on DioException catch (error, stackTrace) {
      throw Exception(
        '$error, $stackTrace',
      );
    }
  }
}
