import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:redux/redux.dart';
import 'package:rick_and_morty/app_dependencies.dart';
import 'package:rick_and_morty/favourites/favourites.dart';
import 'package:rick_and_morty/rick_and_morty_app.dart';

void main() {
  final store = Store<Set<int>>(appReducer, initialState: {});

  runApp(
    StoreProvider(
      store: store,
      child: AppDependencies(
        child: RickAndMortyApp(),
      ),
    ),
  );
}
