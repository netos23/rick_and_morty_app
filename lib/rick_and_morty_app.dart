import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/router/app_router.dart';

class RickAndMortyApp extends StatelessWidget {
  RickAndMortyApp({super.key});

  final AppRouter _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.white,
          background: Colors.white,
        ),
        textTheme: TextTheme(
          headlineLarge: const TextStyle(
            fontSize: 16,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.bold,
            height: 24 / 16,
          ),
          titleMedium: GoogleFonts.roboto(
            fontSize: 20,
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w500,
            color: const Color(0xFF8E8E93),
          ),
        ),
      ),
    );
  }
}
