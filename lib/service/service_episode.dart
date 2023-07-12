import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty/dto/episode_dto.dart';
import 'package:rick_and_morty/model/episode.dart';
//import '../model/character.dart';

part 'service_episode.g.dart';

@RestApi()
abstract class EpisodeService {
  factory EpisodeService(Dio dio, {String baseUrl}) = _EpisodeService;

  @GET('/api/episode/{id}')
  Future<Episode> getEpisode(@Path() int id);

  @GET('/api/episode')
  Future<EpisodeDto> getAllEpisode(
      @Query('name') String name,
    @Query('episode') String episode);


  @GET('/api/episode')
  Future<EpisodeDto> getAllEpisodes();

  @GET('/api/episode/{ids}')
  Future<List<Episode>> getEpisodes(@Path() List<int> ids);
}