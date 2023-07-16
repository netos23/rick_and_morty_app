import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/assets_colors/color_schemes.g.dart';
import 'package:rick_and_morty/navigation/app_router.dart';

class RickAndMortyApp extends StatefulWidget {
  const RickAndMortyApp({super.key});

  @override
  State<RickAndMortyApp> createState() => RickAndMortyAppState();

  // void toggleThemeMode() {}
}

class RickAndMortyAppState extends State<RickAndMortyApp> {
  final AppRouter _router = AppRouter();
  ThemeMode _currentThemeMode = ThemeMode.dark;

  void toggleThemeMode() {
    setState(() {
      _currentThemeMode = _currentThemeMode == ThemeMode.dark
          ? ThemeMode.light
          : ThemeMode.dark;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: _router.config(),
      themeMode: _currentThemeMode,
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
