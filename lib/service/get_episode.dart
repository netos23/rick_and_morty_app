import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty/model/episode.dart';
import '../model/character.dart';
import '../model/page.dart';
part 'get_episode.g.dart';

@RestApi()
abstract class EpisodeService {
  factory EpisodeService(Dio dio, {String baseUrl}) = _EpisodeService;

  @GET('/episode/{id}')
  Future<Episode> getEpisode(@Path() int id);

  @GET('/episode')
  Future<Page<Episode>> findEpisode({@Query('page') int page,
  @Query('name') String name,
  @Query('episode') String episode});

  @GET('/episode/{ids}')
  Future<List<Episode>> getMultipleEpisode(@Path() List<int> ids);
}