import 'package:dio/dio.dart';
import 'package:elementary/elementary.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/app/app.dart';
import 'package:rick_and_morty/data/error_handler/error_handler.dart';
import 'package:rick_and_morty/data/repo/repos.dart';

class AppDependency extends StatelessWidget {
  const AppDependency({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          Provider<Dio>(
            create: (context) {
              var dio = Dio();

              dio.options.baseUrl = "https://rickandmortyapi.com/api/";
              dio.options.responseType = ResponseType.json;
              return dio;
            },
          ),
          Provider<ErrorHandler>(create: (_) => DefaultErrorHandler()),
          Provider<CharacterRepo>(
            create: (context) => CharacterRepo(context.read()),
          ),
          Provider<EpisodeRepo>(
            create: (context) => EpisodeRepo(context.read()),
          ),
          Provider<LocationRepo>(
            create: (context) => LocationRepo(context.read()),
          ),
        ],
        child: const RickAndMortyApiApp(),
    );
  }
}
