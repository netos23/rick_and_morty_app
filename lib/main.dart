import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rick_and_morty/repositories/character_rep.dart';
import 'rick_and_morty_app.dart';

/// Я же это обязательно прочитаю
/// Пофиксить баг, когда при переходе на нового персонажа из другой табы, сохраняется прокрутка
/// Вынести FutureBuilder из Character/Location/Episode- Page
/// Пофиксить баг, когда FilterButton в CharacterPage неадекватно сжимается при наборе текста
/// При переходе из таба в таб, сначала открываеются все дочерние страницы до нужной
void main() async {
  HttpOverrides.global = MyHttpOverrides();  // TODO удалить перед пушем
  runApp(RickAndMortyApp());
}

class MyHttpOverrides extends HttpOverrides{
  @override
  HttpClient createHttpClient(SecurityContext? context){
    return super.createHttpClient(context)
      ..badCertificateCallback = (X509Certificate cert, String host, int port)=> true;
  }
}
