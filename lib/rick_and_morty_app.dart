import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rick_and_morty/navigation/navigator/navigation_generator.dart';
import 'package:rick_and_morty/pages/home_page/home_page.dart';
import 'assets/color_schemes.g.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      themeMode: ThemeMode.dark,
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
      onGenerateRoute: (settings) {
        return CupertinoPageRoute(
          settings: settings,
          builder: (context) => HomePage(
            key: NavigationGenerator.tabNavigator,
          ),
        );
      },
    );
  }
}
