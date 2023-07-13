
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

import '../model/location/location.dart';

part 'service.g.dart';

@RestApi(baseUrl: "https://rickandmortyapi.com/api")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/location")
  Future<List<Location>> getLocation();
  @GET("/location/{id}")
  Future<Location> getSingleLocation(@Path("id") int id);
}
