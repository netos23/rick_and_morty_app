import 'package:rick_and_morty/data/dto/episode/episode_dto.dart';
import 'package:rick_and_morty/data/model/episode.dart';

class EpisodeParser {
  static Episode fromDto(EpisodeDto dto) {
    return Episode(
      id: dto.id,
      name: dto.name,
      airDate: dto.air_date,
      episode: dto.episode,
      created: dto.created,
    );
  }

}
