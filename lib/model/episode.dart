import 'package:freezed_annotation/freezed_annotation.dart';
part 'episode.freezed.dart';
part 'episode.g.dart';

@freezed
abstract class Episode with _$Episode {
  const factory Episode({
    required int id,
    required String name,
    required String air_date,
    required String episode,
    required List<String> characters,
    required String url,
    required String created,
  }) = _Episode;

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
}
