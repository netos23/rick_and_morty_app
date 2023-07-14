import 'package:dio/dio.dart';
import 'package:rick_and_morty/dto/episode/episode_list.dart';
import 'package:rick_and_morty/model/episode/episode.dart';
import 'package:rick_and_morty/service/service.dart';

class EpisodeRepository {
  EpisodeRepository(this._restService);

  final CharacterClient _restService;

  Future<Episode> getEpisode(int id) async {
    try {
      final result = await _restService.getEpisode(id);
      return result;
    } on DioException catch (error, stackTrace) {
      throw Exception(
        '$error, $stackTrace',
      );
    }
  }

  Future<EpisodeList> getEpisodes() async {
    try {
      final result = await _restService.getEpisodes();
      return result;
    } on DioException catch (error, stackTrace) {
      throw Exception(
        '$error, $stackTrace',
      );
    }
  }
}