import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rick_and_morty/model/character.dart';
part 'service.g.dart';

@RestApi(baseUrl: "https://rickandmortyapi.com")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/api/character/{id}")
  Future<Character> getCharacter(@Path() int id);
}
