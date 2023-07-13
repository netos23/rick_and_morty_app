import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/service/character_client.dart';
import 'package:rick_and_morty/model/character.dart';
import 'package:rxdart/rxdart.dart';

class CharacterListPage extends StatefulWidget {
  const CharacterListPage({
    super.key,
    required this.client,
  });

  final CharacterClient client;

  @override
  State<CharacterListPage> createState() => _CharacterListPageState();
}

const _refreshSize = 0.8;

class _CharacterListPageState extends State<CharacterListPage> {
  final BehaviorSubject<List<Character>> _controller = BehaviorSubject();
  final ScrollController _scrollController = ScrollController();
  int _page = 0;

  @override
  void initState() {
    super.initState();
    _loadCharacters();
    _scrollController.addListener(_listenScroll);
  }

  void _listenScroll() {
    if (_scrollController.position.pixels >
        _scrollController.position.maxScrollExtent * _refreshSize) {
      _loadCharacters();
    }
  }

  Future<void> _loadCharacters() async {
    try {
      final lastPages = _controller.valueOrNull ?? [];
      final pagination = await widget.client.getCharacters(
        (_page++).toString(),
      );
      final results = pagination.results;
      lastPages.addAll(results);

      _controller.add(List.of(lastPages));
    } catch (e) {
      print(e);
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Error'),
        ),
      );
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_listenScroll);
    _scrollController.dispose();
    _controller.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Character>>(
          stream: _controller.stream,
          builder: (context, snapshot) {
            final characters = snapshot.data;

            if (characters == null) {
              return const Center(
                child: CupertinoActivityIndicator(),
              );
            }

            return ListView.separated(
              controller: _scrollController,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(characters[index].name),
                );
              },
              separatorBuilder: (_, __) => const Divider(),
              itemCount: characters.length,
            );
          }),
    );
  }
}
