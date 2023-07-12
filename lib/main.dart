import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;

import 'model/character.dart';
import 'service/service.dart';

Future<void> main() async {
  final dio = Dio();
  dio.options.baseUrl = 'https://rickandmortyapi.com';

  final api = RestClient(dio);
  final ch =  await api.getCharacter(2);
  print(ch);

  final chs =  await api.getCharacters([1, 183]);
  print(chs);
  List<Character> allchs =  await api.getAllCharacters();
  print(allchs);
}