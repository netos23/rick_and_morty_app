import 'dart:core';

import 'package:rick_and_morty/data/dto/character/character_dto.dart';
import 'package:rick_and_morty/data/model/character.dart';

class CharacterMapper {
  static Character mapFromDto(CharacterDto dto) {
    return Character(
      id: dto.id,
      name: dto.name,
      status: dto.status,
      species: dto.species,
      type: dto.type,
      gender: dto.gender,
      origin: ShortOrigin(
        dto.origin.name,
        dto.origin.url.isEmpty ? null : _parseId(dto.origin.url),
      ),
      location: ShortLocation(
        dto.location.name,
        dto.location.url.isEmpty ? null : _parseId(dto.location.url),
      ),
      image: dto.image,
      episodeIds: _parseIdList(dto.episode),
      created: dto.created,
    );
  }

  static int _parseId(String url) {
    final domens = url.split('/');

    return int.parse(domens[domens.length - 1]);
  }

  static List<int> _parseIdList(List<String> urls) {
    if (urls.isEmpty) {
      return [];
    }

    return urls.map(_parseId).toList();
  }
}
