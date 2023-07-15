import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/data/service/service.dart';

class AppDependencies extends StatelessWidget {
  const AppDependencies({
    super.key,
    this.child,
  });

  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) => Dio()
        ..options.baseUrl = 'https://rickandmortyapi.com'
        ..interceptors.add(
          PrettyDioLogger(),
        ),
      child: Provider(
        create: (context) => CharacterClient(
          context.read(),
        ),
        child: child,
      ),
    );
  }
}
