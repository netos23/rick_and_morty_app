import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rick_and_morty/navigation/app_router.dart';
import 'package:rick_and_morty/navigation/generate_navigator.dart';
import 'package:rick_and_morty/pages/home_page/home_page.dart';

import 'assets/color_schemes.g.dart';

class RickAndMortyApp extends StatelessWidget {
  RickAndMortyApp({super.key});

  final AppRouter _router = AppRouter();

  @override
  Widget build(BuildContext context) {
    final themeNotifer = context.watch<ValueNotifier<ThemeMode>>();
    return MaterialApp.router(
      routerConfig: _router.config(
        navigatorObservers: () => [
          HeroController(),
        ],
      ),
      themeMode: themeNotifer.value,
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

class WrongWidget extends StatefulWidget {
  WrongWidget({
    super.key,
    required this.id,
  }) {
    controller.add(id);
    controller.stream.listen((event) {
      print(event);
    });
  }

  int id;
  StreamController<int> controller = StreamController();

  @override
  State<WrongWidget> createState() => _WrongWidgetState();
}

class _WrongWidgetState extends State<WrongWidget> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: widget.controller.stream,
      builder: (context, snapshot) {
        return Text(snapshot.data!.toString());
      },
    );
  }
}
