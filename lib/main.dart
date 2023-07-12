import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/repo/character/character_repo.dart';

Future<void> main() async {
  final dio = Dio();
  dio.options.baseUrl = "https://rickandmortyapi.com/api/";
  dio.options.responseType = ResponseType.json;
  CharacterRepo characterRepo = CharacterRepo(dio);
  final data = await characterRepo.getPage(1);
  debugPrint(data.toString());
  runApp(const Placeholder());

}
