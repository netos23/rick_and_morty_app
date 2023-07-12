import 'package:flutter/material.dart';
import 'dart:async';

typedef LoadingBuilder = Widget Function(BuildContext);
typedef DataBuilder<T> = Widget Function(BuildContext, T?);
typedef ErrorBuilder<T> = Widget Function(BuildContext, dynamic, T?);

class FutureUpdater<T> extends StatefulWidget {
  const FutureUpdater({
    super.key,
    this.loadingBuilder,
    required this.builder,
    this.errorBuilder,
    required this.future,
  });

  final LoadingBuilder? loadingBuilder;
  final DataBuilder<T> builder;
  final ErrorBuilder<T>? errorBuilder;
  final Future<T> future;

  @override
  State<FutureUpdater<T>> createState() => _FutureUpdaterState<T>();
}

class _FutureUpdaterState<T> extends State<FutureUpdater<T>> {
  T? _data;
  dynamic _error;
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    _getData();
  }

  void _getData() async {
    await widget.future.then(
      (data) {
        setState(() {
          _data = data;
        });
      },
      onError: (e) {
        setState(() {
          _error = e;
        });
      },
    );
    _loading = false;
  }

  // ?
  // @override
  // void dispose() {
  //   super.dispose();

  // }

  @override
  Widget build(BuildContext context) {
    final errorBuilder = widget.errorBuilder;

    if (_error != null && errorBuilder != null) {
      return errorBuilder(context, _error, _data);
    }

    final loadingBuilder = widget.loadingBuilder;

    if (_data == null && loadingBuilder != null && _loading == true) {
      return loadingBuilder(context);
    }

    return widget.builder(context, _data);
  }
}
