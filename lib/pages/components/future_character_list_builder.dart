import 'package:flutter/material.dart';
import 'package:rick_and_morty/dto/rick_and_morty_dto.dart';
import 'package:rick_and_morty/model/character.dart';

class FutureCharacterListBuilder extends StatefulWidget {
  const FutureCharacterListBuilder({
    super.key,
    required this.future,
    required this.data,
    required this.fetchDataCallBack,
  });

  final Future<RickAndMortyDto> future;
  final List<Character> data;
  final VoidCallback fetchDataCallBack;

  @override
  State<FutureCharacterListBuilder> createState() =>
      _FutureCharacterListBuilderState();
}

class _FutureCharacterListBuilderState
    extends State<FutureCharacterListBuilder> {
  int page = 1;


  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        } else if (snapshot.hasError) {
          return const Center(
            child: Text('Ошибка загрузки данных'),
          );
        } else {
          return ListView.builder(
            itemCount: widget.data.length,
            itemBuilder: (context, index) {
              if (index != widget.data.length - 1) {
                return Text(widget.data[index].name);
              } else {
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.data[index].name),
                    Center(
                      child: TextButton(
                          onPressed: () {
                            widget.fetchDataCallBack;
                          },
                          child: const Text("Подгрузить данные")),
                    ),
                  ],
                );
              }
            },
          );
        }
      },
    );
  }
}
