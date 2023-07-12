import 'package:rick_and_morty/data/dto/location/location_dto.dart';
import 'package:rick_and_morty/data/model/location.dart';

class LocationMapper {
  static Location mapFromDto(LocationDto dto) {
    return Location(
      id: dto.id,
      name: dto.name,
      type: dto.type,
      dimension: dto.dimension,
      residentsIds: dto.residents.map(_parseId).toList(),
      created: dto.created,
    );
  }

  static String parseInfo(String info) {
    return info.isEmpty ? "unknown" : info;
  }

  static int _parseId(String url) {
    final domens = url.split('/');
    return int.parse(domens.last);
  }
}
