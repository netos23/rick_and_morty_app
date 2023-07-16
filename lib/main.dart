import 'package:flutter/material.dart';
import 'package:rick_and_morty/network/util/dio_util.dart';
import 'package:rick_and_morty/rick_and_morty_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await DioUtil().init();
  runApp(RickAndMortyApp());
}
