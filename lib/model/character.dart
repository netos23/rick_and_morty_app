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
    required CharacterLocation origin,
    required CharacterLocation location,
    required String image,
    required List<String> episode,
    required String url,
    required String created,
  }) = _Character;

  factory Character.fromJson(Map<String, dynamic> json) =>
      _$CharacterFromJson(json);
}

@freezed
class CharacterLocation with _$CharacterLocation {
  factory CharacterLocation({
    required String name,
    required String url,
  }) = _CharacterLocation;

  factory CharacterLocation.fromJson(Map<String, dynamic> json) =>
      _$CharacterLocationFromJson(json);
}

enum CharacterSpecies {
  @JsonValue('Humanoid')
  humanoid,
  @JsonValue('Human')
  human,
  @JsonValue('Alien')
  alien,
  @JsonValue('')
  empty,
}

enum CharacterStatus {
  @JsonValue('Alive')
  alive,
  @JsonValue('unknown')
  unknown,
  @JsonValue('Dead')
  dead,
  @JsonValue('')
  empty;
}

enum CharacterGender {
  @JsonValue('Male')
  male,
  @JsonValue('Female')
  female,
  @JsonValue('unknown')
  unknown,
  @JsonValue('')
  empty,
}
