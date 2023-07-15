import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:rick_and_morty/data/dto/pagination.dart';
import 'package:rick_and_morty/model/location.dart';

part 'location_client.g.dart';

@RestApi()
abstract class LocationClient {
  factory LocationClient(
      Dio dio, {
        String baseUrl,
      }) = _LocationClient;

  @GET("/api/location")
  Future<Pagination<Location>> getLocations({
    @Query('page') int? page,
    @Query('name') String? name,
    @Query('type') String? type,
    @Query('dimension') String? dimension,
  });

  @GET("/api/location/{id}")
  Future<Location> getLocation(
      @Path() int id,
      );

  @GET("/api/location/{id}")
  Future<List<Location>> getMultipleLocation(
      @Path() String ids,
      );
}