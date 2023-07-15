import 'package:dio/dio.dart';
import 'package:rick_and_morty/data/dto/pagination/pagination.dart';
import 'package:rick_and_morty/data/service/service.dart';
import 'package:rick_and_morty/model/character/character.dart';

class CharacterRepository {
  CharacterRepository(this._restService);

  final AppClient _restService;

  //TODO: доделать get для Pagination

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

  Future<Pagination<Character>> getCharacters() async {
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
