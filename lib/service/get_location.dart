import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import '../model/character.dart';
import '../model/page.dart';

part 'get_location.g.dart';

@RestApi()
abstract class LocationService {
  factory LocationService(Dio dio, {String baseUrl}) = _LocationService;

  @GET('/location/{id}')
  Future<Location> getLocation(@Path() int id);

  @GET('/location')
  Future<Page<Location>> findLocation({@Query('page') int page,
  @Query('name') String name,
  @Query('type') String type,
  @Query('dimension') String dimension,
  });

  @GET('/location/{ids}')
  Future<List<Location>> getMultipleLocation(@Path() List<int> ids);
}