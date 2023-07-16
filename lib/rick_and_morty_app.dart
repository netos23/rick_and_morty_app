import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/assets/colors/color_schemes.g.dart';
import 'package:rick_and_morty/navigation/app_router.dart';

class RickAndMortyApp extends StatelessWidget {
  RickAndMortyApp({super.key});

  final AppRouter _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router.config(),
      themeMode: ThemeMode.light,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: lightColorScheme,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
      darkTheme: ThemeData(
        useMaterial3: true,
        colorScheme: darkColorScheme,
        textTheme: GoogleFonts.montserratTextTheme(),
      ),
    );
  }
}
