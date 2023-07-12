import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';
import 'package:rick_and_morty/data/dto/character/character_dto.dart';

part 'character_repo.g.dart';

@RestApi()
abstract class CharacterRepo {
  factory CharacterRepo(Dio dio, {String baseUrl}) = _CharacterRepo;

  @GET('/character')
  Future<List<CharacterDto>> getAll();

  @GET('/character/{id}')
  Future<CharacterDto> get(@Path() int id);
}
