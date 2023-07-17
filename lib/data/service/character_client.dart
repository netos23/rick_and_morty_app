import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rick_and_morty/data/dto/pagination.dart';
import 'package:rick_and_morty/model/character.dart';

part 'character_client.g.dart';

@RestApi()
abstract class CharacterClient {
  factory CharacterClient(
    Dio dio, {
    String baseUrl,
  }) = _CharacterClient;

  @GET("/api/character")
  Future<Pagination<Character>> getCharacters({
    @Query('page') int? page,
    @Query('name') String? name,
    @Query('status') CharacterStatus? status,
    @Query('species') String? species,
    @Query('type') String? type,
    @Query('gender') CharacterGender? gender,
  });

  @GET("/api/character/{id}")
  Future<Character> getCharacter(
    @Path() int id,
  );

  @GET("/api/character/{ids}")
  Future<List<Character>> getMultipleCharacters(
    @Path() String ids,
  );
}
