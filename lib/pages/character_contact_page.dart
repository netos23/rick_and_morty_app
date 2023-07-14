import 'package:flutter/material.dart';
import 'package:rick_and_morty/dto/character/character_list.dart';
import 'package:rick_and_morty/repository/character_repository.dart';
import 'package:rick_and_morty/util/dio_util.dart';
import 'package:rick_and_morty/widgets/future_updater.dart';
import 'package:rick_and_morty/model/character/character.dart';

class CharacterPage extends StatefulWidget {
  const CharacterPage({
    super.key,
  });

  @override
  State<CharacterPage> createState() => _CharacterPageState();
}

class _CharacterPageState extends State<CharacterPage> {
  final CharacterRepository _characterRepository =
      DioUtil().characterRepository;

  late Future<Character> _character;

   @override
  void initState() {
    super.initState();
    _character = getCharacter(2);
  }

  Future<Character> getCharacter(int id) async {
    final res = await _characterRepository.getCharacter(id);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Contacts'),
      ),
      body: Column(
        children: [
          FutureUpdater<Character>(
            future: _character,
            loadingBuilder: (context) => const CircularProgressIndicator(),
            errorBuilder: (context, error, data) => Text('$error'),
            builder: (context, data) {
              final character = data;
              return ListTile(
                leading: CircleAvatar(
                  backgroundImage: NetworkImage(character?.image ?? ''),
                ),
                title: Text(character?.name ?? "Name"),
                subtitle: Text('Status: ${character?.status ?? 'Status'}'),
              );
            },
          ),
        ],
      ),
    );
  }
}
