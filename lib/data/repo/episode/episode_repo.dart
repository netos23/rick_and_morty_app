import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rick_and_morty/data/dto/episode/episode_dto.dart';

part 'episode_repo.g.dart';

@RestApi()
abstract class EpisodeRepo {
  factory EpisodeRepo(Dio dio, {String baseUrl}) = _EpisodeRepo;

  @GET('/episode')
  Future<EpisodeDto> getAll();

  @GET('/episode/{id}')
  Future<EpisodeDto> get(@Path() int id);
}
