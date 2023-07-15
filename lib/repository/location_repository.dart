import 'package:dio/dio.dart';
import 'package:rick_and_morty/dto/pagination/pagination.dart';
import 'package:rick_and_morty/model/location/location.dart';
import 'package:rick_and_morty/service/service.dart';

class LocationRepository{
  LocationRepository(this._restService);

  final CharacterClient _restService;

  Future<Location> getLocation(int id) async {
    try {
      final result = await _restService.getLocation(id);
      return result;
    } on DioException catch (error, stackTrace) {
      throw Exception(
        '$error, $stackTrace',
      );
    }
  }

  Future<Pagination<Location>> getLocations() async {
    try {
      final result = await _restService.getLocations();
      return result;
    } on DioException catch (error, stackTrace) {
      throw Exception(
        '$error, $stackTrace',
      );
    }
  }
}