import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode_dto.freezed.dart';

part 'episode_dto.g.dart';

@freezed
class EpisodeDto with _$EpisodeDto {
  const factory EpisodeDto({
    required int id,
    required String name,
    // ignore: invalid_annotation_target
    @JsonKey(name: "air_date")
    required String airDate,
    required String episode,
    required String url,
    required String created,
  }) = _EpisodeDto;

  factory EpisodeDto.fromJson(Map<String, dynamic> json) =>
      _$EpisodeDtoFromJson(json);
}
