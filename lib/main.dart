import 'dart:async';
import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:rick_and_morty/rick_and_morty_app.dart';

import 'model/character.dart';
import 'service/service.dart';

Future<void> main() async {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RaMdemo',
      theme: ThemeData (
        primarySwatch: Colors.purple,
      ),
      home: RickAndMortyApp(),
    );
  }
}
