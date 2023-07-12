import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rick_and_morty/dto/rick_and_morty_dto.dart';
import 'package:rick_and_morty/model/character.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/api/character/{id}")
  Future<Character> getCharacter(@Path() int id);

  @GET("/api/character")
  Future<RickAndMortyDto> getAllCharacter();

  @GET("/api/character")
  Future<RickAndMortyDto> getAllCharacterByPage(@Query("page") int page);

  @GET("/api/character")
  Future<RickAndMortyDto> getAllCharacterByFilter(
    @Query("name") String name,
    @Query("species") String species,
    @Query("gender") String gender,
    @Query("status") String status,
  );
}
