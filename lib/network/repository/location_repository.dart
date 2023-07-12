import 'package:dio/dio.dart';
import 'package:rick_and_morty/network/dto/location/location_list.dart';
import 'package:rick_and_morty/network/model/location/location.dart';
import 'package:rick_and_morty/network/service/service.dart';


class LocationRepository{
  LocationRepository(this._restService);

  final RestService _restService;

  Future<Location> getLocation(int id) async {
    try {
      final result = await _restService.getLocation(id);
      return result;
    } on DioException catch (error) {
      throw Exception(
        error.response?.data['message'],
      );
    }
  }

  Future<LocationList> getLocations() async {
    try {
      final result = await _restService.getLocations();
      return result;
    } on DioException catch (error) {
      throw Exception(
        error.response?.data['message'],
      );
    }
  }
}