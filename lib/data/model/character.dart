import 'package:rick_and_morty/data/dto/character/character_dto.dart';
import 'package:rick_and_morty/data/mapper/character_mapper.dart';

class Character {
  final int id;
  final String name;
  final String status;
  final String species;
  final String type;
  final String gender;
  final ShortOrigin origin;
  final ShortLocation location;
  final String image;
  final List<int> episodeIds;
  final String created;

  Character({
    required this.id,
    required this.name,
    required this.status,
    required this.species,
    required this.type,
    required this.gender,
    required this.origin,
    required this.location,
    required this.image,
    required this.episodeIds,
    required this.created,
  });

  factory Character.fromDto(CharacterDto dto) =>
      CharacterMapper.mapFromDto(dto);
}

class ShortOrigin {
  final String name;
  final int id;

  ShortOrigin(this.name, this.id);
}

class ShortLocation {
  final String name;
  final int id;

  ShortLocation(this.name, this.id);
}
