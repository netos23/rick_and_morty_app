import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rick_and_morty/data/dto/location/location_dto.dart';

part 'location_repo.g.dart';

@RestApi()
abstract class LocationRepo {
  factory LocationRepo(Dio dio, {String baseUrl}) = _LocationRepo;

  @GET('/character')
  Future<LocationDto> getAll();

  @GET('/character/{id}')
  Future<LocationDto> get(@Path() int id);
}
