import 'package:dio/dio.dart';
import 'package:rick_and_morty/dto/rick_and_morty_dto.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/network/rest_client.dart';

class CharacterRepository {
  final _dio;

  final RestClient _api;

  static CharacterRepository? _instance;

  factory CharacterRepository() {
    return _instance ??= CharacterRepository._(
        Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com')));
  }

  CharacterRepository._(this._dio) : _api = RestClient(_dio);

  Future<Character> getCharacterById(int id) async {
    return _api.getCharacter(id);
  }

  Future<RickAndMortyDto<Character>> getCharactersByPage(int page) {
    return _api.getAllCharacterByPage(page);
  }

  Future<RickAndMortyDto> getCharactersByFilter({
    String name = '',
    String species = '',
    String gender = '',
    String status = '',
  }) {
    return _api.getAllCharacterByFilter(name, species, gender, status);
  }
}
