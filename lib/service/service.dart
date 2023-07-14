import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rick_and_morty/dto/pagination.dart';
import 'package:rick_and_morty/model/character.dart';
part 'service.g.dart';

@RestApi(baseUrl: "https://rickandmortyapi.com")
abstract class CharacterClient {
  factory CharacterClient(Dio dio, {String baseUrl}) = _CharacterClient;

  @GET("/api/character/{id}")
  Future<Character> getCharacter(@Path() int id);

  @GET("/api/character")
  Future<Pagination<Character>> getCharacters(
    @Query('page') String? page,
  );
}
