import 'dart:io';

import 'package:flutter/material.dart';
import 'package:rick_and_morty/repositories/character_rep.dart';
import 'rick_and_morty_app.dart';

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
