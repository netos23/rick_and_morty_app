import 'package:dio/dio.dart';
import 'package:rick_and_morty/network/dto/pagination/pagination.dart';
import 'package:rick_and_morty/network/model/character/character.dart';
import 'package:rick_and_morty/network/service/service.dart';

class CharacterRepository {
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

  Future<Pagination<Character>> getCharacters() async {
    try {
      final result = await _restService.getCharacters();
      return result;
    } on DioException catch (error, stackTrace) {
      print(stackTrace);
      throw Exception(
        error.response?.data['message'],
      );
    }
  }
}
