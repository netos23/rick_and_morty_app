import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rick_and_morty/dto/character/character_list.dart';
import 'package:rick_and_morty/dto/episode/episode_list.dart';
import 'package:rick_and_morty/dto/location/location_list.dart';
import 'package:rick_and_morty/dto/pagination/pagination.dart';
import 'package:rick_and_morty/model/character/character.dart';
import 'package:rick_and_morty/model/episode/episode.dart';
import 'package:rick_and_morty/model/location/location.dart';
part 'service.g.dart';

@RestApi(baseUrl: "https://rickandmortyapi.com")
abstract class CharacterClient {
  factory CharacterClient(Dio dio, {String baseUrl}) = _CharacterClient;

  @GET("/api/character/{id}")
  Future<Character> getCharacter(@Path() int id);

  @GET("/api/character")
  Future<CharacterList> getCharacters();

  @GET("/api/character")
  Future<Pagination<Character>> getPaginationCharacters(
    @Query('page') String? page,
  );

  @GET("/api/location/{id}")
  Future<Location> getLocation(@Path() int id);

  @GET("/api/location")
  Future<LocationList> getLocations();

  @GET("/api/episode/{id}")
  Future<Episode> getEpisode(@Path() int id);

  @GET("/api/episode")
  Future<EpisodeList> getEpisodes();
}
