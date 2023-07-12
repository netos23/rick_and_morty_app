import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/service/service_location.dart';

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
  final allchs =  await api.getAllCharacter();
  print(allchs);
  final allchsby =  await api.getAllCharacters('Rick Sanchez', 'Alive', 'Human', 'Male', 'Soulless Puppet');
  print(allchsby);

  final loc_api = LocationService(dio);
  final loc =  await loc_api.getLocation(2);
  print(loc);
  final locs =  await loc_api.getLocations([1, 183]);
  print(locs);
  final allloc =  await loc_api.getAllLocations();
  print(allloc);
  final alllocby =  await loc_api.getAllLocation('Testicle Monster Dimension', 'Dimension', 'Testicle Monster Dimension');
  print(alllocby);

}