import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rick_and_morty/data/dto/pagination.dart';
import 'package:rick_and_morty/model/episode.dart';

part 'episode_client.g.dart';

@RestApi()
abstract class EpisodeClient {
  factory EpisodeClient(
    Dio dio, {
    String baseUrl,
  }) = _EpisodeClient;

  @GET("/api/episode")
  Future<Pagination<Episode>> getEpisodes({
    @Query('page') int? page,
    @Query('name') String? name,
    @Query('episode') String? episode,
  });

  @GET("/api/episode/{id}")
  Future<Episode> getEpisode(
    @Path() int id,
  );

  @GET("/api/episode/{ids}")
  Future<List<Episode>> getMultipleEpisode(
    @Path() String ids,
  );
}
