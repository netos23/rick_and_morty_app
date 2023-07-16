import 'package:dio/dio.dart';
import 'package:rick_and_morty/dto/rick_and_morty_dto.dart';

import 'package:rick_and_morty/model/location.dart';
import 'package:rick_and_morty/network/rest_client.dart';

class LocationRepository {
  final RestClient _api;

  static LocationRepository? _instance;

  factory LocationRepository() {
    return _instance ??= LocationRepository._(
        RestClient(Dio(BaseOptions(baseUrl: 'https://rickandmortyapi.com'))));
  }

  LocationRepository._(this._api);

  Future<RickAndMortyDto<Location>> getLocationsByPage(int page) {
    return _api.getAllLocationsByPage(page);
  }

  Future<Location> getLocationById(int id) async {
    return _api.getLocation(id);
  }

  Future<RickAndMortyDto<Location>> getLocationsByFilter(
      int page, Map<String, String> queries) {
    return _api.getAllLocationsByFilter(page, queries);
  }

  Future<Location> getLocationByUrl(String url) async {
    var id = url.substring(url.lastIndexOf('/') + 1);
    return _api.getLocation(int.parse(id));
  }

  Future<List<Location>> getLocationsByUrl(List<String> urls) {
    var ids =
        urls.map((url) => url.substring(url.lastIndexOf('/') + 1)).join(',');
    return _api.getLocations(ids);
  }
}
