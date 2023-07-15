import 'package:freezed_annotation/freezed_annotation.dart';

part 'character.freezed.dart';
part 'character.g.dart';

@freezed
abstract class Character with _$Character {
  const factory Character({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required Origin origin,
    required CharacterLocation location,
    required String image,
    required List<String> episode,
    required String? firstEpisodeName,
    required String url,
    required String created,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}

@freezed
abstract class Origin with _$Origin {
  const factory Origin({
    required String name,
    required String url,
  }) = _Origin;

  factory Origin.fromJson(Map<String, dynamic> json) => _$OriginFromJson(json);
}

@freezed
abstract class CharacterLocation with _$CharacterLocation {
  const factory CharacterLocation({
    required String name,
    required String url,
  }) = _CharacterLocation;

  factory CharacterLocation.fromJson(Map<String, dynamic> json) =>
      _$CharacterLocationFromJson(json);
}

enum CharacterStatus {
  @JsonValue('alive')
  alive,
  @JsonValue('unknown')
  unknown,
  @JsonValue('dead')
  dead,
  @JsonValue('')
  empty;
}

enum CharacterGender {
  @JsonValue('male')
  male,
  @JsonValue('female')
  female,
  @JsonValue('unknown')
  unknown,
  @JsonValue('genderless')
  genderless,
}
