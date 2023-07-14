import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rick_and_morty/dto/rick_and_morty_dto.dart';

typedef FetchData<T> = Future<RickAndMortyDto<T>> Function(int);
typedef CardBuilder<T> = Widget Function(BuildContext, T);

class PaginationList<T> extends StatefulWidget {
  const PaginationList(
      {Key? key, required this.fetchData, required this.cardBuilder})
      : super(key: key);

  final FetchData<T> fetchData;
  final CardBuilder<T> cardBuilder;

  @override
  State<PaginationList<T>> createState() => _PaginationListState();
}

class _PaginationListState<T> extends State<PaginationList<T>> {
  final StreamController<List<T>> _streamController = StreamController();
  List<T> lastPagesData = [];
  int _page = 1;

  @override
  void initState() {
    super.initState();
    getData();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  Future<void> getData() async {
    final pageData = await widget.fetchData(_page++);
    lastPagesData.addAll(pageData.results);
    _streamController.add(lastPagesData);
    // _streamController.add(pageData.results);

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<T>>(
        stream: _streamController.stream,
        builder: (context, snapshot) {
          final data = snapshot.data;
          if (data == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.separated(
              itemBuilder: (context, index) {
                if (index == data.length - 1) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      widget.cardBuilder(context, lastPagesData[index]),
                      Center(
                        child: TextButton(
                            onPressed: () {
                              getData();
                            },
                            child: const Text("Подгрузить данные")),
                      ),
                    ],
                  );
                }
                return widget.cardBuilder(context, lastPagesData[index]);
              },
              separatorBuilder: (context, index) {
                return const SizedBox(
                  height: 16,
                );
              },
              itemCount: data.length);
        },
      ),
    );
  }
}
