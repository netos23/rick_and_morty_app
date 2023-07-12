import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rick_and_morty/service/api_service.dart';
import 'package:rick_and_morty/widget/future_updater_widget.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final dio = Dio();
    dio.options.baseUrl = 'https://rickandmortyapi.com';
    final api = RestClient(dio);

    Character? characters;

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        title: const Text('wubba lubba dub dub'),
      ),
      body: FutureUpdater(
        future: api.getCharacterData(2).then(
          (value) {
            debugPrint(value.toString());
            characters = value;
          },
        ),
        errorBuilder: (_, __, ___) {
          return const Center(
            child: Text('Приключения на 20 минут'),
          );
        },
        loadingBuilder: (e) {
          print(e);
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        builder: (p0, p1) {
          return Center(
            child: Text('${characters?.episode[1]}'),
          );
        },
      ),
    );
  }
}
