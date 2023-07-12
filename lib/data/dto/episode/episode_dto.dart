import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode_dto.freezed.dart';

part 'episode_dto.g.dart';

@freezed
class EpisodeDto with _$EpisodeDto {
  const factory EpisodeDto({
    required int id,
    required String name,
    //чтобы не бесился, что не camelCase
    // ignore: non_constant_identifier_names
    required String air_date,
    required String episode,
    required String url,
    required String created,
  }) = _EpisodeDto;

  factory EpisodeDto.fromJson(Map<String, dynamic> json) =>
      _$EpisodeDtoFromJson(json);
}
