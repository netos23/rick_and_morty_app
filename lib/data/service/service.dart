import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rick_and_morty/data/dto/pagination/pagination.dart';
import 'package:rick_and_morty/model/character/character.dart';
import 'package:rick_and_morty/model/episode/episode.dart';
import 'package:rick_and_morty/model/location/location.dart';
import 'package:rick_and_morty/url/character_url.dart';
import 'package:rick_and_morty/url/episode_url.dart';
import 'package:rick_and_morty/url/location_url.dart';
part 'service.g.dart';

@RestApi()
abstract class AppClient {
  factory AppClient(Dio dio, {String baseUrl}) = _AppClient;

  /* Character */

  @GET(CharacterUrl.character)
  Future<Pagination<Character>> getCharacters({
    @Query('page') int? page,
    @Query('name') String? name,
    @Query('status') CharacterStatus? status,
    @Query('species') String? species,
    @Query('type') String? type,
    @Query('gender') CharacterGender? gender,
  });

  @GET("${CharacterUrl.character}/{id}")
  Future<Character> getCharacter(
    @Path() int id,
  );

  @GET("${CharacterUrl.character}/{ids}")
  Future<List<Character>> getMultipleCharacters(
    @Path() String ids,
  );

  /* Location */

  @GET(LocationUrl.location)
  Future<Pagination<Location>> getLocations({
    @Query('page') int? page,
    @Query('name') String? name,
    @Query('type') String? type,
    @Query('dimension') String? dimension,
  });

  @GET("${LocationUrl.location}/{id}")
  Future<Location> getLocation(
    @Path() int id,
  );

  @GET("${LocationUrl.location}/{ids}")
  Future<List<Location>> getMultipleLocation(
    @Path() String ids,
  );

  /* Episode */

  @GET(EpisodeUrl.episode)
  Future<Pagination<Episode>> getEpisodes({
    @Query('page') int? page,
    @Query('name') String? name,
    @Query('episode') String? episode,
  });

  @GET("${EpisodeUrl.episode}/{id}")
  Future<Episode> getEpisode(
    @Path() int id,
  );

  @GET("${EpisodeUrl.episode}/{ids}")
  Future<List<Episode>> getMultipleEpisode(
    @Path() String ids,
  );
}
