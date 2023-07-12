import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/model/character.dart';

part 'location_dto.freezed.dart';

part 'location_dto.g.dart';

@freezed
abstract class LocationDto with _$LocationDto {
  const factory LocationDto({
    required Info info,
    required List<Location> results,
  }) = _LocationDto;

  factory LocationDto.fromJson(Map<String, dynamic> json) =>
      _$LocationDtoFromJson(json);
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