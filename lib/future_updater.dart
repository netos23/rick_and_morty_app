import 'dart:async';

import 'package:flutter/material.dart';

typedef LoadingBuilder = Widget Function(BuildContext);
typedef DataBuilder<T> = Widget Function(BuildContext, T?);
typedef ErrorBuilder<T> = Widget Function(BuildContext, dynamic, T?);


//добавил это не в 18:00, а в 23:35, прошу прощения
class FutureUpdater<T> extends StatefulWidget {
  const FutureUpdater({
    super.key,
    required this.future,
    required this.builder,
    this.errorBuilder,
    this.loadingBuilder,
  });

  final LoadingBuilder? loadingBuilder;
  final DataBuilder<T> builder;
  final ErrorBuilder<T>? errorBuilder;
  final Future<T> future;

  @override
  State<FutureUpdater> createState() => _FutureUpdaterState<T>();
}

class _FutureUpdaterState<T> extends State<FutureUpdater<T>> {
  T? _data;
  dynamic _error;

  @override
  void initState() {
    super.initState();
    widget.future
        .then((value) => _handleEvent(value))
        .catchError((error) => _handleError(error));
  }

  _handleError(error) {
    setState(() {
      _error = error;
    });
  }

  void _handleEvent(event) {
    setState(() {
      _data = event;
    });
  }

  @override
  void didUpdateWidget(covariant FutureUpdater<T> oldWidget) {
    super.didUpdateWidget(oldWidget);
    widget.future
        .then((value) => _handleEvent(value))
        .catchError((error) => _handleError(error));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final errorBuilder = widget.errorBuilder;
    if (_error != null && errorBuilder != null) {
      return errorBuilder(context, _error, _data);
    }

    final loadingBuilder = widget.loadingBuilder;
    if (_data == null && loadingBuilder != null) {
      return loadingBuilder(context);
    }

    return widget.builder(context, _data);
  }

}
