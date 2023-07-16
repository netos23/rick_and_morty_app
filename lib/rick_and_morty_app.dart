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
    final ValueNotifier<ThemeMode> themeNotifier =
        ValueNotifier(ThemeMode.light);
    return ValueListenableBuilder(
      valueListenable: themeNotifier,
      builder: (BuildContext context, dynamic value, Widget? child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeNotifier.value,
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
                theme: (mode) {
                  (mode == true)
                      ? themeNotifier.value = ThemeMode.dark
                      : themeNotifier.value = ThemeMode.light;
                },
                key: NavigationGenerator.tabNavigator,
              ),
            );
          },
        );
      },
    );
  }
}
