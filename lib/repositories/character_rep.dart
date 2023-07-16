import 'package:dio/dio.dart';
import 'package:rick_and_morty/dto/rick_and_morty_dto.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/network/rest_client.dart';

class CharacterRepository {
  final RestClient _api;

  static CharacterRepository? _instance;

  factory CharacterRepository() {
    return _instance ??= CharacterRepository._(
        RestClient(Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com'))));
  }

  CharacterRepository._(this._api);

  Future<Character> getCharacterById(int id) async {
    return _api.getCharacter(id);
  }

  Future<RickAndMortyDto<Character>> getCharactersByPage(int page) {
    return _api.getAllCharacterByPage(page);
  }

  Future<RickAndMortyDto<Character>> getCharactersByFilter(
      int page, Map<String, String> queries) {
    return _api.getAllCharacterByFilter(page, queries);
  }

  Future<List<Character>> getCharactersByUrl(List<String> urls) {
    var ids =
        urls.map((url) => url.substring(url.lastIndexOf('/') + 1)).join(',');
    return _api.getCharacters(ids);
  }
}
