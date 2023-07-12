import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/screens/find_screen/find_screen_widget.dart';

class RickAndMortyApiApp extends StatelessWidget {
  const RickAndMortyApiApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        useMaterial3: true,
        textTheme: TextTheme(
          headlineLarge: GoogleFonts.montserrat(
            fontSize: 32,
            height: 32 / 40,
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
          headlineSmall: GoogleFonts.montserrat(
            fontSize: 24,
            fontWeight: FontWeight.w700,
            height: 24 / 32,
            color: Colors.white,
          ),
          bodyLarge: GoogleFonts.montserrat(
            fontSize: 16,
            height: 16 / 20,
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
          bodyMedium: GoogleFonts.montserrat(
            fontSize: 14,
            height: 14 / 20,
            fontWeight: FontWeight.w400,
            color: Colors.white54,
          ),
        ),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.black,
          onBackground: Colors.black,
          background: Colors.white,
          primary: Colors.grey[800],
          secondary: Colors.white30,
          onSecondary: Colors.grey[900],
          onPrimary: Colors.white,
          error: Colors.red,
          tertiary: Colors.green,
        ),
      ),
      home: const FindScreenWidget(),
    );
  }
}
