import 'package:rick_and_morty/data/dto/location/location_dto.dart';
import 'package:rick_and_morty/data/mapper/location_mapper.dart';

class Location {
  final int id;
  final String name;
  final String type;
  final String dimension;
  final List<int> residentsIds;
  final String created;

  Location({
    required this.id,
    required this.name,
    required this.type,
    required this.dimension,
    required this.residentsIds,
    required this.created,
  });

  factory Location.fromDto(LocationDto dto) => LocationMapper.mapFromDto(dto);
}
