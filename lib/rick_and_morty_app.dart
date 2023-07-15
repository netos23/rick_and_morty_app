import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/page/cupertino_home_page.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return CupertinoApp(
      theme: const CupertinoThemeData(/*
        brightness: Brightness.light,*/
        primaryColor: Colors.green,
      ),
      routes: {
        '/home': (context)=> CupertinoHomePage(),
      },
      initialRoute: '/home',
      home: CupertinoHomePage(),
    );
  }
}
