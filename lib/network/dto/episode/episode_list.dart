import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/network/dto/info/info.dart';
import 'package:rick_and_morty/network/model/episode/episode.dart';

part 'episode_list.freezed.dart';

part 'episode_list.g.dart';


@freezed
abstract class EpisodeList with _$EpisodeList {
  const factory EpisodeList({
    required Info info,
    required List<Episode> results,
  }) = _EpisodeList;

  factory EpisodeList.fromJson(Map<String, dynamic> json) =>
      _$EpisodeListFromJson(json);
}
