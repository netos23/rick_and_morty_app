import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/dto/character/character_dto.dart';
import 'package:rick_and_morty/data/model/episode.dart';
import 'package:rick_and_morty/data/repo/character/character_repo.dart';
import 'package:rick_and_morty/data/repo/episode/episode_repo.dart';

import '../../data/model/character.dart';

// TODO: cover with documentation
/// Default Elementary model for FindScreen module
class FindScreenModel extends ElementaryModel {
  FindScreenModel(
      {required super.errorHandler,
      required this.clientRepo,
      required this.episodeRepo});

  final CharacterRepo clientRepo;
  final EpisodeRepo episodeRepo;

  Future<List<Character>> getPage(int pageNo) async {
    try {
      final data = await clientRepo.getPage(pageNo);
      List<CharacterDto> dtoList = data.results;
      List<Character> characterList =
          dtoList.map((dto) => Character.fromDto(dto)).toList();
      return characterList;
    } catch (e, stacktrace) {
      debugPrint("$e\n$stacktrace");
      rethrow;
    }
  }

  Future<Character> get(int id) async {
    try {
      final dto = clientRepo.get(id);

      return dto.then((value) => Character.fromDto(value));
    } catch (e, stacktrace) {
      debugPrint("$e\n$stacktrace");
      rethrow;
    }
  }

  Future<List<Episode>> findEpisodes(String ids) async {
    try {
      final dto = await episodeRepo.getMultipleEpisode(ids);
      final data = dto.map((dto) => Episode.fromDto(dto)).toList();
      return data;
    } catch (e, stacktrace) {
      debugPrintStack(stackTrace: stacktrace);
      rethrow;
    }
  }
}
