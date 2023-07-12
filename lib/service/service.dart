import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../model/character.dart';

part 'service.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/api/character")
  Future<List<Character>> getAllCharacters(
      {@Query('page') int page,
        @Query('name') String name,
        @Query('status') String status,
        @Query('species') String species,
        @Query('type') String type,
        @Query('gender') String gender}
      );


  @GET("/api/character/{id}")
  Future<Character> getCharacter(@Path() int id);

  @GET("/api/character/{ids}")
  Future<List<Character>> getCharacters(@Path() List<int> ids);
}
