import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';

part 'character.g.dart';

@freezed
class Character with _$Character {
  const factory Character({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required Origin origin,
    required Location location,
    required String image,
    required List<String> episode,
    required String url,
    required String created,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}

@freezed
class Episode with _$Episode {
  const factory Episode(
      {required int id,
      required String name,
      required String airDate,
      required String episode,
      required List<String> characters,
      required String url,
      required String created}) = _Episode;

  factory Episode.fromJson(Map<String, dynamic> json) =>
      _$EpisodeFromJson(json);
}

@freezed
class Origin with _$Origin {
  const factory Origin({
    required String name,
    required String url,
  }) = _Origin;

  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);
}

@freezed
class Location with _$Location {
  const factory Location({
    required String name,
    required String url,
  }) = _Location;

  factory Location.fromJson(Map<String, dynamic> json) =>
      _$LocationFromJson(json);
}
