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
abstract class CharacterClient {
  factory CharacterClient(Dio dio, {String baseUrl}) = _CharacterClient;

  @GET("${CharacterUrl.character}/{id}")
  Future<Character> getCharacter(@Path() int id);

  @GET(CharacterUrl.character)
  Future<Pagination<Character>> getCharacters({
    @Query('page') int? page,
  });

  @GET("${CharacterUrl.character}/{ids}")
  Future<List<Episode>> getMultipleCharacter(
    @Path() String ids,
  );

  @GET("${LocationUrl.location}/{id}")
  Future<Location> getLocation(@Path() int id);

  @GET(LocationUrl.location)
  Future<Pagination<Location>> getLocations({
    @Query('page') int? page,
  });

  @GET("${LocationUrl.location}/{ids}")
  Future<List<Episode>> getMultipleLocation(
    @Path() String ids,
  );

  @GET("${EpisodeUrl.episode}/{id}")
  Future<Episode> getEpisode(@Path() int id);

  @GET(EpisodeUrl.episode)
  Future<Pagination<Episode>> getEpisodes({
    @Query('page') int? page,
  });

  @GET("${EpisodeUrl.episode}/{ids}")
  Future<List<Episode>> getMultipleEpisode(
    @Path() String ids,
  );
}
