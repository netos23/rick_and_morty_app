import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty/dto/location_dto.dart';
import 'package:rick_and_morty/model/location.dart';
//import '../model/character.dart';

part 'service_location.g.dart';

@RestApi()
abstract class LocationService {
  factory LocationService(Dio dio, {String baseUrl}) = _LocationService;

  @GET('/api/location/{id}')
  Future<Location> getLocation(@Path() int id);

  @GET('/api/location')
  Future<LocationDto> getAllLocation(
    @Query('name') String name,
    @Query('type') String type,
    @Query('dimension') String dimension,
  );
  @GET('/api/location')
  Future<LocationDto> getAllLocations();

  @GET('/api/location/{ids}')
  Future<List<Location>> getLocations(@Path() List<int> ids);
}