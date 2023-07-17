import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/model/episode.dart';
import 'package:rick_and_morty/data/repo/episode/episode_repo.dart';

/// Default Elementary model for EpisodesListScreen module
class EpisodesListScreenModel extends ElementaryModel {
  EpisodesListScreenModel({required super.errorHandler, required this.repo}) ;


  final EpisodeRepo repo;

  int _page = 0;
  bool isMore = true;

  Future<(List<Episode> content, bool isMore)> getNextPage() async {
    try {
      if (!isMore) {
        return (<Episode>[], false);
      }
      final response = await repo.getPage(_page);
      isMore = response.info.next != null;
      _page++;
      return (
      response.results.map(Episode.fromDto).toList(),
      isMore,
      );
    } catch (e, stacktrace) {
      debugPrintStack(stackTrace: stacktrace);
    }
    return (<Episode>[], false);
  }
}
