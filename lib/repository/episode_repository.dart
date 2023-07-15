import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/dto/pagination/pagination.dart';
import 'package:rick_and_morty/data/service/service.dart';
import 'package:rick_and_morty/model/episode/episode.dart';
import 'package:rick_and_morty/util/network/path_id.dart';

class EpisodeRepository {
  EpisodeRepository(this._restService);

  //TODO: доделать get для Pagination

  final AppClient _restService;

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

  Future<List<Episode>> loadEpisodes(List<String> episodes) async {
    final ids = episodes.map((e) => e.id).join(',');

    try {
      final episodes = await _restService.getMultipleEpisode(ids);
      return episodes;
    } catch (e) {
      debugPrint(e.toString());
    }
    return [];
  }

  Future<Pagination<Episode>> getEpisodes() async {
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
