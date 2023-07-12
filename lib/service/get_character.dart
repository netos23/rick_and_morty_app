import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import '../model/character.dart';
import '../model/page.dart';

part 'get_character.g.dart';

@RestApi()
abstract class CharacterService {
  factory CharacterService(Dio dio, {String baseUrl}) = _CharacterService;

  @GET('/character/{id}')
  Future<Character> getCharacter(@Path() int id);

  @GET('/character')
  Future<Page<Character>> findCharacters({@Query('page') int page,
  @Query('name') String name,
  @Query('status') String status,
  @Query('species') String species,
  @Query('type') String type,
  @Query('Gender') String gender});

  @GET('/character/{ids}')
  Future<List<Character>> getMultipleCharacters(@Path() List<int> ids);
}


