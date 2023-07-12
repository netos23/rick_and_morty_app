import 'dart:core';

import 'package:rick_and_morty/data/dto/character/character_dto.dart';
import 'package:rick_and_morty/data/model/character.dart';

class CharacterMapper {
  static Character mapFromDto(CharacterDto dto) {
    return Character(
      id: dto.id,
      name: dto.name,
      status: dto.status,
      species: dto.status,
      type: dto.type,
      gender: dto.type,
      origin: ShortOrigin(
        dto.origin.name,
        _parseId(dto.origin.url),
      ),
      location: ShortLocation(
        dto.location.name,
        _parseId(dto.location.url),
      ),
      image: dto.image,
      episodeIds: dto.episode.map((episodeUrl) => _parseId(episodeUrl)).toList(),
      created: dto.created,
    );
  }



  static int _parseId(String url) {
    final domens = url.split('/');
    return int.parse(domens.last);
  }
}
