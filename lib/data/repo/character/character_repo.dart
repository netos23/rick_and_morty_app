import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty/data/dto/character/character_dto.dart';
import 'package:rick_and_morty/data/dto/wrapper/response_wrapper.dart';

part 'character_repo.g.dart';

@RestApi()
abstract class CharacterRepo {
  factory CharacterRepo(Dio dio, {String baseUrl}) = _CharacterRepo;

  @GET('/character/?page={pageNo}')
  Future<ResponseWrapper<CharacterDto>> getPage(@Path() int pageNo);

  @GET('/character/{id}')
  Future<CharacterDto> get(@Path() int id);
}
