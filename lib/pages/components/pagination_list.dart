import 'dart:async';

import 'package:flutter/material.dart';
import 'package:rick_and_morty/dto/rick_and_morty_dto.dart';

typedef FetchData<T> = Future<RickAndMortyDto<T>> Function(
    int, Map<String, String>);
typedef CardBuilder<T> = Widget Function(BuildContext, T);

class PaginationList<T> extends StatefulWidget {
  const PaginationList(
      {Key? key,
      required this.fetchData,
      required this.cardBuilder,
      required this.sliverGridDelegate,
      this.loadFactor = 0.95,
      required this.queries})
      : super(key: key);

  final double loadFactor;
  final FetchData<T> fetchData;
  final CardBuilder<T> cardBuilder;
  final SliverGridDelegate sliverGridDelegate;

  final Map<String, String> queries;

  @override
  State<PaginationList<T>> createState() => _PaginationListState();
}

const int elementInPage = 20;

class _PaginationListState<T> extends State<PaginationList<T>> {
  final StreamController<List<T>> _streamController = StreamController();
  final ScrollController _scrollController = ScrollController();
  List<T> lastPagesData = [];
  int _page = 1;
  int? _count;

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_listenScroll);
    getData();
  }

  void _listenScroll() {
    final extent = _scrollController.position.maxScrollExtent;
    final loadFactor = widget.loadFactor;
    if (_scrollController.offset > extent * loadFactor) {
      getData();
    }
  }

  @override
  void dispose() {
    _scrollController.removeListener(_listenScroll);
    _streamController.close();
    _scrollController.dispose();
    super.dispose();
  }

  Future<void> getData() async {
    try {
      final pageData = await widget.fetchData(_page++, widget.queries);
      _count ??= pageData.info.count;
      lastPagesData.addAll(pageData.results);
      _streamController.add(lastPagesData);
    } catch (e) {
      debugPrint("Ошибка подгрузки данных");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<T>>(
        stream: _streamController.stream,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          }
          final data = snapshot.data;
          if (data == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return GridView.builder(
              controller: _scrollController,
              gridDelegate: widget.sliverGridDelegate,
              itemBuilder: (context, index) {
                return widget.cardBuilder(context, lastPagesData[index]);
              },
              itemCount: data.length);
        },
      ),
    );
  }
}
