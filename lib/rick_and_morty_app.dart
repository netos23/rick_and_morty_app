import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/pages/character_page/characters_page.dart';
import 'package:rick_and_morty/route/app_router.dart';

class RickAndMortyApp extends StatelessWidget {
  RickAndMortyApp({super.key});
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _appRouter.config(),
      theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xFFFFFFFF),
              background: const Color(0xFFFFFFFF),
              secondary: const Color(0xFF000000),
              primary: const Color(0x892196F3),
              tertiary: const Color(0xFFE3F2Fd)),
          textTheme: TextTheme(
            headlineMedium: GoogleFonts.karla(
              fontWeight: FontWeight.w700,
              fontSize: 24,
            ),
            headlineLarge: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              fontSize: 32,
            ),
            headlineSmall: GoogleFonts.roboto(
              fontWeight: FontWeight.w500,
              height: 30 / 20,
              fontSize: 20,
              color: const Color(0xFF000000),
            ),
            bodyLarge: GoogleFonts.roboto(
              fontWeight: FontWeight.w700,
              fontSize: 16,
            ),
            bodySmall: GoogleFonts.roboto(
              fontWeight: FontWeight.w400,
              height: 21 / 14,
              fontSize: 14,
            ),
          )),
      debugShowCheckedModeBanner: false, // да, мы в матрице

    );
  }
}
