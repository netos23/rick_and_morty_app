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


  //грязный файл получился, я что-то не нашёл как freezed генерирует  equals
  //но хочется какой-то аналог ломбока
  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Character &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          name == other.name &&
          status == other.status &&
          species == other.species &&
          type == other.type &&
          gender == other.gender &&
          origin == other.origin &&
          location == other.location &&
          image == other.image &&
          episodeIds == other.episodeIds &&
          created == other.created;

  @override
  int get hashCode =>
      id.hashCode ^
      name.hashCode ^
      status.hashCode ^
      species.hashCode ^
      type.hashCode ^
      gender.hashCode ^
      origin.hashCode ^
      location.hashCode ^
      image.hashCode ^
      episodeIds.hashCode ^
      created.hashCode;

  factory Character.fromDto(CharacterDto dto) =>
      CharacterMapper.mapFromDto(dto);
}

class ShortOrigin {
  final String name;
  final int? id;


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShortOrigin &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          id == other.id;

  @override
  int get hashCode => name.hashCode ^ id.hashCode;

  ShortOrigin(this.name, this.id);
}

class ShortLocation {
  final String name;
  final int? id;


  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ShortLocation &&
          runtimeType == other.runtimeType &&
          name == other.name &&
          id == other.id;

  @override
  int get hashCode => name.hashCode ^ id.hashCode;

  ShortLocation(this.name, this.id);
}
