import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/service/service.dart';
import 'package:dio/dio.dart';

class RickAndMortyApp extends StatefulWidget {
  const RickAndMortyApp({super.key});

  @override
  State<RickAndMortyApp> createState() => _RickAndMortyAppState();
}

class _RickAndMortyAppState extends State<RickAndMortyApp> {
  final dio = Dio();

  @override
  void initState() {
    super.initState();
  }

  getLocations() async {}

  getEpisodes() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _body()
    );
  }

  FutureBuilder _body() {
    final restClient = RestClient(dio);
    return FutureBuilder(
      future: restClient.getCharacters(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final List<Character> characters = snapshot.data;
          return _characters(characters);
        } else {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }

  Widget _characters(List<Character> characters) {
    return ListView.builder(
      itemCount: characters.length,
      itemBuilder: (context, index) {
        return Container(
          margin: EdgeInsets.all(16),
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.black38, width: 1),
          ),
          child: Column(
            children: [
              Text(
                characters[index].name,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                )
              ),
              Text(
                  characters[index].status
              )
            ],
          )
        );
      },
    );
  }
}
