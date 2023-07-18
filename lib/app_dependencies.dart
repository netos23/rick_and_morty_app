import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/data/service/character_client.dart';
import 'package:rick_and_morty/data/service/episode_client.dart';
import 'package:rick_and_morty/data/service/location_client.dart';

class AppDependencies extends StatelessWidget {
  const AppDependencies({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (context) => Dio()
            ..interceptors.add(
              PrettyDioLogger(),
            )
            ..options.baseUrl = 'https://rickandmortyapi.com',
        ),
        Provider(
          create: (context) => CharacterClient(
            context.read(),
          ),
        ),
        Provider(
          create: (context) => EpisodeClient(
            context.read(),
          ),
        ),
        Provider(
          create: (context) => LocationClient(
            context.read(),
          ),
        ),
        ChangeNotifierProvider(
          create: (context) => ValueNotifier(ThemeMode.dark),
        ),
      ],
      child: child,
    );
  }
}
