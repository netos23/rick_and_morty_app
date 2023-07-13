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
  Future<Pagination<Character>> getCharacters(
    @Query('page') String? page,
  );
}
