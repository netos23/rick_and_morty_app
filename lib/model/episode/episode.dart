import 'package:freezed_annotation/freezed_annotation.dart';

part 'episode.freezed.dart';
part 'episode.g.dart';

@freezed
class Episode with _$Episode {
    factory Episode({
      required int id,
      required String name,
      @JsonKey(name: 'air_date')
      required String airDate,
      required String episode,
      required List<String> characters,
      required String url,
      required DateTime created,
}) = _Episode;

    factory Episode.fromJson(Map<String, dynamic> json) => _$EpisodeFromJson(json);
}