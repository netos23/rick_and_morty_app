import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rick_and_morty/data/dto/episode/episode_dto.dart';
import 'package:rick_and_morty/data/dto/wrapper/response_wrapper.dart';

part 'episode_repo.g.dart';

@RestApi()
abstract class EpisodeRepo {
  factory EpisodeRepo(Dio dio, {String baseUrl}) = _EpisodeRepo;

  @GET('/episode')
  Future<ResponseWrapper<EpisodeDto>> getPage(@Query('page') int pageNo);

  @GET('/episode/{id}')
  Future<EpisodeDto> get(@Path() int id);

  @GET("/episode/{ids}")
  Future<List<EpisodeDto>> getMultipleEpisode(
    @Path() String ids,
  );
}
