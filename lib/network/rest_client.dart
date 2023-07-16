import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rick_and_morty/dto/rick_and_morty_dto.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/model/episode.dart';
import 'package:rick_and_morty/model/location.dart';

part 'rest_client.g.dart';

@RestApi()
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/api/character/{id}")
  Future<Character> getCharacter(@Path() int id);

  @GET("/api/character")
  Future<RickAndMortyDto<Character>> getAllCharacter();

  @GET("/api/character")
  Future<RickAndMortyDto<Character>> getAllCharacterByPage(
      @Query("page") int page);

  @GET("/api/location")
  Future<RickAndMortyDto<Location>> getAllLocationsByPage(
      @Query("page") int page);

  @GET("/api/episode")
  Future<RickAndMortyDto<Episode>> getAllEpisodesByPage(
      @Query("page") int page);

  // Фильтрует по name, type, dimension
  @GET("/api/location")
  Future<RickAndMortyDto<Location>> getAllLocationsByFilter(
      @Query("page") int page,
      @Queries(encoded: false) Map<String, String> params);

  // Фильтрует по name, episode
  @GET("/api/episode")
  Future<RickAndMortyDto<Episode>> getAllEpisodesByFilter(
      @Query("page") int page,
      @Queries(encoded: false) Map<String, String> params);

  /// Фильтрует по name, species, gender, status
  @GET("/api/character")
  Future<RickAndMortyDto<Character>> getAllCharacterByFilter(
      @Query("page") int page,
      @Queries(encoded: false) Map<String, String> params);

  @GET("/api/episode/{id}")
  Future<Episode> getEpisode(@Path() int id);

  @GET("/api/location/{id}")
  Future<Location> getLocation(@Path() int id);

  @GET("/api/episode/{ids}")
  Future<List<Episode>> getEpisodes(@Path() String ids);

  @GET("/api/character/{ids}")
  Future<List<Character>> getCharacters(@Path() String ids);

  @GET("/api/location/{ids}")
  Future<List<Location>> getLocations(@Path() String ids);
}
