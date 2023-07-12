import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:rick_and_morty/network/dto/info/info.dart';
import 'package:rick_and_morty/network/model/character/character.dart';

part 'character_list.freezed.dart';

part 'character_list.g.dart';


@freezed
abstract class CharacterList with _$CharacterList {
  const factory CharacterList({
    required Info info,
    required List<Character> results,
  }) = _CharacterList;

  factory CharacterList.fromJson(Map<String, dynamic> json) =>
      _$CharacterListFromJson(json);
}
