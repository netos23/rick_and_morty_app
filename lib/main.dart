import 'package:flutter/material.dart';
import 'package:rick_and_morty/app_dependencies.dart';
import 'package:rick_and_morty/rick_and_morty_app.dart';
import 'package:rick_and_morty/util/network/dio_util.dart';

void main() async {
  await DioUtil().init();
  runApp(
    const AppDependencies(
      child: RickAndMortyApp(),
    ),
  );
}
