import 'package:flutter/material.dart';
import 'package:rick_and_morty/data/dto/pagination/pagination.dart';
import 'package:rick_and_morty/model/character/character.dart';
import 'package:rick_and_morty/repository/character_repository.dart';
import 'package:rick_and_morty/util/network/dio_util.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  final CharacterRepository _characterRepository =
      DioUtil().characterRepository;

  @override
  void initState() {
    super.initState();
  }

  Future<Pagination<Character>> getCharacters() async {
    final res = await _characterRepository.getCharacters();
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Contacts'),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
