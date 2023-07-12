import 'package:rick_and_morty/data/dto/episode/episode_dto.dart';
import 'package:rick_and_morty/data/mapper/episode_parser.dart';

class Episode {
  final int id;
  final String name;

  // ignore: non_constant_identifier_names
  final String airDate;
  final String episode;
  final String created;

  Episode({
    required this.id,
    required this.name,
    required this.airDate,
    required this.episode,
    required this.created,
  });

  factory Episode.fromDto(EpisodeDto dto) => EpisodeParser.fromDto(dto);
}
