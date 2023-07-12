import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/model/character.dart';

part 'character_dto.freezed.dart';

part 'character_dto.g.dart';

@freezed
abstract class RickAndMortyDto with _$RickAndMortyDto {
  const factory RickAndMortyDto({
    required Info info,
    required List<Character> results,
  }) = _RickAndMortyDto;

  factory RickAndMortyDto.fromJson(Map<String, dynamic> json) =>
      _$RickAndMortyDtoFromJson(json);
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