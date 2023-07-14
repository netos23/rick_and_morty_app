import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty/data/service/urlConst.dart';
import 'package:rick_and_morty/model/character/character.dart';

import '../dto/pagination/pagination.dart';



part 'character_client.g.dart';

@RestApi()
abstract class CharacterClient {
  factory CharacterClient(
      Dio dio, {
        String baseUrl,
      }) = _CharacterClient;

  @GET(UrlConst.character)
  Future<Pagination<Character>> getCharacter(
      @Query('page') String? page,
      );

  @GET("${UrlConst.character}/{id}")
  Future<Character> getSingleCharacter(@Path("id") int id);
}
