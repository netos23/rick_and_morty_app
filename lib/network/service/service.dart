import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rick_and_morty/network/model/character/character.dart';
import 'package:rick_and_morty/network/model/episode/episode.dart';
import 'package:rick_and_morty/network/model/location/location.dart';

part 'service.g.dart';

@RestApi()
abstract class RestService {
  factory RestService(Dio dio, {String baseUrl}) = _RestService;

  @GET("/api/character/{id}")
  Future<Character> getCharacter(@Path() int id);

  @GET("/api/character")
  Future<List<Character>> getCharacters();


  @GET("/api/location/{id}")
  Future<Location> getLocation(@Path() int id);

  @GET("/api/location")
  Future<List<Location>> getLocations();

  @GET("/api/episode/{id}")
  Future<Episode> getEpisode(@Path() int id);

  @GET("/api/episode")
  Future<List<Episode>> getEpisodes();

}