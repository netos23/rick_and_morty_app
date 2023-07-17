import 'package:flutter/material.dart';
import 'package:rick_and_morty/asset/fonts.dart';
import 'package:rick_and_morty/navigation/app_router.dart';

class RickAndMortyApiApp extends StatelessWidget {
  RickAndMortyApiApp({Key? key}) : super(key: key);

  final _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _router.config(),
      theme: ThemeData(
        useMaterial3: true,
        textTheme: TextTheme(
          headlineLarge: Fonts.headlineLarge,
          headlineSmall: Fonts.headlineSmall,
          bodyLarge: Fonts.bodyLarge,
          bodyMedium: Fonts.bodyMedium,
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          onBackground: Colors.black,
          background: Colors.white,
          primary: Colors.grey[800],
          primaryContainer: Colors.grey[200],
          onSecondary: Colors.grey[900],
          onPrimary: Colors.white,
          error: Colors.red,
          secondary: Colors.green,
          tertiary: Colors.blue,
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: Colors.black,
          titleTextStyle: Fonts.headlineLarge,
          centerTitle: true,
          iconTheme: const IconThemeData(
            color: Colors.white,
          )
        )
      ),
    );
  }
}
