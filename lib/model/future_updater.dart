import 'dart:async';

import 'package:flutter/material.dart';

typedef DataBuilder<T> = Widget Function(BuildContext, T?);
typedef ErrorBuilder<T> = Widget Function(BuildContext, dynamic, T?);
typedef LoadingBuilder = Widget Function(BuildContext);

class FutureUpdater<T> extends StatefulWidget {
  FutureUpdater(
      {required this.future,
      required this.builder,
      this.errorBuilder,
      this.loadingBuilder,
      super.key});

  Future<T> future;
  DataBuilder<T> builder;
  ErrorBuilder<T>? errorBuilder;
  LoadingBuilder? loadingBuilder;

  @override
  State<FutureUpdater<T>> createState() => _FutureUpdaterState();
}

class _FutureUpdaterState<T> extends State<FutureUpdater<T>> {
  T? _data;
  dynamic _error;

  @override
  void initState() {
    super.initState();
    widget.future
      ..then((value) {
        _handleEvent(value);
      })
      ..catchError((error) {
        _handleError(error);
      });
  }

  void _handleError(error) {
    setState(() {
      _error = error;
    });
  }

  void _handleEvent(value) {
    setState(() {
      _data = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    final errorBuilder = widget.errorBuilder;
    if (_error != null && errorBuilder != null) {
      return errorBuilder.call(context, _error, _data);
    }
    final loadingBuilder = widget.loadingBuilder;
    if (_data == null && loadingBuilder != null) {
      return loadingBuilder.call(context);
    }
    return widget.builder(context, _data);
  }
}
