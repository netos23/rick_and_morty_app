import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/model/character.dart';

part 'rick_and_morty_dto.freezed.dart';

part 'rick_and_morty_dto.g.dart';

@Freezed(
  fromJson: true,
  genericArgumentFactories: true,
)
class RickAndMortyDto<T> with _$RickAndMortyDto<T> {
  const factory RickAndMortyDto({
    required Info info,
    required List<T> results,
  }) = _RickAndMortyDto;

  factory RickAndMortyDto.fromJson(
    Map<String, dynamic> json,
    T Function(Object?) converter,
  ) =>
      _$RickAndMortyDtoFromJson(json, converter);
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
