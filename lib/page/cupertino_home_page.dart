import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty/data/service/character_client.dart';
import 'package:rick_and_morty/data/service/urlConst.dart';

import 'characters_page/characters_page.dart';

class CupertinoHomePage extends StatefulWidget {
  CupertinoHomePage({super.key});

  CharacterClient client = CharacterClient(
    Dio()..options.baseUrl = UrlConst.baseUrl,
  );

  @override
  State<CupertinoHomePage> createState() => _CupertinoHomePageState();
}

class _CupertinoHomePageState extends State<CupertinoHomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    widget.client.getCharacter('1');
    return CupertinoTabScaffold(
        tabBar: CupertinoTabBar(
          items: const [
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.rocket),
              label: 'Персонажи',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.map),
              label: 'Локации',
            ),
            BottomNavigationBarItem(
              icon: Icon(CupertinoIcons.video_camera),
              label: 'Эпизоды',
            ),
          ],
        ),
        tabBuilder: (context, index) {
          return CharactersPage();
        });
  }
}
