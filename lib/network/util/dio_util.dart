import 'package:dio/dio.dart';
import 'package:rick_and_morty/network/repository/character_repository.dart';
import 'package:rick_and_morty/network/repository/episode_repository.dart';
import 'package:rick_and_morty/network/repository/location_repository.dart';
import 'package:rick_and_morty/network/service/service.dart';


class DioUtil {
  static final DioUtil _instance = DioUtil._internal();

  factory DioUtil() => _instance;

  DioUtil._internal();

  final Dio dio = Dio();

  late final RestService restService;
  late final CharacterRepository characterRepository  = CharacterRepository(restService);
  late final EpisodeRepository episodeRepository = EpisodeRepository(restService);
  late final LocationRepository locationRepository = LocationRepository(restService);

  Future<void> init() async {
    const timeout = Duration(seconds: 60);

    dio.options.baseUrl = 'https://rickandmortyapi.com';
    dio.options
      ..responseType = ResponseType.json
      ..connectTimeout = timeout
      ..receiveTimeout = timeout
      ..sendTimeout = timeout;

    restService = RestService(dio);

  }
}
