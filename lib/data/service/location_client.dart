import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty/data/service/urlConst.dart';
import 'package:rick_and_morty/model/location/location.dart';

import '../dto/pagination/pagination.dart';

part 'location_client.g.dart';

@RestApi()
abstract class LocationClient {
  factory LocationClient(
    Dio dio, {
    String baseUrl,
  }) = _LocationClient;

  @GET(UrlConst.location)
  Future<Pagination<Location>> getLocation(
      @Query('page') String? page,
      );

  @GET("${UrlConst.location}/{id}")
  Future<Location> getSingleLocation(@Path("id") int id);
}
