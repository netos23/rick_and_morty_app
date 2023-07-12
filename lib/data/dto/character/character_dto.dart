import 'package:freezed_annotation/freezed_annotation.dart';

part 'character_dto.freezed.dart';
part 'character_dto.g.dart';

@freezed
class CharacterDto with _$CharacterDto {
  const factory CharacterDto({
    required int id,
    required String name,
    required String status,
    required String species,
    required String type,
    required String gender,
    required ShortOriginDto origin,
    required ShortLocationDto location,
    required String image,
    required List<String> episode,
    required String url,
    required String created,
  }) = _CharacterDto;

  factory CharacterDto.fromJson(Map<String, dynamic> json) =>
      _$CharacterDtoFromJson(json);
}

@freezed
class ShortOriginDto with _$ShortOriginDto {
  const factory ShortOriginDto({
    required String name,
    required String url,
  }) = _ShortOriginDto;

  factory ShortOriginDto.fromJson(Map<String, dynamic> json) => _$ShortOriginDtoFromJson(json);
}

@freezed
class ShortLocationDto with _$ShortLocationDto {
  const factory ShortLocationDto({
    required String name,
    required String url,
  }) = _ShortLocationDto;

  factory ShortLocationDto.fromJson(Map<String, dynamic> json) =>
      _$ShortLocationDtoFromJson(json);
}