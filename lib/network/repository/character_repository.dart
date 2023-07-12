import 'package:dio/dio.dart';
import 'package:rick_and_morty/network/dto/character/character_list.dart';
import 'package:rick_and_morty/network/model/character/character.dart';
import 'package:rick_and_morty/network/service/service.dart';

class CharacterRepository{
  CharacterRepository(this._restService);

  final RestService _restService;

  Future<Character> getCharacter(int id) async {
    try {
      final result = await _restService.getCharacter(id);
      return result;
    } on DioException catch (error) {
      throw Exception(
        error.response?.data['message'],
      );
    }
  }

  Future<CharacterList> getCharacters() async {
    try {
      final result = await _restService.getCharacters();
      return result;
    } on DioException catch (error) {
      throw Exception(
        error.response?.data['message'],
      );
    }
  }
}