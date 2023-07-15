import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/service/character_client.dart';
import 'package:rick_and_morty/data/service/urlConst.dart';
import 'package:rick_and_morty/page/characters_page/character_card.dart';

class CharactersPage extends StatelessWidget {
  CharactersPage({super.key});

  //todo будет провайдер
  final _client = CharacterClient(Dio()..options.baseUrl = UrlConst.baseUrl);

  @override
  Widget build(BuildContext context) {
    final themeData = CupertinoTheme.of(context);
    return CupertinoPageScaffold(
      child: FutureBuilder(
          future: _client.getCharacter('1'),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error!.toString()),
              );
            }
            if (!snapshot.hasData) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }
            final resultData = snapshot.data?.results ?? [];
            return ListView.builder(
                itemCount: resultData.length,
                itemBuilder: (context, index) {
                  final data = resultData[index];
                  return CharacterCard(data: data);
                });
          }),
    );
  }
}
