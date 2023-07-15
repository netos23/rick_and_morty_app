import 'package:flutter/material.dart';
import 'package:rick_and_morty/app_dependencies.dart';
import 'package:rick_and_morty/rick_and_morty_app.dart';

void main() {
  runApp(
    AppDependencies(
      child: RickAndMortyApp(),
    ),
  );
}
