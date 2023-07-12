import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/model/episode.dart';

part 'episode_dto.freezed.dart';

part 'episode_dto.g.dart';

@freezed
abstract class EpisodeDto with _$EpisodeDto {
  const factory EpisodeDto({
    required Info info,
    required List<Episode> results,
  }) = _EpisodeDto;

  factory EpisodeDto.fromJson(Map<String, dynamic> json) =>
      _$EpisodeDtoFromJson(json);
}

@freezed
class Info with _$Info {
  const factory Info({
    required int count,
    required int pages,
    required String? next,
    required String? prev,
  }) = _Info;

  factory Info.fromJson(Map<String, dynamic> json) => _$InfoFromJson(json);
}