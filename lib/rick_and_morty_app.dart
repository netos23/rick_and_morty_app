import 'package:flutter/material.dart';
import 'package:rick_and_morty/pages/screen_page.dart';

class RickAndMortyApp extends StatelessWidget {
  const RickAndMortyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const MainScreen(),
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color.fromARGB(255, 97, 221, 101),
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.red,
        ),
      ),
    );
  }
}
