import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rick_and_morty/dto/character_dto.dart';

import '../model/character.dart';

part 'service.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/api/character")
  Future<RickAndMortyDto> getAllCharacters(
      @Query("name") String name,
      @Query("species") String species,
      @Query("gender") String gender,
      @Query("status") String status,
      );

  @GET("/api/character")
  Future<RickAndMortyDto> getAllCharacter();

  @GET("/api/character/{id}")
  Future<Character> getCharacter(@Path() int id);

  @GET("/api/character/{ids}")
  Future<List<Character>> getCharacters(@Path() List<int> ids);
}
