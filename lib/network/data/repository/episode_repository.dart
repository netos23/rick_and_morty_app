import 'package:dio/dio.dart';
import 'package:rick_and_morty/network/data/dto/pagination/pagination.dart';
import 'package:rick_and_morty/network/data/service/service.dart';
import 'package:rick_and_morty/network/model/episode/episode.dart';


class EpisodeRepository{
  EpisodeRepository(this._restService);

  final RestService _restService;

  Future<Episode> getEpisode(int id) async {
    try {
      final result = await _restService.getEpisode(id);
      return result;
    } on DioException catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Future<Pagination<Episode>> getEpisodes() async {
    try {
      final result = await _restService.getEpisodes();
      return result;
    } on DioException catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }

  Future<List<Episode>> getMultipleEpisode(String ids) async {
    try {
      final result = await _restService.getMultipleEpisode(ids);
      return result;
    } on DioException catch (error, stackTrace) {
      Error.throwWithStackTrace(error, stackTrace);
    }
  }
}