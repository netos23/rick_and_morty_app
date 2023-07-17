import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/model/location.dart';
import 'package:rick_and_morty/data/repo/location/location_repo.dart';

/// Default Elementary model for LocationListScreen module
class LocationListScreenModel extends ElementaryModel {
  LocationListScreenModel({super.errorHandler, required this.repo});

  final LocationRepo repo;

  int _page = 0;
  bool isMore = true;

  Future<(List<Location> content, bool isMore)> getNextPage() async {
    try {
      if (!isMore) {
        return (<Location>[], false);
      }
      final response = await repo.getPage(_page);
      isMore = response.info.next != null;
      _page++;
      return (
        response.results.map((dto) => Location.fromDto(dto)).toList(),
        isMore,
      );
    } catch (e, stacktrace) {
      debugPrintStack(stackTrace: stacktrace);

    }
    return (<Location>[], false);
  }
}
