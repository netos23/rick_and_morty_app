import 'package:dio/dio.dart';
import 'package:rick_and_morty/dto/rick_and_morty_dto.dart';
import 'package:rick_and_morty/model/episode.dart';
import 'package:rick_and_morty/network/rest_client.dart';

class EpisodeRepository {
  final RestClient _api;

  static EpisodeRepository? _instance;

  factory EpisodeRepository() {
    return _instance ??= EpisodeRepository._(
        RestClient(Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com'))));
  }

  EpisodeRepository._(this._api);

  Future<Episode> getEpisodeByUrl(String url) {
    var id = url.substring(url.lastIndexOf('/') + 1);
    return _api.getEpisode(int.parse(id));
  }

  Future<List<Episode>> getEpisodesByUrl(List<String> urls) {
    var ids =
        urls.map((url) => url.substring(url.lastIndexOf('/') + 1)).join(',');
    return _api.getEpisodes(ids);
  }

  Future<RickAndMortyDto<Episode>> getLocationsByPage(int page) {
    return _api.getAllEpisodesByPage(page);
  }

  Future<RickAndMortyDto<Episode>> getLocationsByFilter(
      int page, Map<String, String> queries) {
    return _api.getAllEpisodesByFilter(page, queries);
  }
}
