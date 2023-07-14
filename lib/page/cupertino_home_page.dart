import 'dart:async';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:rick_and_morty/data/dto/pagination/pagination.dart';
import 'package:rick_and_morty/data/service/character_client.dart';
import 'package:rick_and_morty/data/service/urlConst.dart';
import 'package:rick_and_morty/model/character/character.dart';

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
          return CupertinoPageScaffold(
            child: FutureBuilder(
                future: widget.client.getCharacter('1'),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Center(
                      child: Text(snapshot.error!.toString()),
                    );
                  }
                  if (!snapshot.hasData) {
                    return Center(
                      child: CupertinoActivityIndicator(),
                    );
                  }
                  final resultData = snapshot.data?.results ?? [];
                  return ListView.builder(
                      itemCount: resultData.length,
                      itemBuilder: (context, index) {
                        final data = resultData[index];
                        return Padding(padding: EdgeInsets.all(6), child: CupertinoListTile(
                          title: Text(data.name),
                          leading: Image.network(data.image),
                          leadingSize: 64,
                        ),);
                      });
                }),
          );
        });
  }
}
